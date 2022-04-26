with 
    staging as (
        select *
        from {{ref('stg_creditcard')}}
)
    , transformed as (
        select
            row_number() over (order by creditcardid) as sk_creditcard, --chave auto-incremental
            creditcardid, 
            cardtype, 
            cardnumber, 
            expmonth, 
            expyear
            
        from staging
)

select *  from transformed