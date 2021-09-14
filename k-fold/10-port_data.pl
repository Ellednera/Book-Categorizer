#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( revive preserve_as_yaml );

my @sleeping_nerves = glob("*.nerve");
#say for @nerves;

for my $sleepy_nerve ( @sleeping_nerves ) {

    my $yaml_filename = $sleepy_nerve =~ s/.nerve$/.yml/r;
    #say $yaml_filename," from " , $sleepy_nerve;
    preserve_as_yaml( revive ( $sleepy_nerve ), $yaml_filename );
}

# besiyata d'shmaya


