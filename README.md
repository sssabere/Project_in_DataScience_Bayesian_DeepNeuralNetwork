# Project_in_DataScience_Bayesian_DeepNeuralNetwork
## Data File for Combine_CNN_BLR.ipynb

The data required to run Combine_CNN_BLR.ipynb is not included in this repository but It can be downloaded shared Drive folder.
Follow these steps:

1. Download the data file from [a public Google Drive folder](https://drive.google.com/drive/folders/1pcT3Md9fMlrWPXrMy8W_DS72sEvPCarS?usp=drive_link) called “Project in DS”.
Inside it, you’ll find the dataset required for Combine_CNN_BLR.ipynb.

2. Place the data file inside your repository directory, for example:

repository/
├── Combine_CNN_BLR.ipynb
├── Project in DS/
│   └── [your data files here]


## Dataset for CNN_version_2

The dataset used in the notebook **CNN_version2.ipynb** is **not included in this repository** since GitHub does not allow files larger than 100 MB.

Instead get the dataset from this repository:  
👉 [guilhermedom / cnn-fashion-mnist](https://github.com/guilhermedom/cnn-fashion-mnist) 

After downloading, place the data under a file called data_copy. 

### Dataset Splitting & Model Training Pipeline

The following diagram illustrates how the dataset is divided and how the models are trained, validated, and tested:

![Dataset Split](data_split.jpeg)

- Training dataset is split into two parts:  
  - 60% is used for training individual models (CNN and Bayes)
    - Each of these subsets is further split into 90% training and 10% validation 
    - CNN is trained with 85% dropout rate, while Bayes is trained with 15% dropout.  
  - 40% is used for training the combined model, with 70% for training/validation and 30% for testing (the test set includes various levels of degradation).  
👉 Find the code for the split here: [split.ipynb](./split.ipynb)
- Test dataset (provided separately) is used for final evaluation of all models.
