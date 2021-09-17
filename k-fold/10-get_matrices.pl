#/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Cwd;
use Data::Dumper;

use AI::Perceptron::Simple qw( revive );
use YAML;

# wake up the nerves :)
my @nerves_data = glob("15-*.nerve");

my @nerves = map {
    [ revive($_), $_ ]
} @nerves_data;

mkdir ("confusion_matrices", 0755) if !-e "confusion_matrices";
chdir( "tested_data" );
#say cwd;

my $matrices = [];

for my $nerve_n_filename ( @nerves ) {
    my $nerve = $nerve_n_filename->[0];
    my $nerve_file = $nerve_n_filename->[1];
    my $nerve_file_without_extension = $nerve_file =~ s/.nerve$//r;    

    my @tested_data = glob( "*$nerve_file_without_extension*" );
    #say for @tested_data;

    say "Collecting stats from:";    
    for $_ ( @tested_data ) {
        print " -> $_ ... ";
        
        my %c_matrix = $nerve->get_confusion_matrix( {
            full_data_file => $_,
            actual_output_header => "brand",
            predicted_output_header => "predicted",
            more_stats => 1,
        } );
        
        push @$matrices, \%c_matrix;
        
        say "Done!";
    }
    
    #say Dumper($matrices);
    #save matrices, move out of "tested_data" then save
    YAML::DumpFile( "../confusion_matrices/$nerve_file_without_extension.matrices", $matrices);
    $matrices = []; # clear for next nerve's c_matrices
    say "";
}

say "Done collecting stats!";
say "All the stats are stored under 'confusion_matrices' directory."

