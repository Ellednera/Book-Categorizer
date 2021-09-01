#!/usr/bin/perl

use strict;
use warnings;
#use 5.010;

use AI::Perceptron::Simple "revive";

use constant { 
    VALIDATION_DATA => "yilin_mp520_validate_10.csv",
    EXPECTED_COLUMN_NAME => "brand", WANT_STATS => 1, IDENTIFIER => "book_name",
};

my $book_nerve = revive "shuffled_book.nerve";
my $validated_file = "shuffled_validated.csv";

$book_nerve->validate( {
    stimuli_validate => VALIDATION_DATA,
    predicted_column_index => 5,
    results_write_to => $validated_file,
} );

my %matrix = $book_nerve->get_confusion_matrix( {
    full_data_file => $validated_file,
    actual_output_header => "brand",
    predicted_output_header => "predicted",
} );

$book_nerve->display_confusion_matrix( \%matrix, { 
    zero_as => "MP520", one_as => "Yi Lin" } );

# besiyata d'shmaya




