#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use AI::Perceptron::Simple qw( revive preserve_as_yaml);

use constant { K => 5, EXPECTED_NAME => "brand" };

# wake up the nerves :)
my @nerves_data = glob("15-*.nerve");
# say for @nerves;

my @nerves = map {
    [ revive($_), $_ ]
} @nerves_data;

#say $_->[0] for @nerves; die;
#use Data::Dumper; say Dumper(\@nerves); die;

# train one by one
# training: each fold 1 time, should be more, but anyway

# testing_fold_n => { training_data =>[], testing_data =>"" }
my %stimuli_folds = ( 
    fold_1_test => { 
        train => [ qw( 05-fold_2.csv  05-fold_3.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_1.csv",
               },
    fold_2_test => { 
        train => [ qw( 05-fold_1.csv  05-fold_3.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_2.csv",
               },
    fold_3_test => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_3.csv",
               },
    fold_4_test => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_3.csv  05-fold_5.csv )  ],
        test => "05-fold_4.csv",
               },
    fold_5_test => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_3.csv  05-fold_4.csv )  ],
        test => "05-fold_5.csv",
               },
);

use Data::Dumper;
#say Dumper( $stimuli_folds );
#say $_->[0]->learning_rate for @nerves; die;

for my $nerve_n_filename ( @nerves ) {
    # $nerve_n_filename->[0, 1] will cause problems
    my $nerve = $nerve_n_filename->[0];
    my $nerve_file = $nerve_n_filename->[1];
    #say Dumper($nerve, $nerve_file); die;

    for my $fold ( sort keys %stimuli_folds ) {

        my @training_data = @{$stimuli_folds{ $fold }->{ train }};
        my $testing_data = $stimuli_folds{ $fold }->{ test };

        #say Dumper(\@training_data, $testing_data);

        # train
        say "Taming $nerve_file...";
        for my $training_fold ( @training_data ) {
            #say $nerve->learning_rate, "->", $nerve_file;
            say "  Stimuli: $training_fold";
            
            die "Oi! '$training_fold' does not exist! Wrong filename perhaps?" 
                if !-e $training_fold;

            # should probably train more times before moving to next fold
            $nerve->tame( $training_fold, EXPECTED_NAME, $nerve_file);

        }
        say "Done taming!"; #sleep(1);

        # to be continued... :)
        # test
        say "Testing $nerve_file...";
        say "  Stimuli: $testing_data";
        say "Done testing!";

        # mean of confusion matrix
        say "Collecting stats...Done!";

        # prepare for new block of output
        say "";

        #sleep(1); # might be too much if dataset is huge
    }
    
}

# besiyata d'shmaya
