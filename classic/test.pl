#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use utf8;

use AI::Perceptron::Simple "revive";

use constant TEST_DATA => "data/yilin_mp520_test_10.csv";
my $nerve_file = "yilin_mp520.nerve";


my $book_nerve = revive( $nerve_file );

# predicted values back into original file
$book_nerve->work_in_real_world( {
    stimuli_validate => TEST_DATA,
    predicted_column_index => 5,
} );

my %c_matrix = $book_nerve->get_confusion_matrix( {
    full_data_file => TEST_DATA,
    actual_output_header => "品牌",
    predicted_output_header => "predicted",
 } );

$book_nerve->display_confusion_matrix( \%c_matrix, { 
    zero_as => "Merry 520", one_as => "Yi Lin" 
} );

say "Done testing, have a nice day :)";

# besiyata d'shmaya



