with
    addresses as (
        select
            sk_address,
            addressId
        from {{ref('dim_address')}}
    )
    , creditcards as (
        select
            sk_creditcard,
            creditcardid
        from {{ref('dim_creditcard')}}
    )
    , customers as (
        select
            sk_customer,
            customerid
        from {{ref('dim_customer')}}
    )
    , products as (
        select
            sk_product,
            productid
        from {{ref('dim_product')}}
    )

    , salesOrders_with_sk as (
        select
            o.*,
            shiptoaddress.sk_address as sk_shiptoaddress,
            cc.sk_creditcard,
            c.sk_customer,
            p.sk_product      

        from {{ref('stg_salesOrder')}} o
        left join addresses shiptoaddress on o.shiptoaddressid = shiptoaddress.addressid
        left join creditcards cc on o.creditcardid = cc.creditcardid        
        left join products p on o.productid = p.productid
        left join customers c on o.customerid = c.customerid
    )

    /* We then join orders and orders detail to get the final fact table*/
    , final as (
        select
            SalesOrderID,
            SalesOrderDetailID, 
            sk_ShipToAddress,           
            sk_Customer,
            sk_CreditCard,
            sk_Product,
            SalesOrderDateKey,
            OrderQty,
            UnitPrice,
            (OrderQty * UnitPrice) as TotalPrice


        from salesOrders_with_sk

    )

select * from final