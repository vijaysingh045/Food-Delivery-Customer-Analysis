from cleaning_data import load_clean_data


orders=load_clean_data()['orders']
print(orders)

def analyze_order(Orders):
    revenue=Orders['total_price'].sum()
    total_orders=orders['order_id'].nunique()
    average_order_value=Orders['total_price'].mean()

    return {'Revenue':float(revenue),'Total_Orders':int(total_orders),'Average Order Value':float(average_order_value)}

# print(analyze_order(orders))


def monthly_orders(orders):
    orders['months']=orders['order_datetime'].dt.to_period('M').astype('str')
    return orders[['order_id','months']].groupby(by='months').nunique()



print(monthly_orders(orders))


