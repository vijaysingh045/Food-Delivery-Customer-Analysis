# import pandas as pd
# from connect_sql import connect_tables

# # customers,menu_item,orders,rest,delivery

# def load_data():
#     tables = connect_tables()
#     tablenames = ['customers', 'menu_item','orders','rest','delivery']

#     i = 0
#     for table in tables:
#         table.to_csv(f"Data_SQL/{tablenames[i]}.csv")
#         i += 1
#     data={}
#     i=0
#     for table in tablenames:
#         data[table]=tables[i]
#         i+=1
#     return data
# #print(load_data())

# def clean_data(df=pd.DataFrame()):
#     null_values=df.isnull().sum()
#     df.dropna(inplace=True)
#     df.drop_duplicates(inplace=True)
#     for col in df.select_dtypes(include='object').columns:
#         df[col]=df[col].str.strip()
#         df[col]=df[col].str.lower()
#     return df

# def load_clean_data():
#     data=load_data()
#     clean_df={}
#     for table_name,table_data in data.items():
#         clean_df[table_name]=clean_data(table_data)
#     return clean_df





import pandas as pd
from pathlib import Path
from connect_sql import connect_tables

def load_data():
    tables = connect_tables()

    tablenames = [
        'customers',
        'menu_item',
        'orders',
        'rest',
        'delivery'
    ]

    # Check that 5 tables were returned
    if len(tables) != len(tablenames):
        raise ValueError(
            f"Expected 5 tables, but received {len(tables)}"
        )

    # Create Data_SQL folder if it doesn't exist
    output_dir = Path("Data_SQL")
    output_dir.mkdir(parents=True, exist_ok=True)

    data = {}

    for name, table in zip(tablenames, tables):
        if not isinstance(table, pd.DataFrame):
            raise TypeError(f"{name} is not a pandas DataFrame")

        file_path = output_dir / f"{name}.csv"

        table.to_csv(file_path, index=False)
        data[name] = table

        print(f"Saved: {file_path.resolve()} | Rows: {len(table)}")

    return data


def clean_data(df):
    df = df.copy()
    df.dropna(inplace=True)
    df.drop_duplicates(inplace=True)

    for col in df.select_dtypes(include='object').columns:
        df[col] = df[col].str.strip().str.lower()

    return df


def load_clean_data():
    data = load_data()
    clean_df = {}

    for table_name, table_data in data.items():
        clean_df[table_name] = clean_data(table_data)

    return clean_df


if __name__ == "__main__":
    tables = connect_tables()
    print("Delivery rows:", len(tables[4]))
    print(tables[4].head())



