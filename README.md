<!-- PROJECT TITLE -->
<h1 align="center">Email Spam Detection Using Machine Learning</h1>

<!-- PROJECT DESCRIPTION -->
## <br>**➲ Project description**
Email spam detection system is used to detect email spam using Machine Learning technique called Natural Language Processing and Python, where we have a dataset contain a lot of emails by extract important words and then use naive classifier we can detect if this email is spam or not.

<!-- PREREQUISTIES -->
## <br>**➲ Prerequisites**
This is list of required packages and modules for the project to be installed :
* <a href="https://www.python.org/downloads/" target="_blank">Python 3.x</a>
* Pandas
* Flask
* Numpy
* Scikit-learn
* NLTK
* joblib
* python-dateutil
* pytz
* scipy
* six
* threadpoolctl
* tzdata
* Werkzeug

Install all required packages :
 ```sh
  pip install -r requirements.txt
  ```

<!-- THE DATASET -->
<h2 align="left">📊 <b>Dataset</b></h2>
Human activites dataset contain about 5157 record which is a sample of an email
and a target column "spam" which describe the state of an email spam or not.<br>

Note: The datasets that are created in our project has been uploaded here : [Datasets](https://docs.google.com/spreadsheets/d/1tjGYeCYGzsEDdT9VKCCSRA5O6ism7KFwboflFMFPxyk/edit?usp=sharing)


<!-- CODING SECTIONS -->
## <br>**➲ Coding Sections**
In this part we will see the project code divided to sections as follows:
<br>

 ### Section 1 | The Data :<br>
In this section we aim to do some operations on the dataset before training the model on it,
processes like :
 1. Importing Libraries:<br>
    The code begins by importing the necessary libraries, including NumPy for numerical operations and Pandas for data manipulation.

 2. Listing Input Data Files:<br>
    The script uses the os library to list all the files in the `/kaggle/input/` directory. This is done to understand the available data files.
    
 4. Reading Data:<br>
    The code reads a CSV file `spam.csv` located in the `/kaggle/input/spam-email/` directory using Pandas. The data is stored in the `data` DataFrame.
    
 6. Exploring Data:<br>
    The script prints the columns of the DataFrame using data.columns.It then prints information about the DataFrame using `data.info()`, providing details about the data types and non-null counts for each column.
    The code checks for missing values using `data.isna().sum()`.

7. Creating a Binary Target Variable:<br>
   A new column `Spam` is created in the DataFrame, where the value is 1 if the `Category` column is `spam`, and 0 otherwise.

8. Splitting Data:<br>
   The data is split into training and testing sets using the `train_test_split` function from `scikit-learn`. The features `Message` are represented by `X_train` and `X_test`, while the target variable `Spam` is represented by `y_train` and `y_test`. The test size is set to 25%.

9. Text Processing using CountVectorizer:<br>
    The script uses the CountVectorizer from `scikit-learn` to convert the text data `Message` into matrices of token counts. This step is essential for preparing the text data for machine learning algorithms.

10. Creating a Naive Bayes Classifier Pipeline:<br>
    A pipeline is created using `scikit-learn`'s Pipeline class. This pipeline consists of two steps:
      * Step 1: `vectorizer` - CountVectorizer to convert text data into numerical matrices.
      * Step 2: `nb` - Multinomial Naive Bayes classifier (MultinomialNB).



### Section 2 | The Model :<br>
The dataset is ready for training, so we create a naive classifier using `scikit-learn` and thin fit it to the data, and finally we evaluate the model by getting accuracy, classification report and confusion matrix<br>


<!-- INSTALLATION -->
## ➲ Installation
   ```sh
   git clone https://github.com/AzouKr/Email-Spam-Detection-Using-Machine-Learning.git
   ```

<!-- RUNNING -->
## ➲ Run and Work with the Model
1. Start the Flask app:
   ```sh
   flask --app app --debug run
   ```
2. Use the Model API :
   ```sh
   @app.route("/check_email_spam", methods=["POST"])
   ```
3. Use the Model API :
* The request Body :
   ```sh
   {
     "email": ["hello this is a simple email"]
   }
   ```
* The response :
   ```sh
   {
     "spam": false
   }
   ```

* The request Body :
   ```sh
   {
     "email": ["Will u meet ur dream partner soon? Is ur career off 2 a flyng start? 2 find out free, txt HORO followed by ur star sign, e. g. HORO ARIES"]
   }
   ```
* The response :
   ```sh
   {
     "spam": true
   }
   ```
