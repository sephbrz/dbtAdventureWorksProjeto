with
    source_data as (
        SELECT
            SH.SalesOrderID,-- AS SalesOrderKey,
            SD.SalesOrderDetailID,-- AS SalesOrderLineKey,
            SD.ProductID,-- AS ProductKey,
            --SD.SpecialOfferID AS SpecialOfferKey,
            --SH.[Status] AS SalesOrderStatus,
            --SH.OnlineOrderFlag AS SalesOnlineOrderFlag,
            --SH.AccountNumber AS SalesOrderAccountNumber,
            SH.CustomerID,-- AS SalesOrderCustomerKey,
            SH.CreditCardID,
            --coalesce (SH.SalesPersonID,0) AS SalesPersonKey,
            --SH.TerritoryID AS TerritoryKey,
            SH.BillToAddressID,-- AS BillToAddressKey,
            SH.ShipToAddressID,-- AS ShipToAddressKey,
            --SH.ShipMethodID AS ShipMethodKey,
            cast(format_date("%Y%m%d",SH.OrderDate) as integer) AS SalesOrderDateKey,
            cast(format_date("%Y%m%d",SH.DueDate) as integer) AS SalesOrderDueDateKey,
            cast(format_date("%Y%m%d",SH.ShipDate) as integer) AS SalesOrderShipDateKey,
            --cast(to_char(SH.ModifiedDate,'YYYYMMDD') as integer) AS SalesOrderModifiedDateKey,
            --cast(to_char(SD.ModifiedDate,'YYYYMMDD') as integer) AS SalesOrderDetailModifiedDateKey,
            SD.OrderQty,
            SD.UnitPrice,
            --SD.UnitPriceDiscount,
            --SH.SubTotal AS SalesOrderSubTotal,
            --SH.TaxAmt AS SalesOrderTaxAmount,
            --SH.Freight AS SalesOrderFreightAmount,
            --SH.TotalDue AS SalesOrderTotalDueAmount

        FROM {{source('adventureworks_projeto','salesorderdetail')}} SD
	    JOIN {{source('adventureworks_projeto','salesorderheader')}} SH ON SD.SalesOrderID = SH.SalesOrderID
)

select *
from source_data