## Customer Analysis

from cleaning_data import load_clean_data

def customer_analysis(customer_df,orders):
    total_customers=customer_df['customer_id'].nunique()
    gender_count=customer_df['gender'].value_counts()
    
    # total_orders = order_df['order_id'].nunique()
    city=[]
    for address in customer_df['Address']:
        city.append(address.split(',')[-1].strip())
    customer_df['city']=city
    city_count=customer_df['city'].value_counts()

    repeated_customers=orders['customer_id'].value_counts()>1
    total_repeated_customers=repeated_customers.sum()
    new_customers=total_customers-total_repeated_customers
    return {'Total_Customers':total_customers,
            'Gender_count':gender_count,
            'City_count':city_count,
            'repeated_customers':int(total_repeated_customers),
            'new customers':new_customers

           }

            # 'order_count':total_orders}


customer_df=load_clean_data()['customers']
order_df = load_clean_data()['orders']
# print(order_df.columns)
print(customer_analysis(customer_df,order_df))





