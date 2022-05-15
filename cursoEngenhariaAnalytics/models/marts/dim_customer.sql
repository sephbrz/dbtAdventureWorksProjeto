with 
    staging as (
        select *
        from {{ref('stg_customer')}}
)
    , transformed as (
        select
            row_number() over (order by customerid) as sk_customer, --chave auto-incremental
            customerid,
            concat(firstname," ",middlename," ",lastname," - ",customerid) as UniqueFullName,
            personid,  
            firstname, 
            middlename, 
            lastname

        from staging
)

select * from transformed