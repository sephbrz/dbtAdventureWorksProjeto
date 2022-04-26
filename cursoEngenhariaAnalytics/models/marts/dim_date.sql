with 
    staging as (
        select *
        from {{ref('stg_date')}}
)
    , transformed as (
        select
             date_day,
             DateKey,
             prior_date_day,
             next_date_day,
             day_of_week,
             day_of_week_name,
             day_of_week_name_short,
             day_of_month,
             day_of_year,
             week_start_date,
             week_end_date,
             week_of_year,
             month_of_year,
             month_name,
             month_name_short,
             month_start_date,
             month_end_date,
             quarter_of_year,
             quarter_start_date,
             quarter_end_date,
             year_number,
             year_start_date,
             year_end_date

        from staging
)

select *  from transformed