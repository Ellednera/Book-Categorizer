#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple;

use constant { 
    # need for training
    EXPECTED_COLUMN_NAME => "brand", WANT_STATS => 1, IDENTIFIER => "book_name",
};

my $plasticity = 1.15;
my @dendrites = qw( male_present	female_present	total_people_1	total_people_2	total_people_3	total_people_4	total_people_5_n_above	has_flowers	flower_coverage_more_than_half	has_leaves	leaves_coverage_more_than_half	has_trees	trees_coverage_more_than_half	has_other_living_things	has_fancy_stuff	has_gold_items	has_silver_items	has_bronze_items	title_decoration_very_fancy	title_towards_SongTi	title_multiple_colors	has_obvious_inanimate_objects	red_shades	blue_shades	yellow_shades	orange_shades	green_shades	purple_shades	brown_shades	black_shades	overall_red_dominant	overall_green_dominant	overall_yellow_dominant	overall_pink_dominant	overall_purple_dominant	overall_orange_dominant	overall_blue_dominant	overall_brown_dominant	overall_black_dominant	overall_white_dominant
 );

my $book_nerve = AI::Perceptron::Simple->new( {
    initial_value => $plasticity,
    threshold => 25,
    attribs => \@dendrites,
} );

my @shuffled_data = qw( 
    shuffled_1_yilin_mp520_train_20.csv  shuffled_2_yilin_mp520_train_20.csv
    shuffled_3_yilin_mp520_train_20.csv  shuffled_4_yilin_mp520_train_20.csv
    shuffled_5_yilin_mp520_train_20.csv
);

for my $file ( @shuffled_data ) {
    say "Training using $file";
    
    for ( 1..2 ) {
        $book_nerve->tame( $file, EXPECTED_COLUMN_NAME, "shuffled_book.nerve", 
                            WANT_STATS, IDENTIFIER );
    }
    
    sleep 1;
    say "";
}

# besiyata d'shmaya




