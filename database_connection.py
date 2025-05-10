from tkinter import *
import mysql.connector
from tkinter import messagebox

def db_connection():
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="rose_db"
        )
        return mydb
    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"{err}")
        return None

def login():
    username = entry_email.get()
    password = entry_pass.get()
    mydb = db_connection()
    if not mydb:
        return
    mycursor = mydb.cursor()
    sql = "SELECT role FROM users WHERE username = %s AND password = %s"
    mycursor.execute(sql, (username, password))
    result = mycursor.fetchone()
    if result:
        role = result[0]
        if role == "admin":
            print("Admin Access Granted")
            admin_welcome(username)
        elif role == "staff":
            print("Staff Access Granted")
            staff_welcome(username)
    else:
        messagebox.showerror("Login Failed", "Invalid Username or Password")

def admin_welcome(username):
    welcome_win = Toplevel()
    welcome_win.geometry("300x200")
    welcome_win.title("Admin")
    welcome_win.config(padx=20, pady=20)

    Label(welcome_win, text=f"Welcome, {username}!", font=('Arial', 16)).pack(pady=10)
def staff_welcome(username):
    welcome_win = Toplevel()
    welcome_win.geometry("300x200")
    welcome_win.title("Welcome, Staff!")
    welcome_win.config(padx=20, pady=20)

    Label(welcome_win, text=f"Welcome, {username}!", font=('Arial', 16)).pack(pady=10)
    mydb = db_connection()
    if mydb:
        messagebox.showinfo("Database", "Connected to Database")
        mydb.close()
    else:
        messagebox.showerror("Database", "Connection failed!")

root = Tk()
root.geometry("350x250")
root.title("Timbol_FirstGUI")
root.config(padx=20, pady=20)

Label(root, text='Username:', font=('Arial', 14)).pack(anchor='w')
entry_email = Entry(root, width=30)
entry_email.pack(pady=5)

Label(root, text='Password:', font=('Arial', 14)).pack(anchor='w')
entry_pass = Entry(root, show='*', width=30)
entry_pass.pack(pady=5)

Button(root, text='Login', command=login, width=10).pack(pady=20)

root.mainloop()