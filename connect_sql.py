import pandas as pd

from sqlalchemy import create_engine

def connect_database():
    try:
        engine = create_engine(url="mysql+mysqldb://root:vijay2005@localhost/food_delivery")
    except:
        print("Connection failed")
    else:
        return engine

if connect_database():
    print("Database Connected successfully")



def connect_tables():
    try:
        customers=pd.read_sql_query("select * from customers;",connect_database())
        menu_item=pd.read_sql_query("select * from Menu_item;",connect_database())
        orders=pd.read_sql_query("select * from Orders;",connect_database())
        rest=pd.read_sql_query("select * from Restaurants;",connect_database())
        delivery=pd.read_sql_query("select * from Delivery;",connect_database())
    except:
        print("Table Name is incorrect...check once")

    else:
        return customers,menu_item,orders,rest,delivery
