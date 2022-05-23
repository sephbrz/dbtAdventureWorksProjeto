with 
    staging as (
        select *
        from {{ref('stg_address')}}
)
    , transformed as (
        select
            row_number() over (order by addressId) as sk_address, --chave auto-incremental
            addressId,         
            addressline1,
            addressline2,
            city,
            postalcode,
            stateprovincecode,
            stateProvinceName,
            countryregioncode,
            CountryRegionName

        from staging
)

select *  from transformed