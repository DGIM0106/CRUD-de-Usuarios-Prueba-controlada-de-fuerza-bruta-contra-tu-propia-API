from fastapi import FastAPI
from sqlmodel import SQLModel, Field

app = FastAPI()

class User(SQLModel):
    id : int
    username : str = Field(unique = True)
    password : str
    email : str = None 
    is_activate : bool

User_Dbd = [User(id=1, username= "DGIM", password="210",email="daniel@gmail.com",is_activate=True)]

class UserIn(SQLModel):
    id : int
    username : str = Field(unique = True)
    password : str
    email : str = None 
    is_activate : bool = False

class Usermod(SQLModel):
    id : int
    username : str = Field(unique = True)
    email : str = None 
    is_activate : bool

class Userlogin(SQLModel):
    username : str 
    password : str
    email : str = None 

@app.post("/users")
def Sign_up (data : UserIn):
    new_user = User(id=data.id, username=data.username, email=data.email, password=data.password, is_activate=data.is_activate)
    User_Dbd.append(new_user)
    return {"message": "Usuario creado", "user": data.email}
   
@app.get("/users")
def View_User_List ():
   return {"message": "Usuarios en la base de datos", "users": User_Dbd}

@app.get("/users/{id}")
def View_User(id: int):
    for user in User_Dbd:
        if user.id == id:
            return user
    return {"message": "Usuario no encontrado"}

@app.put("/users/{id}")
def User_Update(id: int, data: Usermod):
    for user in User_Dbd:
        if user.id == id:
            user.username = data.username
            user.email = data.email
            user.is_activate = data.is_activate
            return {"message": "Usuario actualizado", "user": user}
    return {"message": "Usuario no encontrado"}

@app.post("/login")
def Sign_in(data: Userlogin):
    for user in User_Dbd:
        if user.username == data.username and user.password == data.password:
            return {"message": "Login Exitoso"}
    return {"message": "Login Fallido"}



