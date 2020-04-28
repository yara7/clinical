import mysql.connector
from flask import Flask, redirect, url_for, request,render_template,flash

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="mysql",
  database="CMMS"
)
mycursor = mydb.cursor()
app = Flask(__name__)
@app.route('/')
def index():
	return render_template("index.html")


@app.route('/Equipments', methods=['POST','GET'])
def Equipments():
  if request.method == 'POST':
    equipment = request.form["Equipment"]
    installation = request.form["Installation date"]
    warranty = request.form["Warranty date"]
    if equipment == '':
      mycursor.execute("SELECT * FROM Equipment")
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }
      return render_template("Equipments.html",data=data)

    else :
      mycursor.execute("SELECT * FROM Equipment WHERE Name= '" +equipment+ "' AND Installation_date = '" +installation+ "' AND Warranty_expires = '" +warranty+ "' ")
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }
      return render_template("Equipments.html",data=data)

  else:
    mycursor.execute("SELECT * FROM Equipment")
    row_headers=[x[0] for x in mycursor.description] 
    myresult = mycursor.fetchall()
    data={
    'message':"data retrieved",
    'rec':myresult,
    'header':row_headers
    }
    return render_template("Equipments.html",data=data)

@app.route('/addEquipment', methods=['POST','GET'])
def addEquipment():
  if request.method == 'POST':
    Asset_ID = request.form["Asset_ID"]
    Name = request.form["Name"]
    Serial_number = request.form["Serial_number"]
    Model_number = request.form["Model_number"]
    Model_name = request.form["Model_name"]
    Manufacturer = request.form["Manufacturer"]
    Installation_date = request.form["Installation_date"]
    Warranty_expires = request.form["Warranty_expires"]
    Facility = request.form["Facility"]
    Building = request.form["Building"]
    Floor = request.form["Floor"]
    Department = request.form["Department"]
    Scrapping_date = request.form["Scrapping_date"]
    sql = "INSERT INTO Equipment(Asset_ID, Name ,Serial_number ,Model_number,Model_name,Manufacturer,Installation_date,Warranty_expires,Facility,Building,Floor,Department,Scrapping_date) VALUES (%s,%s,%s, %s ,%s ,%s,%s, %s ,%s,%s,%s,%s,%s )"
    val = (Asset_ID, Name ,Serial_number ,Model_number,Model_name,Manufacturer,Installation_date,Warranty_expires,Facility,Building,Floor,Department,Scrapping_date)
    mycursor.execute(sql, val)
    mydb.commit() 
    return render_template("/addEquipment.html")
	
  else:
    return render_template("/addEquipment.html")

if __name__ == '__main__':
	app.run(debug=True)
