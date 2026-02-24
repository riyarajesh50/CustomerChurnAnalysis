import joblib

model = joblib.load("model.pkl")

def predict(data):
    return model.predict(data)