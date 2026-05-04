# Heart Disease Risk Analysis

SQL + Python project analyzing 1000+ patient records to identify 
lifestyle and clinical risk factors associated with heart disease.

## Business Problem
Healthcare providers need to identify high-risk patients early.
This analysis surfaces the strongest predictors of heart disease
to support preventive care prioritization.

## Tools Used
- Python (pandas) — data cleaning and preprocessing
- MySQL — structured querying and risk analysis
- Dataset: Kaggle Heart Disease Dataset

## Key Findings
- Patients with both High Blood Pressure and Diabetes 
  represent a compounded high-risk segment
- Low-exercise + high-stress is the most common lifestyle 
  combination among heart disease patients
- Heart disease patients average significantly fewer 
  sleep hours than healthy patients
- High LDL + Low HDL cholesterol co-occurrence identified 
  as a measurable % of total patient base
- High alcohol consumption present in X% of heart 
  disease positive cases

## Analysis Performed
- Risk factor ranking: Blood Pressure vs Smoking vs 
  High Cholesterol by frequency
- Cholesterol comparison across gender groups
- BMI averages segmented by disease status
- Age group distribution of heart disease cases (30-40, 40-50, 50+)

## How to Run
```bash
pip install pandas mysql-connector-python
# Run data_cleaning.ipynb first, then execute Heart_disease.sql
```

## Files
- `python_project.ipynb` — data cleaning
- `Heart_disease.sql` — all SQL analysis queries
# heart-disease-risk-analysis.
