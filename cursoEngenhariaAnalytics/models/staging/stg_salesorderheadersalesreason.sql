with
    source_data as (
        select
            sohsr.salesreasonid,
            sohsr.salesorderid
            
        from {{source('adventureworks_projeto','salesorderheadersalesreason')}} as sohsr
)

select *
from source_data