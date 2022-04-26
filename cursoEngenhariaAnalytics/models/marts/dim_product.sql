with 
    staging as (
        select *
        from {{ref('stg_product')}}
)
    , transformed as (
        select
            row_number() over (order by ProductID) as sk_product, --chave auto-incremental
            ProductID,            
            ProductName,
            ProductNumber,
            ProductLine,
            ProductClass,
            ProductStyle,

        from staging
)

select *  from transformed