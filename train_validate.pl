#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple;
use Data::Dumper;

use constant { 
    # need for training
    TRAINING_DATA => "data/yilin_mp520_train_20.csv",
    EXPECTED_NAME => "brand", WANT_STATS => 1, IDENTIFIER => "book_name",
    # needed for validation
    VALIDATION_DATA => "data/yilin_mp520_validate_10.csv",
    VALIDATION_DATA_OUTPUT_FILE => "data/validated.csv"
};

my $plasticity = 0.08153;
my @dendrites = qw( male_present	female_present	total_people_1	total_people_2	total_people_3	total_people_4	total_people_5_n_above	has_flowers	flower_coverage_more_than_half	has_leaves	leaves_coverage_more_than_half	has_trees	trees_coverage_more_than_half	has_other_living_things	has_fancy_stuff	has_gold_items	has_silver_items	has_bronze_items	title_decoration_very_fancy	title_towards_KaiTi	title_multiple_colors	has_obvious_inanimate_objects	red_shades	blue_shades	yellow_shades	orange_shades	green_shades	purple_shades	brown_shades	black_shades	overall_red_dominant	overall_green_dominant	overall_yellow_dominant	overall_pink_dominant	overall_purple_dominant	overall_orange_dominant	overall_blue_dominant	overall_brown_dominant	overall_black_dominant	overall_white_dominant
 );

# max N 1's
# min N 1 == all 0 ==> min = 0.00
my $threshold = scalar @dendrites * 8;

my $book_nerve = AI::Perceptron::Simple->new( {
    threshold => $threshold,
    learning_rate => 0.10565,
    initial_value => $plasticity,
    attribs => \@dendrites,
} );


my $nerve_file = "yilin_mp520.nerve";
my %c_matrix;
for (1..12) {
#while (1) {
    say "Training... Round $_";
    $book_nerve->tame( TRAINING_DATA, EXPECTED_NAME, $nerve_file, 1, "book_name");

    $book_nerve->take_mock_exam( { 
        stimuli_validate => VALIDATION_DATA,
        predicted_column_index => 5,
        results_write_to => VALIDATION_DATA_OUTPUT_FILE,
    } );
    
    %c_matrix = $book_nerve->get_confusion_matrix( {
        full_data_file => VALIDATION_DATA_OUTPUT_FILE,
        actual_output_header => EXPECTED_NAME,
        predicted_output_header => "predicted",
     } );
    
    say "Accuracy is only $c_matrix{accuracy}%, training again in 1 second :)";

    sleep( 1 );
    say "";

}
say "Done training! Here are the results after validation:";
$book_nerve->display_confusion_matrix( \%c_matrix, { 
    zero_as => "MP520", one_as => "Yi Lin" 
} );

# besiyata d'shmaya


