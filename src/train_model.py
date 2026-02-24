import pandas as pd
from sklearn.ensemble import RandomForestClassifier
import joblib

df = pd.read_csv("data/cleaned_telco_churn.csv")
df = pd.get_dummies(df, drop_first=True)

X = df.drop('Churn_Yes', axis=1)
y = df['Churn_Yes']

model = RandomForestClassifier()
model.fit(X, y)

joblib.dump(model, "model.pkl")