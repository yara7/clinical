import mysql.connector
from flask import Flask, redirect, url_for, request,render_template,flash, send_file,session
from io import BytesIO
import os
from datetime import date

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="mysql",
  database="CMMS"
)
mycursor = mydb.cursor()
app = Flask(__name__)
app.secret_key = "Hello"

app.config['UPLOAD_FOLDER']  = "C:\\Users\\Lenovo\\Documents\\GitHub\\clinical\\static\\uploads"
@app.route('/')
def index():
	return render_template("index.html")


@app.route('/Equipments', methods=['POST','GET'])
def Equipments():
  if request.method == 'POST':
    equipment = request.form["Equipment"]
    installation = request.form["Installation date"]
    warranty = request.form["Warranty date"]
    if (equipment == '' and installation =='' and warranty==''):
      mycursor.execute("SELECT * FROM Equipment")
      
    elif(equipment != '' and installation =='' and warranty==''):
      mycursor.execute("SELECT * FROM Equipment WHERE Name= '" +equipment+ "' ")

    elif(installation !='' and warranty !='' and equipment != '') :
      mycursor.execute("SELECT * FROM Equipment WHERE Name= '" +equipment+ "' AND Installation_date = '" +installation+ "' AND Warranty_expires = '" +warranty+ "' ")
    elif(installation !='' and warranty !='' and equipment == '') :
     
      mycursor.execute("SELECT * FROM Equipment WHERE  Installation_date = '" +installation+ "' AND Warranty_expires = '" +warranty+ "' ")

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
    sheet = Name+'_'+Asset_ID+'.pdf'
    uploads_dir = "C:\\Users\\Lenovo\\Documents\\GitHub\\clinical\\static\\uploads"
    filedata.save(os.path.join(uploads_dir, sheet))  
    mycursor.execute("SELECT * FROM Equipment WHERE  Asset_ID = '" +Asset_ID+ "' ")
    myresult = mycursor.fetchall()
    if myresult :
      return render_template("/addEquipment.html", message="This ID already exists! ") 
    else :  
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
    if Name != '' :
      mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost_USD,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID AND Inventory.Name = '" +Name+ "'") 
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }
    else:
      mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost_USD,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID")
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }

    return render_template("parts.html",data=data)

  else:
    mycursor.execute("SELECT Inventory.Part_Number,Inventory.Name,Inventory.Asset_ID,Inventory.Vendor,Inventory.Cost_USD,Inventory.Quantity,Equipment.Name as Asset_Name FROM `Inventory` JOIN `Equipment` WHERE Equipment.Asset_ID=Inventory.Asset_ID")
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
   mycursor.execute("SELECT * FROM Inventory WHERE  Part_Number = '" +Part_Number+ "' ")
   myresult = mycursor.fetchall()
   if myresult :
     return render_template("/addParts.html", message="This Part Number already exists! ") 
   else:
     sql = "INSERT INTO Inventory(Part_Number, Name ,Asset_ID ,Vendor,Cost_USD,Quantity) VALUES (%s,%s,%s, %s ,%s ,%s)"
     val = (Part_Number, Name ,Asset_ID ,Vendor,Cost,Quantity)
     mycursor.execute(sql, val)
     mydb.commit() 
      
     return render_template("addParts.html")

 else:

   return render_template("addParts.html")
	
@app.route('/editEquipment', methods=['POST','GET'])
def editEquipment():
  if request.method == 'POST':
    Asset_ID = request.form["Asset_ID"]
    Installation_date = request.form["Installation_date"]
    Warranty_expires = request.form["Warranty_expires"]
    Facility = request.form["Facility"]
    Building = request.form["Building"]
    Floor = request.form["Floor"]
    Department = request.form["Department"]
    Scrapping_date = request.form["Scrapping_date"]
    mycursor.execute("SELECT * FROM Equipment WHERE  Asset_ID = '" +Asset_ID+ "' ")
    myresult = mycursor.fetchall()
    if myresult :
      
      sql = """UPDATE Equipment set Installation_date=%s,Warranty_expires=%s,Facility=%s,Building=%s,Floor=%s,Department=%s,Scrapping_date=%s where Asset_ID=%s """
      val = (Installation_date,Warranty_expires,Facility,Building,Floor,Department,Scrapping_date,Asset_ID)
      mycursor.execute(sql, val)
      mydb.commit() 
      return render_template("/editEquipment.html")
    else :
      return render_template("/editEquipment.html", message="This Asset ID does not exist! ") 
	
  else:
    return render_template("/editEquipment.html")

