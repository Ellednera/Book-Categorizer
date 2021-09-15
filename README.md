# Book-Categorizer
Categorize Books using Perceptrons. 

This is just for fun :)

All you need to do is to key in the characteristics of the book cover in the data file. Then train, validate and test :)

Currently available categories are "魅丽优品"，"意林"，"聚星天华", "魅丽文化".

The module AI::Perceptron::Simple is used for the programs. So you need to download it from CPAN or you can look for it in my other repo named "AI-Perceptron-Simple".

## About the Directories
### book_list
This is where the original dataset and anything related live in

### classic
The classic model to train nerves

### k-fold
K-fold cross validation. For now, it uses k=5 for 3 neurons. Only the learning rate differs.

#### k-fold/tested_data
This is the tested data written into new files for inspection if necessary.

The naming follows the convention: *tested_$fold.$new_nerve_file.csv* where *$fold* represents the 1st layer key in the *%stimuli_folds* hash and 
*$new_nerve_file* is the modified nerve filename without the ".nerve" section. All original data are kept intact.

*The mean of confusion matrix stats is still incomplete*

### shuffled
The nerve trained using the shuffling method
