with 
    staging as (
        select *
        from {{ref('stg_salesreason')}}
)
    , transformed as (
        select
            row_number() over (order by salesreasonid) as sk_salesreason, --chave auto-incremental
            salesreasonid,
            reasontype,
            ReasonName
            
        from staging
)

select * from transformed