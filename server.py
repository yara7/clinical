import mysql.connector
from flask import Flask, redirect, url_for, request,render_template,flash, send_file
from io import BytesIO
import os
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="mysql",
  database="CMMS"
)
mycursor = mydb.cursor()
app = Flask(__name__)
app.config['UPLOAD_FOLDER']  = "C:/Users/Lenovo/CMMS/static/uploads"
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
      # return render_template("Equipments.php",data=data)

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
      # return render_template("Equipments.php",data=data)

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
    # return render_template("Equipments.php",data=data)

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
    filedata = request.files['Data_sheet'] 
    # sheet = filedata.filename
    sheet = Name+'_'+Asset_ID+'.pdf'
    uploads_dir = "C:/Users/Lenovo/CMMS/static/uploads"
    filedata.save(os.path.join(uploads_dir, sheet))  
    sql = "INSERT INTO Equipment(Asset_ID, Name ,Serial_number ,Model_number,Model_name,Manufacturer,Installation_date,Warranty_expires,Facility,Building,Floor,Department,Scrapping_date,Data_sheet) VALUES (%s,%s,%s, %s ,%s ,%s,%s, %s ,%s,%s,%s,%s,%s,%s )"
    val = (Asset_ID, Name ,Serial_number ,Model_number,Model_name,Manufacturer,Installation_date,Warranty_expires,Facility,Building,Floor,Department,Scrapping_date, sheet)
    mycursor.execute(sql, val)
    mydb.commit() 
    return render_template("/addEquipment.html")
	
  else:
    return render_template("/addEquipment.html")
 
@app.route('/parts', methods=['POST','GET'])
def parts():

  if request.method == 'POST':
    Name = request.form["Name"]
    print(Name)
    if Name != '' :
      mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID AND Inventory.Name = '" +Name+ "'") 
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }
    else:
      mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID")
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }

    return render_template("parts.html",data=data)

  else:
    mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID")
    row_headers=[x[0] for x in mycursor.description] 
    myresult = mycursor.fetchall()
    data={
    'message':"data retrieved",
    'rec':myresult,
    'header':row_headers
    }
    return render_template("parts.html",data=data)

@app.route('/addParts' , methods=['POST','GET'] )
def addParts():
 if request.method == 'POST':
   Part_Number = request.form["Part_Number"]
   Name = request.form["Name"]
   Asset_ID = request.form["Asset_ID"]
   Vendor = request.form["Vendor"]
   Cost = request.form["Cost"]
   Quantity = request.form["Quantity"]
   sql = "INSERT INTO Inventory(Part_Number, Name ,Asset_ID ,Vendor,Cost,Quantity) VALUES (%s,%s,%s, %s ,%s ,%s)"
   val = (Part_Number, Name ,Asset_ID ,Vendor,Cost,Quantity)
   mycursor.execute(sql, val)
   mydb.commit() 
    
   return render_template("addParts.html")

 else:

   return render_template("addParts.html")
	



if __name__ == '__main__':
	app.run(debug=True)
