#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple ":local_data";

my $nerve = revive( "mp520_jourstar.nerve" );

my $validation_data = "test.csv";

$nerve->work_in_real_world( { 
    stimuli_validate => $validation_data,
    predicted_column_index => 5,
} );

my %c_matrix = $nerve->get_confusion_matrix( { 
    full_data_file => $validation_data, 
    actual_output_header => "brand",
    predicted_output_header => "predicted",
} );

$nerve->display_confusion_matrix( \%c_matrix, { 
    zero_as => "MP520",
    one_as => "Jourstar",
} );

# besiyata d'shmaya





