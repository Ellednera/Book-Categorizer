#!/usr/bin/perl

use strict;
use warnings;
#use 5.010;
use utf8;

use AI::Perceptron::Simple "revive";

use constant { 
    TESTING_DATA => "yilin_mp520_test_10.csv",
    EXPECTED_COLUMN_NAME => "品牌", WANT_STATS => 1, IDENTIFIER => "book_name",
};

my $book_nerve = revive "shuffled_book.nerve";
my $tested_file = "shuffled_tested.csv";

$book_nerve->work_in_real_world( {
    stimuli_validate => TESTING_DATA,
    predicted_column_index => 5,
    results_write_to => $tested_file,
} );

my %matrix = $book_nerve->get_confusion_matrix( {
    full_data_file => $tested_file,
    actual_output_header => EXPECTED_COLUMN_NAME,
    predicted_output_header => "predicted",
} );

$book_nerve->display_confusion_matrix( \%matrix, { 
    zero_as => "MP520", one_as => "Yi Lin" } );

# besiyata d'shmaya




