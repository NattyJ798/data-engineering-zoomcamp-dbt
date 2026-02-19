with green_data as (
  select *,
  'Green' as service_type
  from {{ ref('stg_nytaxi_green_tripdata')}}  
),
yellow_data as (
  select *,
  'Yellow' as service_type
  from {{ ref('stg_nytaxi_yellow_tripdata')}}  
),

trips_unioned as (
    select * from green_data
    union -- Select all rows from 'yellow_data
    SELECT * FROM yellow_data
)
select * from trips_unioned