with
    source_data as (
        select
            a.addressId,
            --cast(format_date("%Y%m%d",a.ModifiedDate) as integer) AS ModifiedDateKey,
             --sp.territoryId as TerritoryKey,
            a.addressline1,
            a.addressline2,
            a.city,
            a.postalcode,
            --a.spatiallocation,
            sp.stateprovincecode,
            --sp.isonlystateprovinceflag,
            sp.name as stateProvinceName,
            cr.countryregioncode,
            cr.name as CountryRegionName

        from {{source('adventureworks_projeto','address')}} as a
        left join {{source('adventureworks_projeto','stateprovince')}} as sp on sp.stateprovinceid = a.stateprovinceid
        left join {{source('adventureworks_projeto','countryregion')}} as cr on cr.countryregioncode = sp.countryregioncode
)

select *
from source_data