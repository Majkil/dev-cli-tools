String flaskMainAppContent =
    """ # Importing flask module in the project is mandatory
# An object of Flask class is our WSGI application.
from flask import Flask, render_template, url_for, request, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
 
# Flask constructor takes the name of
# current module (__name__) as argument.
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
db = SQLAlchemy(app)

 
# The route() function of the Flask class is a decorator,
# which tells the application which URL should call
# the associated function.
@app.route('/')
# ‘/’ URL is bound with hello_world() function.
def index():
    return render_template('index.html')
 
# main driver function
if __name__ == "__main__":
    # run() method of Flask class runs the application
    # on the local development server.
    app.run()
""";

String flaskIndexHTML(String appName) {
  return """<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$appName</title>
</head>

<body>
<h2>Do not forget to activate the environemnt </h2>
<p>By using the cmd in the root directory</p>
<p> ./venv/scripts/activate</p>

<p>Run in powershell as Administrator if you have issues running the activate command</p>
<p> Set-ExecutionPolicy RemoteSigned</p>
<p> Then Run in powershell as Administrator to revert back to the previous setting</p>
<p> Set-ExecutionPolicy restricted</p>

</body>

</html> """;
}

String flaskRequirements = """
Click
flask
flask_sqlalchemy
gunicorn
itsdangerous
Jinja2
MarkupSafe
SQLAlchemy
Werkzeug""";
