# Book-Categorizer
Categorize Books using Perceptrons. 

This is just for fun :)

All you need to do is to key in the characteristics of the book cover in the data file. Then train, validate and test :)

Currently available categories are "魅丽优品"，"意林"，"聚星天华", "魅丽文化".

The module AI::Perceptron::Simple is used for the programs. So you need to download it from CPAN or you can look for it in my other repo named "AI-Perceptron-Simple".

The files are not categorized correctly yet. 
 - The scripts under the "main" directory is the classical model and it uses the data from "data" directory. This will be reorganized in the future :)
   - The "data" directory should only contain the original datasets and the "book_labels" file
 - The model trained using the shuffling method and its related datasets are all under the "shuffled" directory.
