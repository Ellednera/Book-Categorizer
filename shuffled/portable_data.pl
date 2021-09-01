#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( revive preserve_as_yaml ) ;

my $book_nerve = revive( "shuffled_book.nerve" );
$book_nerve->preserve_as_yaml( "shuffled_book_nerve.yml" );

# besiyata d'shmaya




