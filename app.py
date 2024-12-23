from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello, World!"

if __name__ == '__main__':
    # Make sure to bind to all interfaces (0.0.0.0) so it's accessible outside the container
    app.run(host='0.0.0.0', port=8080)
