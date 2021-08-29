#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( revive preserve_as_yaml ) ;

my $book_nerve = revive( "yilin_mp520.nerve" );
$book_nerve->preserve_as_yaml( "yilin_mp520.yml" );

# besiyata d'shmaya




