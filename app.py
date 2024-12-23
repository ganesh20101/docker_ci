from flask import Flask

# Initialize the Flask application
app = Flask(__name__)

# Define a route for the root URL
@app.route('/')
def hello():
    return "Hello, cloud-engine labs!!"

if __name__ == '__main__':
    # Run the app on port 8080, listening on all interfaces (0.0.0.0)
    app.run(host='0.0.0.0', port=8080)
