#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( :portable_data :local_data );
use Data::Dumper;
use YAML;
$YAML::LoadBlessed = 1; # if using AI::Perceptron::Simple 1.03, fixed in 1.04

my @yaml_nerves = glob("*.yml");
# say for @yaml_nerves;

for my $yaml_nerve ( @yaml_nerves ) {
    my $nerve = revive_from_yaml( $yaml_nerve );
    # say Dumper $nerve; die;
    my $storable_nerve = $yaml_nerve =~ s/.yml$/.nerve/r;
    # say $storable_nerve;
    preserve( $nerve, $storable_nerve );
}


# besiyata d'shmaya