@app.route('/editParts', methods=['POST','GET'])
def editParts():
  if request.method == 'POST':
    Part_Number = request.form["Part_Number"]
    Vendor = request.form["Vendor"]
    Cost = request.form["Cost"]
    Quantity = request.form["Quantity"]
    mycursor.execute("SELECT * FROM Inventory WHERE  Part_Number = '" +Part_Number+ "' ")
    myresult = mycursor.fetchall()
    if myresult :
      
      sql = "UPDATE Inventory set Vendor=%s,Cost_USD=%s,Quantity=%s where Part_Number=%s "
      val = (Vendor,Cost,Quantity,Part_Number)
      mycursor.execute(sql, val)
      mydb.commit() 
      return render_template("/editParts.html")
    else:
      return render_template("/editParts.html", message="This Part Number does not exist! ") 
	
  else:
    return render_template("/editParts.html")



@app.route('/addOrder', methods=['POST','GET'])
def addOrder():
  if request.method == 'POST':
    Asset_ID = request.form["Asset_ID"]
    Name = request.form["Name"]
    Order_number = request.form["Order_number"]
    Status = request.form["Status"]
    Demand_PM= request.form["Repair/PM"]
    Due_date = request.form["Due_date"]
    Creation__date = request.form["Creation__date"]
    PM_date = request.form["PM_date"]
    PM_frequency = request.form["PM_frequency"]
    Priority = request.form["Priority"]
    Description = request.form["Description"]
    Demand_cost = request.form["Demand_cost"] 
    mycursor.execute("SELECT * FROM Work_orders WHERE  Order_number = '" +Order_number+ "' ")
    myresult = mycursor.fetchall()
    if myresult :
      return render_template("/addOrder.html", message="This work order Number already exists! ") 
    else:
      sql = "INSERT INTO Work_orders(Asset_ID, Name ,Order_number ,Status,`Repair/PM`,Due_date,Creation__date,PM_date,PM_frequency,Priority,Description,Repair_cost) VALUES (%s, %s ,%s ,%s,%s, %s ,%s,%s,%s,%s,%s,%s )"
      val = (Asset_ID, Name ,Order_number ,Status,Demand_PM,Due_date,Creation__date,PM_date,PM_frequency,Priority,Description,Demand_cost)
      mycursor.execute(sql, val)
      mydb.commit() 
      return render_template("/addOrder.html")
	
  else:
    return render_template("/addOrder.html")

@app.route('/editOrder', methods=['POST','GET'])
def editOrder():
  if request.method == 'POST':
    Name = request.form["Name"]
    Order_number = request.form["Order_number"]
    Status = request.form["Status"]
    Demand_PM= request.form["Repair/PM"]
    Due_date = request.form["Due_date"]
    Creation__date = request.form["Creation__date"]
    PM_date = request.form["PM_date"]
    PM_frequency = request.form["PM_frequency"]
    Priority = request.form["Priority"]
    Description = request.form["Description"]
    Demand_cost = request.form["Demand_cost"]
    mycursor.execute("SELECT * FROM Work_orders WHERE  Order_number = '" +Order_number+ "' ")
    myresult = mycursor.fetchall()
    if myresult :
      if (Name == '' and Status ==''and Demand_PM !='' and Due_date=='' and Creation__date =='' and  PM_frequency == '' and Priority != '' and Description =='' and Demand_cost =='' ):
        sql = """UPDATE Work_orders set `Repair/PM`=%s,PM_date=%s,Priority=%s  where Order_number=%s """

        val = (Demand_PM,PM_date,Priority,Order_number)

      else:
        sql = """UPDATE Work_orders set Name=%s,Status=%s,`Repair/PM`=%s,Due_date=%s,Creation__date=%s,PM_date=%s,PM_frequency=%s,Priority=%s,Description=%s,Repair_cost=%s  where Order_number=%s """
        val = (Name,Status,Demand_PM,Due_date,Creation__date,PM_date,PM_frequency,Priority,Description,Demand_cost,Order_number)
      mycursor.execute(sql, val)
      mydb.commit() 
      return render_template("/editOrder.html")
    else :
      return render_template("/editOrder.html", message="This work order Number does not exist! ") 
	
  else:
    return render_template("/editOrder.html")





