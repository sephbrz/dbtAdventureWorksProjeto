with
    source_data as (
        select
            c.customerid, 
            c.personid,
            --c.storeid, 
            --c.territoryid, 
            --p.persontype, 
            --p.namestyle, 
            --p.title, 
            p.firstname, 
            p.middlename, 
            p.lastname, 
            --p.suffix, 
            --p.emailpromotion,
            --p.additionalcontactinfo, 
            --p.demographics

        from {{source('adventureworks_projeto','customer')}} as c
        left join {{source('adventureworks_projeto','person')}} as p on p.businessentityid = c.personid
)

select *
from source_data