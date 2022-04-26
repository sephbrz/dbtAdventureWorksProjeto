with 
    staging as (
        select *
        from {{ref('stg_customer')}}
)
    , transformed as (
        select
            row_number() over (order by customerid) as sk_customer, --chave auto-incremental
            customerid,
            concat(firstname," ",lastname," - ",customerid) as UniqueFullName,
            personid, 
            title, 
            firstname, 
            middlename, 
            lastname, 
            suffix

        from staging
)

select *  from transformed