@app.route('/workreport', methods=['POST','GET'])
def workreport():
  if request.method == 'POST':
    Asset_ID = request.form["Asset_ID"]
    Priority = request.form["Priority"]
    Status = request.form["Status"]
    Department = request.form["Department"]
    Repair_PM = request.form["Repair_PM"]
    cFrom = request.form["cFrom"]
    cTo = request.form["cTo"]
    dFrom = request.form["dFrom"]
    dTo = request.form["dTo"]
    q = "SELECT a.Order_number,a.Asset_ID,a.Name,a.Status,a.Creation__date,a.`Repair/PM`, a.Due_date,a.PM_date,a.PM_frequency,a.Priority,a.Description,a.Repair_cost,e.Department, W.SSN AS `Technition SSN`, T.Phone_number AS `Technition phone`,T.Name AS `Technition Name`, W.Number_of_hours, WP.Part_used FROM `Work_orders` AS a LEFT JOIN Equipment As e USING(Asset_ID) LEFT JOIN Work_on As W USING(Order_number) LEFT JOIN Technicians AS T USING(SSN) LEFT JOIN Work_Order_Parts AS WP USING(Order_number) " 
    # if (Asset_ID !='' and (Priority=='' and Status=='' and Department=='' and Repair_PM =='' and Technition==''and hours=='' and parts=='' and cFrom=='' and cTo =='' and dFrom=='' and dTo =='')):
    if (Asset_ID =='' and (Priority!='' and Status!='' and Department!='' and Repair_PM !=''  and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):
      mycursor.execute( q +"WHERE a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
    elif ( Priority =='' and (Asset_ID !='' and Status!='' and Department!='' and Repair_PM !=''  and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):    
      mycursor.execute(q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"'  AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
        
    elif (Status =='' and (Priority!='' and Asset_ID !='' and Department!='' and Repair_PM !=''  and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):      
    
      mycursor.execute(q + "WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
    elif (Department ==''  and (Priority!='' and Status!='' and Asset_ID !='' and Repair_PM !=''  and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):
        
      
      mycursor.execute(q + "WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"'  " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
    elif (Repair_PM =='' and (Priority!='' and Status!='' and Department!='' and  Asset_ID !='' and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):
        
      mycursor.execute(q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"'  ")
    elif ( cFrom =='' and cTo =='' and (Priority!='' and Status!='' and Department!='' and Repair_PM !=''  and Asset_ID !=''  and dFrom!='' and dTo !='')):
        
      mycursor.execute(q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      "  AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
    elif (  dFrom=='' and dTo =='' and (Priority!='' and Status!='' and Department!='' and Repair_PM !='' and Asset_ID !='' and cFrom!='' and cTo !='' )):
       
      mycursor.execute(q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
    elif (Asset_ID !='' and (Priority!='' and Status!='' and Department!='' and Repair_PM !='' and cFrom!='' and cTo !='' and dFrom!='' and dTo !='')):
      mycursor.execute( q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      " AND a.Creation__date >= '"+ cFrom+"' AND a.Creation__date <= '"+ cTo+"' AND a.Due_date >= '"+ dFrom+"' AND a.Due_date <= '"+ dTo+"' AND a.`Repair/PM` = '"+Repair_PM+"' ")
        
    elif ( cFrom=='' and cTo =='' and dFrom=='' and dTo =='' and (Asset_ID !='' and Priority!='' and Status!='' and Department!='' and Repair_PM !=''  )):
      mycursor.execute( q +"WHERE a.Asset_ID = '"+ Asset_ID+"' AND a.Status = '"+Status+"' AND a.Priority = '"+Priority+"' AND e.Department = '"+Department+"' " +
      "AND a.`Repair/PM` = '"+Repair_PM+"' ")
        
    else:
      return render_template("workreport.html")
    row_headers=[x[0] for x in mycursor.description] 
    myresult = mycursor.fetchall()
    data={
    'message':"data retrieved",
    'rec':myresult,
    'header':row_headers
    }
    session["data"] = data

    return  redirect(url_for("wreport"))
      

  else:
    return render_template("workreport.html")


@app.route('/wreport')
def wreport():
  today = date.today()
  if "data" in session:
    data = session["data"]

    return render_template("wreport.html" , data= data, today = today)
  

  return render_template("workreport.html")
  


@app.route('/inventoryreport', methods=['POST','GET'])
def inventoryreport():
  if request.method == 'POST':
    vendor= request.form["Vendor"]
    asset_id = request.form["Asset_ID"]
    costfrom = request.form["Costfrom"]
    costto=request.form["Costto"]
    q = "SELECT * From Inventory  "
    if (asset_id =='' and ( vendor!='' and costto!=''  and costfrom!='')):
      sql = q +"WHERE  Vendor = '"+vendor+"' AND Cost_USD >= %d  AND  Cost_USD <= %d "  % (int(costfrom),int(costto))
      mycursor.execute(sql )
    elif (vendor =='' and ( asset_id!='' and costto !='' and costfrom !='' )):
      sql = q +"WHERE  Asset_ID = '"+asset_id+"' Cost_USD >= %d  AND  Cost_USD <= %d " % (int(costfrom),int(costto))
      mycursor.execute( sql )
    elif (costfrom =='' and (  asset_id!='' and vendor!=''  and costto=='')):
      mycursor.execute( q +"WHERE Vendor = '"+vendor+"' AND Asset_ID = '"+asset_id+"'  ")
    elif (asset_id !='' and ( vendor!='' and costfrom!=''  and costto!='')):
      sql = q+ " WHERE  Inventory.Vendor = '"+vendor+"' AND Inventory.Asset_ID = '"+asset_id+"' AND Cost_USD >= %d AND Cost_USD <= %d " % (int(costfrom),int(costto))
      mycursor.execute( sql ) 

    else:
      return render_template("inventoryreport.html")
    row_headers=[x[0] for x in mycursor.description] 
    myresult = mycursor.fetchall()
    data={
    'message':"data retrieved",
    'rec':myresult,
    'header':row_headers
    }

    session["data"] = data
    return redirect(url_for("Ireport"))
  else:  
    return render_template("inventoryreport.html")

@app.route('/Ireport')
def Ireport():

  today = date.today()
  if "data" in session:
    data = session["data"]
    return render_template("Ireport.html" , data= data, today = today)
  return render_template("inventoryreport")


@app.route('/workOrders', methods=['POST','GET'])
def workOrders():
  q = "SELECT a.Order_number,a.Asset_ID,a.Name,a.Status,a.Creation__date,a.`Repair/PM`, a.Due_date,a.PM_date,a.PM_frequency,a.Priority,a.Description,a.Repair_cost,e.Department, W.SSN AS `Technition SSN`, T.Phone_number AS `Technition phone`,T.Name AS `Technition Name`, W.Number_of_hours, WP.Part_used FROM `Work_orders` AS a LEFT JOIN Equipment As e USING(Asset_ID) LEFT JOIN Work_on As W USING(Order_number) LEFT JOIN Technicians AS T USING(SSN) LEFT JOIN Work_Order_Parts AS WP USING(Order_number) " 

  if request.method == 'POST':
    Order_number = request.form["Order_number"]
    if Order_number != '' :
      mycursor.execute(q + " WHERE a.Order_number = '" +Order_number+ "'")
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }
    else:
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] 
      myresult = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult,
      'header':row_headers
      }

    return render_template("workOrders.html",data=data)

  else:
    mycursor.execute(q)
    row_headers=[x[0] for x in mycursor.description] 
    myresult = mycursor.fetchall()
    data={
    'message':"data retrieved",
    'rec':myresult,
    'header':row_headers
    }
    return render_template("workOrders.html",data=data)


@app.route('/historyreport', methods=['POST','GET'])
def historyreport():
  if request.method == 'POST':
    eqSN = request.form["Equipment SN"]
    if eqSN == '':
      return render_template('historyreport.html')

    else:
      mycursor.execute("SELECT * FROM Equipment WHERE Serial_number = '"+eqSN+"'" )
      row_headers1=[x[0] for x in mycursor.description] 
      myresult1 = mycursor.fetchall()
      assetID = str(myresult1[0][0])
      mycursor.execute("SELECT * FROM Work_orders WHERE Asset_ID = '"+assetID+"' AND Status = 'Completed'")
      row_headers2=[x[0] for x in mycursor.description] 
      myresult2 = mycursor.fetchall()
      data={
      'message':"data retrieved",
      'rec':myresult1,
      'header':row_headers1,
      'rec2':myresult2,
      'header2':row_headers2
      }

      if (myresult2 != []):
        session["data"] = data
        return redirect(url_for("historyform"))
      else:
        return render_template('historyreport.html')


      
  else:
    return render_template('historyreport.html')

@app.route('/historyform')
def historyform():
  if "data" in session:
    data = session["data"]
    return render_template("historyform.html", data=data)
  else:
    return render_template("historyreport.html")

@app.route('/todaysM')
def todaysM():
  today = date.today()

  mycursor.execute("SELECT * FROM Work_orders WHERE PM_frequency = 'Monthly' AND `Repair/PM` = 'PM' ")
  row_headers=[x[0] for x in mycursor.description] 
  myresult = mycursor.fetchall()
  data={
  'message':"data retrieved",
  'rec':myresult,
  'header':row_headers,
  
  }
  mycursor.execute("SELECT * FROM Work_orders WHERE PM_frequency = 'Yearly' AND `Repair/PM` = 'PM' ")
  row_headers2=[x[0] for x in mycursor.description] 
  myresult2 = mycursor.fetchall()
  data2={
  'message':"data retrieved",
  'rec':myresult2,
  'header':row_headers2,
  
  }

  mycursor.execute("SELECT * FROM Work_orders WHERE PM_frequency = 'Weekly' AND `Repair/PM` = 'PM' ")
  row_headers3=[x[0] for x in mycursor.description] 
  myresult3 = mycursor.fetchall()
  data3={
  'message':"data retrieved",
  'rec':myresult3,
  'header':row_headers3,
  
  }
  print(myresult3)
  myresult4 = []
  if (myresult != []):

    for i in range(len(myresult)):
      if (myresult[i][7].day == today.day):
        myresult4.append(myresult[i])
    
  if (myresult2 != []):
    for i in range(len(myresult2)):
      if (myresult2[i][7].day == today.day and myresult2[i][7].month == today.month ):
        myresult4.append(myresult2[i])

  if (myresult3 != []):

    for i in range(len(myresult3)):
      if (myresult3[i][7].strftime('%A') == today.strftime('%A') ):
        myresult4.append(myresult3[i])
    
  data={
  'message':"data retrieved",
  'rec':myresult4,
  'header':row_headers,
  
  }
 
  return render_template("todaysM.html" , data=data)
  

if __name__ == '__main__':
	app.run(debug=True)
