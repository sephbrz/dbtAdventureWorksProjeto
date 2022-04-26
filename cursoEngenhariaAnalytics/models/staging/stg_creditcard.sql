with
    source_data as (
        select
            cc.creditcardid, 
            cc.cardtype, 
            cc.cardnumber, 
            cc.expmonth, 
            cc.expyear
            
        from {{source('adventureworks_projeto','creditcard')}} as cc
)

select *
from source_data