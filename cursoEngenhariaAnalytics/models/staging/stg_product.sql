with
    source_data as (
        SELECT
            P.ProductID,
            P.Name AS ProductName,
            P.ProductNumber,
            --P.MakeFlag,
            --P.FinishedGoodsFlag,
            --P.Color AS Color,
            --P.Size AS Size,
            --P.Weight AS Weight,
            P.ProductLine,
            P.Class as ProductClass,
            P.Style as ProductStyle,
            --cast(format_date("%Y%m%d",P.SellStartDate) as integer) AS SellStartDateKey,
            --cast(format_date("%Y%m%d",P.SellEndDate) as integer) AS SellEndDateKey
            --cast(format_date("%Y%m%d",P.discontinueddate) as integer) AS DiscontinuedDateKey
            --cast(format_date("%Y%m%d",P.ModifiedDate) as integer) AS ModifiedDateKey

        FROM {{source('adventureworks_projeto','product')}} P
)

select *
from source_data