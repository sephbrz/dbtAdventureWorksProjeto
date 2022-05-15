with
    salesReason as (
        select
            sk_salesreason,
            salesreasonId
        from {{ref('dim_salesreason')}}
    )

    , salesorderheadersalesreason_with_sk as (
        select
            sohsr.*,
            sk_salesreason     

        from {{ref('stg_salesorderheadersalesreason')}} sohsr
        left join salesreason sr on sohsr.salesreasonid = sr.salesreasonid

    )

    /* We then join orders and orders detail to get the final fact table*/
    , final as (
        select
            salesreasonid,
            salesorderid,
            sk_salesreason 
            
        from salesorderheadersalesreason_with_sk

    )

select * from final