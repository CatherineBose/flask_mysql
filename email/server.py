from flask import Flask, render_template, request, redirect, session, flash
from mysqlconnection import MySQLConnector
import flask
import re

app = Flask(__name__)
mysql = MySQLConnector(app,'friendsdb')
app.secret_key = "ThisIsSecret!"

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
@app.route('/', methods=['GET'])
def index():
  return render_template("index.html")

@app.route('/login', methods=['POST','GET'])
def submit():
    isform_valid= True
    isGoodForm =1

    if (flask.request.method == 'POST'):
        
        if len(request.form['email']) < 1:
            flash("Email cannot be blank!")
            isform_valid = False
        # else if email doesn't match regular expression display an "invalid email address" message
        if not EMAIL_REGEX.match(request.form['email']):
            flash("Invalid Email Address!")
            isform_valid = False
        enteredEmail = request.form['email']
        print "enteredEmail: ", enteredEmail
        queryToGetEmails = "Select email from emails"
        existingEmail = mysql.query_db(queryToGetEmails)
        
        # for email in existingEmail:
        #     print "existingEmail: ", email
        noOfEmails = len(existingEmail) 
        print "len(existingEmail): ", noOfEmails
        for i in existingEmail:
            # print "i['email']", i['email']

            if (i['email'] == enteredEmail):
                flash("Email exists")
                isform_valid = False
                print "Email exists"
                isGoodForm = 0
        
        query1 = "INSERT INTO emails (email) VALUES (:email)"
        # We'll then create a dictionary of data from the POST data received.
        data1 = {
                'email': request.form['email'],
            }
        query2 = "SELECT * FROM emails"                           # define your query
        
        if (isform_valid == True and isGoodForm == 1) :
        # Run query, with dictionary values injected into the query.
            mysql.query_db(query1, data1)
            emailList = mysql.query_db(query2) 
            print emailList
            flash("A valid Email was successfully entered!")
            return render_template("success.html",emails = emailList)
        return redirect('/')

    if (flask.request.method == 'GET'):
        if (isform_valid == True and isGoodForm == 1) :
            #get list of objs from emails table with id and email, created at and store in emailList 
            query2 = "SELECT * FROM emails"   
            emailList = mysql.query_db(query2) 
            print emailList
            flash("A valid Email was successfully entered!")
            return render_template("success.html",emails = emailList)
        return redirect('/')

@app.route('/delete/<email_id>')
def removeEmail(email_id):
    print "email_id", email_id
    query2Del = "DELETE FROM emails where id = :email_id"
    data = {
        'email_id' : email_id
    }
    mysql.query_db(query2Del, data) 
    return redirect('/login')
app.run(debug=True)