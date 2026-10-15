import pandas as pd
from connect_sql import connect_tables

tables = connect_tables()
tablenames = ['Customers', 'Menu', 'Rest', 'Orders', 'Delivery']

i = 0
for table in tables:
    table.to_csv(f"Data_SQL/{tablenames[i]}.csv")
    i += 1