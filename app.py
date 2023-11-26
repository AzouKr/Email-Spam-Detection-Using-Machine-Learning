from flask import Flask,request, jsonify
import joblib

# Load the trained model
loaded_model = joblib.load('./Model/EmailSpamTrainedModel.joblib')


app = Flask(__name__)


@app.route("/check_email_spam", methods=["POST"])
def email_spam():
    # Access the JSON data from the request body
    data = request.get_json()

    predictions = loaded_model.predict(data.get("email"))
    if predictions == [1]:
        result = {"spam": True}
    else:
        result = {"spam": False}

    return jsonify(result)