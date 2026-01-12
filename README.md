# Bayesian Regressors as a Fallback for Deep Neural Networks

This respository contains the code for a project investigating how deep learning and Bayesian models behave on degraded input data, and whether meta-learning can combine their strengths. A convolutional neural network (CNN) was trained on image data combined with a Bayesian logistic regression (BLR) model using stacking based meta-learners. 

The experiments are conducted on the Fashion-MNIST dataset with systematically degraded inputs to simulate missing or low-quality information. 

## Repository structure

- `BLR_on_fashion_mnist_Ludvig-2.ipynb`
  Bayesian multinomial logistic regression trained on Fashion-MNIST.

- `cnn_split_dropout_new_bayesian.ipynb`
  CNN training and calibration (temperature scaling).

- `CNN_distribution_shifting_*.ipynb`
  Experiments to evaluate CNN performance under different types of distribution shift and image degradation:
  - salt and pepper noise
  - mixed transformations
  - class imbalance shifts

- `meta_learners_std_cnn.ipynb`
  Training and evaluation of meta-learners (Logistic Regression, Gradient Boosting, MLP) that combine CNN and BLR predictions. 

- `README.md`
  Project documentation

## Dataset

The experiments use the Fashion-MNIST dataset (70,000 grayscale image across 10 classes).

Due to GitHub file size limits, the dataset is not included in this repository. 

You can obtain it from:

👉 https://github.com/guilhermedom/cnn-fashion-mnist

After downloading, place the dataset in a directory named: data_copy/ so it can match the code. 

## Data Splitting and Degradation Setup 
- The original training set (60,000 images) is slpit into: 
  - 90% training
  - 10% validation (used for calibration and model selection)

- The test set (10,000 images) is used for final evaluation.

Different degardation levels are used to study how model performance and uncertainty change as input quality deteriorates. 

## Model Training 

- CNN
  Trained on clean images and calibrated using temperature scaling.

- BLR
  Trained independently and provides posterior predictive uncertainty.

- Meta-learners
  Use the class probabilities from CNN and BLR, together with BLR uncertainty estimates, as input features.
  Each meta-learner is trained seperately for each degradation level. 

## Evaluation Metrics 

Models are evaluated using: 
- Accuracy
- Negative Log Likelihood (NLL)
- Akaike Information Criterion (AIC) for meta-learners

These metrics are reported across degradation levels to asses robustness, calibration and model complexity. 
