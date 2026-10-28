# import pandas as pd

# from sqlalchemy import create_engine

# def connect_database():
#     try:
#         engine = create_engine(url="mysql+mysqldb://root:vijay2005@localhost/food_delivery")
#     except:
#         print("Connection failed")
#     else:
#         return engine

# if connect_database():
#     print("Database Connected successfully")



# def connect_tables():
#     try:
#         customers=pd.read_sql_query("select * from customers;",connect_database())
#         menu_item=pd.read_sql_query("select * from Menu_item;",connect_database())
#         orders=pd.read_sql_query("select * from Orders;",connect_database())
#         rest=pd.read_sql_query("select * from Restaurants;",connect_database())
#         delivery=pd.read_sql_query("select * from Delivery;",connect_database())
        
#     except:
#         print("Table Name is incorrect...check once")

#     else:
#         return customers,menu_item,orders,rest,delivery




import pandas as pd
from sqlalchemy import create_engine


def connect_database():
    try:
        engine = create_engine(
            "mysql+mysqldb://root:vijay2005@localhost/food_delivery"
        )
        return engine

    except Exception as e:
        print("Connection failed:", e)
        return None


def connect_tables():
    engine = connect_database()

    if engine is None:
        return None

    try:
        customers = pd.read_sql_query(
            "SELECT * FROM customers;", engine
        )

        menu_item = pd.read_sql_query(
            "SELECT * FROM Menu_item;", engine
        )

        orders = pd.read_sql_query(
            "SELECT * FROM Orders;", engine
        )

        rest = pd.read_sql_query(
            "SELECT * FROM Restaurants;", engine
        )

        delivery = pd.read_sql_query(
            "SELECT * FROM Delivery;", engine
        )

        table_info = pd.read_sql_query("""
            SELECT
                TABLE_SCHEMA,
                TABLE_NAME,
                TABLE_ROWS
            FROM information_schema.tables
            WHERE TABLE_NAME = 'Delivery';
        """, engine)

        print("\n--- Delivery Tables Visible to Python ---")
        print(table_info.to_string(index=False))

        count_info = pd.read_sql_query("""
            SELECT
                DATABASE() AS database_name,
                @@hostname AS server_name,
                @@port AS server_port,
                COUNT(*) AS delivery_rows
            FROM Delivery;
        """, engine)

        print("\n--- Connection Check ---")
        print(count_info.to_string(index=False))

        print("\n--- DataFrame Row Counts ---")
        print("Customers:", len(customers))
        print("Menu Items:", len(menu_item))
        print("Orders:", len(orders))
        print("Restaurants:", len(rest))
        print("Delivery:", len(delivery))

        return customers, menu_item, orders, rest, delivery

    except Exception as e:
        print("Actual error:", e)
        raise

    finally:
        engine.dispose()


if __name__ == "__main__":
    connect_tables()