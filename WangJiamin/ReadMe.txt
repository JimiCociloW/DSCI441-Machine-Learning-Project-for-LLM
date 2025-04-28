---

# Topic-Driven Sentiment Classification in Song Lyrics

---

## Project Description

This project aims to classify the **sentiment** (positive or negative) of song lyrics based on their **underlying topics** rather than using direct sentiment scores alone.  
We first apply **Latent Dirichlet Allocation (LDA)** to extract thematic structures from lyrics, and then build machine learning models (Logistic Regression and SVM) to predict sentiment labels using the extracted topic distributions, genre, and release year as input features.  
Statistical validation techniques such as **Bootstrap Resampling** and **Chi-square tests** are used to verify model robustness and the relationship between topics and sentiment.

Additionally, a simple **Streamlit web app** is created for users to input lyrics and get predicted sentiment labels interactively.

---

## Data Source

The dataset used in this project is `filtered_song_lyrics.csv`, which contains:
- **97,404 songs**  
- Attributes:
  - `title`: song title
  - `tag`: genre (e.g., pop, rap, rock)
  - `artist`: artist name
  - `year`: release year
  - `lyrics`: full text of the song lyrics

Preprocessing steps include cleaning missing values, tokenization, and stopword removal.

**Note**: Due to copyright restrictions, the actual lyrics data file is not included in the public repository. Only the sample processed data and code are provided.

---

## Packages Required

Here is the list of major packages used:

| Package | Purpose |
|:---|:---|
| `pandas` | Data processing |
| `nltk` | Text preprocessing, stopword removal, VADER sentiment analysis |
| `gensim` | LDA topic modeling |
| `scikit-learn` | Feature engineering, machine learning modeling (Logistic Regression, SVM) |
| `matplotlib`, `seaborn` | Visualization (ROC curves, heatmaps) |
| `shap` | Model interpretation (SHAP value analysis) |
| `streamlit` | Building the demo web application |

You can install them via:

```bash
pip install pandas nltk gensim scikit-learn matplotlib seaborn shap streamlit
```

---

## How to Run the Code

1. **Clone the Repository:**
```bash
git clone https://github.com/your_username/your_project_name.git
cd your_project_name
```

2. **Install Required Packages:**
```bash
pip install -r requirements.txt
```

3. **Train Models (Optional for Testing):**
- Run the provided `training_pipeline.ipynb` notebook to:
  - Train the LDA model
  - Train Logistic Regression and SVM models
  - Save the trained models and dictionary

4. **Run Streamlit Web App:**
```bash
streamlit run app.py
```
- This will launch a local server where you can input song lyrics and get real-time topic and sentiment predictions.

