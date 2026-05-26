from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def hello():
    return jsonify({
        "message": "Hello from Chandu DevOps Project!",
        "version": "1.0.0"
    })

@app.route("/healthz")
def health():
    return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
