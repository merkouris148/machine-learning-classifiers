# machine-learning-classifiers
An implementation of k-nearest neighbours, Euclidean and naive Bayes classifiers in Matlab/Octave.

## Input Data

In this project we classify pixels of a hyperspectral image, there are 5 classes given. The given data are located in the files:

1. Salinas_hyperspectral.mat
2. classification_labels.mat

For same pixels the label is uknown (encoded with the label ```0```). In this project we only consider the pixels of **known labels**. The given hyperspectral image is of size 150x150, where every pixel is a 204-dimentional vector. The given data set is divided in three sets:

1. Training set
2. Test set
3. Operational set

The "operational" set corresponds to the data the classifiers would classify in a real world application (the unknown data).

## Classifiers

To classify the unknown pixels, we use the following three methods:

1. [k-Nearest Neighbors classification](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)
2. Minimal [Euclidean Distance](https://en.wikipedia.org/wiki/Euclidean_distance) classification
3. [Naive Bayes classification](https://en.wikipedia.org/wiki/Naive_Bayes_classifier)

In **k-Nearest Neighbours classification** we use the [cross validation](https://en.wikipedia.org/wiki/Cross-validation_(statistics)) method to estimate the parameter k. k may range between 1 and 17. The best k is estimated by the programme. In **Minimal Euclidean Distance classification** we estimate the medians of the given classes, assuming the data follow the [normal distribution](https://en.wikipedia.org/wiki/Normal_distribution). In **Naive Bayes classification** we estimate the median and the variance of the given classes. Again, we assume the data to follow the normal distribution.

All the classifiers are implemented in Matlab-classes, located in the folders starting with ```@```.

## Output

At the end of the classification the confusion matrices are printed for every classifier. Also the classification is visualized in the images that are created throughout the programme's execution. The programme creates a folder ```figures``` where all the figures are saved.

## Notes
* For clarity, in this project we use **column vectors**. Often, we will encode list of vectors as **matlab-matrices** of size 204xn (see Input Data above).
* This code has been tested in [Octave](https://www.gnu.org/software/octave/) versions 4.2.2 and 5.2.0. You can run the code using the command ```octave ./project```. This code hasn't been tested in Matlab, although Octave and Matlab are generally compatible.
* There is a detailed description of this assignment in the file ``` 	Project - Αναγνώριση Προτύπων 2017-2018.pdf``` (in Greek). Also, some conclusions of the statistical properties of the data set and the evaluation of the classifiers are presented in the file ```αναφορά.pdf``` (in Greek).
