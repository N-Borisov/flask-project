from flask import Flask,render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'mysql'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'

mysql = MySQL(app)


@app.route('/')
def version():
        cur = mysql.connection.cursor()
        cur.execute("SELECT VERSION()")
        rv = cur.fetchall()
        return f'You are running MYSQL Database version: {str(rv)}'

app.run(host='0.0.0.0', port=5000)

