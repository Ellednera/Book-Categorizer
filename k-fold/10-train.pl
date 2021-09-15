#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

use Data::Dumper;

use AI::Perceptron::Simple qw( revive preserve_as_yaml);

use constant { K => 5, EXPECTED_NAME => "brand" };

# wake up the nerves :)
my @nerves_data = glob("15-*.nerve");
# say for @nerves;

my @nerves = map {
    [ revive($_), $_ ]
} @nerves_data;

#say $_->[0] for @nerves; die;
#say Dumper(\@nerves); die;

# train one by one
# training: each fold 1 time, should be more, but anyway

# testing_fold_n => { training_data =>[], testing_data =>"" }
my %stimuli_folds = ( 
    fold_1 => { 
        train => [ qw( 05-fold_2.csv  05-fold_3.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_1.csv",
               },
    fold_2 => { 
        train => [ qw( 05-fold_1.csv  05-fold_3.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_2.csv",
               },
    fold_3 => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_4.csv  05-fold_5.csv )  ],
        test => "05-fold_3.csv",
               },
    fold_4 => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_3.csv  05-fold_5.csv )  ],
        test => "05-fold_4.csv",
               },
    fold_5 => { 
        train => [ qw( 05-fold_1.csv  05-fold_2.csv  05-fold_3.csv  05-fold_4.csv )  ],
        test => "05-fold_5.csv",
               },
);

#say Dumper( $stimuli_folds );
#say $_->[0]->learning_rate for @nerves; die;

# train by default
say "We can skip the training process and go straight to the testing\n".
    "if you want to.";
print "Train the neurons? (y/n) ";
chomp( my $response = <STDIN>);

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
        say "Taming $nerve_file..." if fc($response) ne fc("n");
        for my $training_fold ( @training_data ) {
            # skip training process, test instead
            last if fc($response) eq fc("n");

            #say $nerve->learning_rate, "->", $nerve_file;
            say "  Stimuli: $training_fold";
            
            die "Oi! '$training_fold' does not exist! Wrong filename perhaps?" 
                if !-e $training_fold;

            # should probably train more times before moving to next fold
            $nerve->tame( $training_fold, EXPECTED_NAME, $nerve_file);

        }
        say "Done taming!" if fc($response) ne fc("n"); #sleep(1);

        # test
          # test and write to a new file -> tested_data dir
          # output filename: $fold.$nerve_filename.csv
          # eg 05-fold_1.fold_1_test.15-book_nerve_lr_0.5.csv
        say "Testing $nerve_file...";
        say "  Stimuli: $testing_data";
        #my $new_test_data_name = $testing_data =~ s/.csv$//r;
        # since fold N == tested fold data, maybe leave it out
        my $new_nerve_file = $nerve_file =~ s/.nerve$//r;
        my $tested_dir = "tested_data";
        my $path =  "$tested_dir/tested_$fold.$new_nerve_file.csv";
        #say "  Writing to: ", $path;
        $nerve->take_real_exam({
            stimuli_validate => $testing_data,
            predicted_column_index => 5,
            results_write_to => $path });
        say "Done testing!";

        # to be continued... :)
        # mean of confusion matrix
        # glob files based on nerve filename
        # this part should be out of this loop honestly
        say "Collecting stats...Done!";

        # prepare for new block of output
        say "";

        #sleep(1); # might be too much if dataset is huge
    }
    
}

# besiyata d'shmaya
