#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( preserve preserve_as_yaml );

my $plasticity = 0.8153;
my $learning_rate = [0.01, 0.5, 2.5];
my @dendrites = qw( male_present  female_present  total_people_1  total_people_2  total_people_3  total_people_4  total_people_5_n_above  has_flowers  flower_coverage_more_than_half  has_leaves  leaves_coverage_more_than_half  has_trees  trees_coverage_more_than_half  has_other_living_things  has_fancy_stuff  has_gold_items  has_silver_items  has_bronze_items  title_decoration_very_fancy  title_towards_SongTi  title_multiple_colors  has_obvious_inanimate_objects  red_shades  blue_shades  yellow_shades
  orange_shades  green_shades  purple_shades  brown_shades  black_shades  overall_red_dominant  overall_green_dominant  overall_yellow_dominant  overall_pink_dominant  overall_purple_dominant  overall_orange_dominant  overall_blue_dominant  overall_brown_dominant  overall_black_dominant  overall_white_dominant
 );
my $threshold = scalar @dendrites * 8;

# create 3 different nerves, save them

for ( 0..$#$learning_rate ) {
    #say "$_";
    # create
    my $nerve = AI::Perceptron::Simple->new( {
        initial_value => $plasticity,
        learning_rate => $learning_rate->[$_],
        threshold => $threshold, 
        attribs => \@dendrites,
    } );

    # save
    preserve($nerve, "15-book_nerve_lr_". $learning_rate->[$_] .".nerve");
    preserve_as_yaml(
        $nerve, "15-book_nerve_lr_". $learning_rate->[$_] .".yml");
}

# besiyata d'shmaya

