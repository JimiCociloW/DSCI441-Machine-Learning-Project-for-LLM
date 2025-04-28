# DSCI441-Machine-Learning-Project-for-TopicModeling-&-Sentimental-Analytics
DSCI441 Machine Learning Project

Author: Jimmy(Jiamin) Wang

# Topic-Driven Sentiment Classification in Song Lyrics

## Project Overview
This project explores **LDA-based topic modeling** to analyze song lyrics from **1960 to 2019**, uncovering latent themes and tracking their evolution over time. Additionally, it integrates **machine learning classifiers** to **automate sentiment classification** based on **LDA topic features**, employing statistical methods to validate the significance of topics in predicting sentiment polarity.

## Dataset
The dataset used in this study is sourced from the **Genius API** and can be found on Kaggle:  
🔗 [Genius Song Lyrics with Language Information](https://www.kaggle.com/datasets/carlosgdcj/genius-song-lyrics-with-language-information/data)

The dataset includes the following key variables:
- **Title** (Song Name)
- **Tag** (Music Genre)
- **Artist** (Singer)
- **Year** (Release Year)
- **Lyrics** (Song Lyrics)

The raw dataset initially contained **5,134,856** songs. After **data cleaning and filtering**, the final dataset for **LDA analysis** consists of **97,404** songs.

## Research Objectives
1. **Identify latent topics** in song lyrics using **LDA topic modeling** (e.g., love, rebellion, social criticism).  
2. **Perform time-series analysis** to track topic evolution from **1960 to 2019** and observe emerging or declining themes.  
3. **Analyze genre differences** in topic distribution across **Pop, Rock, Hip-Hop, and Country** music.  
4. **Assess topic coherence** over different time periods to evaluate whether **lyrical themes have stabilized**.  
5. **Integrate sentiment classification** using **Logistic Regression, SVM, and XGBoost**, testing the significance of LDA topics in sentiment prediction.  
6. **Statistically validate** the relationship between **topics and sentiment labels** using **Chi-square tests, Bootstrap resampling, and confidence interval analysis**.

## Methodology
### **Data Preprocessing**
- **Remove non-lyrical text** (e.g., poems, fictional passages).
- **Keep only English lyrics**.
- **Filter songs from 1960-2019**.
- **Apply stemming and stopword removal**.
- **Generate N-Grams (bigrams) and extract TF-IDF features**.

### **LDA Topic Modeling**
- **Train an LDA model** to extract **50 optimal topics**.
- **Optimize hyperparameters** using **Perplexity and Coherence scores**.
- **Re-rank topics** based on **coverage and variance**.

### **Sentiment Classification**
- **Sentiment Labeling**:  
  - Use **RoBERTa** to generate sentiment scores (0-1).  
  - Define **thresholds** (**>0.6 as positive, <0.4 as negative**) to create binary sentiment labels.

- **Machine Learning Models**:  
  - **Baseline**: Logistic Regression (MLE)  
  - **Advanced**: SVM (RBF Kernel), Random Forest, XGBoost  
  - **Feature Engineering**:  
    - LDA topic distributions (50-dimensions)  
    - Metadata (genre, release year)

- **Evaluation Metrics**:  
  - **Confusion Matrix, F1-Score, AUC-ROC Curves**  
  - **SHAP Value Analysis** for interpretability  

### **Statistical Validation**
- **Chi-square tests** to test the independence of topics and sentiment labels.  
- **Bootstrap resampling (1,000 iterations)** to compute **95% confidence intervals** for classification accuracy.  

## References
1. Laoh, E., Surjandari, I., & Febirautami, L. R. (2018). *Indonesian’s Song Lyrics Topic Modelling Using LDA.*  
2. Moura, L. M. G. D., et al. (2024). *Temporal Analysis and Visualization of Music Using LDA.*  
3. Song, Y., Pan, S., Liu, S., & Zhou, M. (2009). *Topic and Keyword Re-ranking for LDA-based Topic Modeling.*  

## Future Work
- Extend analysis to **multi-class sentiment classification** (e.g., neutral sentiment).  
- Experiment with **BERT-based topic modeling** for **context-aware topic extraction**.  
- Explore **causal inference** between musical trends and societal events.  

## Contributors
**Jimmy(Jiamin) Wang** - DSCI 441 Milestone Project  
**Project Duration**: 2024  
