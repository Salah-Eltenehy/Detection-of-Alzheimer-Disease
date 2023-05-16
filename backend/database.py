import mysql.connector

class Data_Base:
    def __init__(self):
        try:
            # Establish a connection to the database
            self.cnx = mysql.connector.connect(
                user='root', 
                password='new',
                host='localhost', 
                database='alzheimer')
            # Execute a query
            self.cursor = self.cnx.cursor()
            print("Database connected")
        except:
            print("Database not connected")
    
    def create_user(self, 
                    name, email, password, 
                    phone, description, isDoctor
                    ):
        cnx = mysql.connector.connect(
            user='root', 
            password='new',
            host='localhost', 
            database='alzheimer')
        cursor = cnx.cursor()
        #Check if the email already in the database
        query = "SELECT email, password FROM users;"
        try:
            cursor.execute(query)
        except:
            print("ERROR WHILE FETCH USERS")
        result = cursor.fetchall()
        print(result)
        #if(len(result) != 0):
         #   return False
        email = "sasaaaaaaaasa"
        use = "salah"
        ph = "0120121"
        d = "sasasas"
        pas = "sasasa"
        do = 1
        f = f""" 
        INSERT into users (user_name, email, password, phone, description, is_doctor) VALUES
        ('{use}', '{email}', '{pas}', '{ph}', '{d}', {do});
        """
        cursor.execute(f)   
            
    def log_in(self, email, password):
        query = f"""SELECT email, password FROM users WHERE email = '{email}'"""
        try:
            self.cursor.execute(query)
        except:
            print("ERROR WHILE FETCH USERS")
        result = self.cursor.fetchall()
        passw = result[0][1]
        if (passw == password):
            return True
        else:
            return False    
        
    def get_info(self, label):
        query = f"SELECT * FROM label_info WHERE label = '{label}'"
        try:
            self.cursor.execute(query)
            result = self.cursor.fetchall()     
            data = result[0][1]
            print("DATA fectched")
            return data
        except:
            print("ERROR WHILE INSERT USER")
    def get_recommendation(self, label):
        query = f"SELECT * FROM recommendation_info WHERE label = '{label}'"
        try:
            self.cursor.execute(query)
            result = self.cursor.fetchall()     
            data = result[0][1]          
            print("DATA fectched")
            return data
        except:
            print("ERROR WHILE INSERT USER")
        

        
        
db = Data_Base()            
print(db.create_user(
    'sala2222h','johsnddas45dhssasaaoe@example.com', 'password123', '+201021890205', "sasasasasasas", 0
    ))    
query = f"""
INSERT INTO users 
(user_name, email, password, phone, description, is_doctor)
VALUES (%s, %s, %s, %s, %s, %s);
"""
        
        
#Insert user
#query =  f""" 
#INSERT into users (user_name, email, password, phone, description, is_doctor) VALUES
#('{name}', '{email}', '{password}', '{phone}', '{description}', {isDoctor});
#"""
#values = (name, email, password, phone, description, isDoctor)
#try:
    #self.cursor.execute(query)
    #print("USER ADDED")
#except:
    #print("ERROR WHILE INSERT USER")     
            
