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

*Currently, this is only completed up till the training stage*

### shuffled
The nerve trained using the shuffling method
