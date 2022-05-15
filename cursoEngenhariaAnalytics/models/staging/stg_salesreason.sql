with
    source_data as (
        select
            sr.salesreasonid,
            sr.reasontype,
            sr.name as ReasonName
            
        from {{source('adventureworks_projeto','salesreason')}} as sr
)

select *
from source_data