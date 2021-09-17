#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple;
use YAML; use Cwd; use Term::ANSIColor;
#use Encode qw(encode);

#use Data::Dumper;

chdir("confusion_matrices");

my $dummy_nerve = AI::Perceptron::Simple->new( { initial_value => 0.5, attribs => [] } );
my @matrices_file = glob("*.matrices");

for my $neuron_stats_file ( @matrices_file ) {
    my $matrices_array_ref = YAML::LoadFile( $neuron_stats_file );
    #say Dumper( $matrices_array_ref ); say "";
    
    my $neuron_name = $neuron_stats_file =~ s/.matrices$/.nerve/r;
    
    say colored ( "\nStats for $neuron_name", "bold bright_green" );
    
    my $mean_matrix = calculate_mean_matrix( $dummy_nerve, $matrices_array_ref, 5 );
    $dummy_nerve->display_exam_results( $mean_matrix, { 
        #zero_as => "MP520", one_as => encode("UTF-8", "意林")
        zero_as => "MP520", one_as => "Yi Lin"
    } );
    
    print colored ( "Press ENTER to continue", "bold bright_yellow"); <>;
}

say colored ("That's all. Have a nice day :)\n", "bold bright_blue");


sub calculate_mean_matrix {
    my ($dummy_nerve, $matrices_array_ref, $k) = @_;
    my %mean_matrix = (
        'negative_predicted_value' => 0, 'true_positive' => 0, 'false_negative' => 0,
        'true_negative' => 0, 'F1_Score' => 0, 'false_negative_rate' => 0,
        'false_omission_rate' => 0, 'specificity' => 0, 'sensitivity' => 0,
        'false_discovery_rate' => 0, 'false_positive_rate' => 0, 'false_positive' => 0,
        'accuracy' => 0, 'precision' => 0, 'total_entries' => 0, 'balanced_accuracy' => 0,
    );
    
    # sum
    for my $c_matrix ( @$matrices_array_ref ) {
        for ( keys %mean_matrix ) {
            $mean_matrix{ $_ } += $c_matrix->{ $_ };
        }
    }
    # mean
    for (keys %mean_matrix) {
        next if $_ eq "true_negative"; next if $_ eq "true_positive";
        next if $_ eq "false_negative"; next if $_ eq "false_positive";
        next if $_ eq "total_entries";
        
        $mean_matrix{ $_ } /= $k;
    }
    
    \%mean_matrix;
}

# besiyata d'shmaya



