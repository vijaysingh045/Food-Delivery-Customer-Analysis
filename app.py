import streamlit as st
from cleaning_data import load_clean_data
from customer_analysis import customer_analysis
from orders_analysis import analyze_order,monthly_orders
from delivery_analysis import analyze_delivery,delivery_status
import os

st.set_page_config(page_title="Food Delivery Analysis",layout='wide')

st.title("Food Delivery Analysis App 📱 ")

try:
    data=load_clean_data()
    customer=data['customers']
    menu=data['menu_item']
    orders=data['orders']
    rest=data['rest']
    delivery=data['delivery']
    print("All Table Loaded")
except:
    print("Database Connection Failed")

CA,OA,DA=st.tabs(['Customer Analysis','Order Analysis','Delivery Analysis'])

with CA:
    st.header("Customer Analysis Report")
    st.divider()
    col1,col2,col3=st.columns(3)
    customer_analysis_data=customer_analysis(customer,orders)

    col1.header("Total Customers")
    col1.subheader(customer_analysis_data['Total_Customers'])
    col2.header("Repeated Customers")
    col2.subheader(customer_analysis_data['repeated_customers'])
    col3.header("New Customers")
    col3.subheader(customer_analysis_data['new customers'])

    st.divider()
    st.header("Gender Analysis")
    st.divider()
    st.bar_chart(customer_analysis_data['Gender_count'])
    st.divider()
    st.header("Area Analysis")
    st.divider()
    st.bar_chart(customer_analysis_data['City_count'])   

with OA:
    st.header("Order Analysis Report")

    orders_analysis_data=analyze_order(orders)
    st.divider()
    col1,col2,col3=st.columns(3)

    col1.header("Total Revenue")
    col1.subheader(orders_analysis_data['Revenue'])

    col2.header("Total Orders")
    col2.subheader(orders_analysis_data['Total_Orders'])

    col3.header("Average Order Value")
    col3.subheader(orders_analysis_data['Average Order Value'])
    st.divider()
    monthly_order_data=monthly_orders(orders)
    st.header("Monthly Orders Analysis")
    st.divider()
    st.line_chart(monthly_order_data)
    
with DA:
    st.header("Delivery Analysis Report")