import mysql.connector

# Connect to the MySQL database
mydb = mysql.connector.connect(  
    host="localhost",   
    user="your_username",  
    password="your_password",
    database="alx_book_store"
)

# Create a cursor object
mycursor = mydb.cursor()    

mycursor.execute("DROP TABLE IF EXISTS Books, Authors, Customers, Orders, Order_Details")   

#create database if it does not exist
mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

# Create tables
mycursor.execute(""" 

CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    FOREIGN KEY (author_id)  REFERENCES Authors(author_id),
    price DOUBLE NOT NULL,
    publication_date DATE
);

CREATE TABLE IF NOT EXISTS Authors (
    author_id int PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL,
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL
    address TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE NOT NULL,
);
CREATE TABLE IF NOT EXISTS Order_Details(
    order_detail_id INT PRIMARY KEY,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    quantity DOUBLE,
);""")