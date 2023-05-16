import mysql.connector
from flask import Flask, jsonify, request
import os
import sys
from mri import mri_model
import shutil
from io import BytesIO
import base64
from PIL import Image

# run this code only once 
# please don't change the directory
"""current_path = os.getcwd()
print("Current path:", current_path)
sys.path.append(current_path)
print(sys.path)"""
# request.form.get
cnx = mysql.connector.connect(
    user='root', 
    password='new',
    host='localhost', 
    database='alzheimer'
    )
# Execute a query
cursor = cnx.cursor()
app = Flask(__name__)
mri = mri_model()
mri.run_model()

@app.route("/test", methods=['GET'])
def test():
    res = {"status": True}
    return jsonify(res)
app.run()


@app.route("/addUser", methods=['POST'])
def add_new_user():
    # get all params 
    name = request.form.get("userName")
    email = request.form.get("emailAddress")
    password = request.form.get("password")
    description = request.form.get("description")
    is_doctor = request.form.get("isDoctor")
    if (is_doctor == "1"):
        is_doctor = 1
    else:
        is_doctor = 0
    phone = request.form.get("phone")
    # first check if the user exists
    query = f"SELECT email from users WHERE email = '{email}';"
    cursor.execute(query)
    result = cursor.fetchall()
    # if true this means that this email is in database
    if(len(result) != 0):
        return_value = { "status": False, "msg": "user already exists." }
        return jsonify(return_value)
    # add user to the database
    query = f""" 
    INSERT into users (user_name, email, password, phone, description, is_doctor) VALUES
    ('{name}', '{email}', '{password}', '{phone}', '{description}', {is_doctor});
    """
    cursor.execute(query)
    cnx.commit()

    return_value = { "status": True, "msg": "user added.", "email": email }
    return jsonify(return_value)

@app.route("/getAllUsers", methods=['GET'])
def get_all_users():
    q = "SELECT * From users;"
    cursor.execute(q)
    result  = cursor.fetchall()
    return jsonify(result)

@app.route("/login", methods=['POST'])
def login():
    email = request.form.get("emailAddress")
    password = request.form.get("password")
    query = f"SELECT email, password from users WHERE email = '{email}';"
    cursor.execute(query)
    result = cursor.fetchall()
    if (len(result) == 0):
        return_value = { "status": False, "msg": "user not found." }
        return jsonify(return_value)
    passDB = result[0][1]
    if (password != passDB):
        return_value = { "status": False, "msg": "incorrect email or password." }
        return jsonify(return_value)
    else:
        return_value = { "status": True, "msg": "log in successfully." }
        return jsonify(return_value)
    return jsonify(result)

@app.route("/getUser/<email>", methods = ['GET'])
def get_user_info(email):
    query = f"SELECT * from users WHERE email = '{email}'"
    cursor.execute(query)
    result = cursor.fetchall()
    return_value = { "status": True, "data": result }
    return jsonify(return_value)
@app.route("/mriPredcitions" ,methods = ['POST'])
def mri_predict():
    # get the image data from the request
    image_data = request.form.get("image")
    # assuming 'image_string' is the string of bytes sent from the front end
    decoded_data = base64.b64decode(image_data)
    # create an Image object from the decoded bytes
    img = Image.open(BytesIO(decoded_data))
    # save the image to a file
    img.save('test_folder/1/image.jpg')
    img.save('images/image.jpg')
    label = mri.predict('test_folder/')    
    #label = ""
    os.remove('test_folder/1/image.jpg')
    # get label info from database
    query  = f"SELECT description from label_info WHERE label = '{label}'"
    cursor.execute(query)
    result1 = cursor.fetchall()
    # get label recommendations from database
    query  = f"SELECT description from recommendation_info WHERE label = '{label}'"
    cursor.execute(query)
    result2 = cursor.fetchall()
    return_value = {"status": True, "info": result1, "reco": result2, "label": label}
    return jsonify(return_value)
@app.route("/updateUser", methods=['POST'])
def update_user_info():
    name = request.form.get("name")
    email = request.form.get("email")
    password = request.form.get("password")
    phone = request.form.get("phone")
    des = request.form.get("description")
    query = f"""UPDATE users SET 
    user_name = '{name}',
    phone = '{phone}',
    password = '{password}',
    description = '{des}' WHERE email = '{email}';"""
    cnx.commit()

    print(query) 
    try:
        cursor.execute(query)
    except:
        return jsonify({"status": False, "msg": "Information not updated "})
    return jsonify({"status": True, "msg": "Information updated"})
@app.route("/getAllDoctors", methods=['GET'])
def get_all_doctors():
    query = "SELECT user_name, phone, description FROM users WHERE is_doctor = 1;"
    cursor.execute(query)
    result = cursor.fetchall()
    return {"res": result, "status": True}
app.run() 




query = """ 
INSERT into users (user_name, email, password, phone, description, is_doctor) VALUES
('{name}', '{email}', '{password}', '{phone}', '{description}', 1);
"""
cursor.execute(query)
for i in range (50):
    email = f"email{i}"
    name = f"name{i}"
    des = "Bla bla bla bla bla Bla bla bla bla bla Bla bla bla bla bla Bla bla bla bla bla "
    
    query = f""" 
    INSERT into users (user_name, email, password, phone, description, is_doctor) VALUES
    ('{name}', '{email}', '+201021890205', 'phone', '{des}', 1);
    """
    cursor.execute(query)




q = """UPDATE users SET 
    user_name = 'name5',
    phone = 'phone',
    password = 'passwordsasa,
    description = 'Bla bla bla bla bla Bla bla bla bla bla Bla bla bla bla bla Bla bla bla bla bla ' WHERE email = 'email5';

"""

cursor.execute(q)

