#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple ":portable_data";

my @dendrites = qw(male_present	female_present	total_people_1	total_people_2	total_people_3	total_people_4	total_people_5_n_above	has_flowers	flower_coverage_more_than_half	has_leaves	leaves_coverage_more_than_half	has_trees	trees_coverage_more_than_half	has_other_living_things	has_fancy_stuff	has_gold_items	has_silver_items	has_bronze_items	title_decoration_very_fancy	title_towards_SongTi	title_multiple_colors	has_obvious_inanimate_objects	red_shades	blue_shades	yellow_shades	orange_shades	green_shades	purple_shades	brown_shades	black_shades	overall_red_dominant	overall_green_dominant	overall_yellow_dominant	overall_pink_dominant	overall_purple_dominant	overall_orange_dominant	overall_blue_dominant	overall_brown_dominant	overall_black_dominant	overall_white_dominant
);

my $nerve = AI::Perceptron::Simple->new( {
    initial_value => 0,
    learning_rate => 537,
    threshold => -55000,
    attribs => \@dendrites,
} );


my @files = <train*.csv>;
#say for @files;
my $expected_column_name = "brand";
my $nerve_file = "mp520_jourstar.nerve";

say "Training...";
#$nerve->tame( $files[0], $expected_column_name, $nerve_file, 1, "book_name" );
for (1..15) {
    say "Round $_";
    
    for my $file ( @files ) {
        say "  Training $file...";
        for (1..10) {
            $nerve->tame( $file, $expected_column_name, $nerve_file );    
        }   
    }
}
say "Done training!";

preserve_as_yaml($nerve, "mp520_jourstar.yml");

# besiyata d'shmaya












