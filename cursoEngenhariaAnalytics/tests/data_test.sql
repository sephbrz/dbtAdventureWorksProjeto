-- An order should only have order lines (details) for products that had at least 1 quantity ordered, so the total quantity in a order should always be >= 1.
-- Therefore return records where this isn't true to make the test fail
select
    SalesOrderID,
    sum(OrderQty) as total_qty     

from {{ref('stg_salesOrder')}} 
group by 1
having not(total_qty >= 1)
