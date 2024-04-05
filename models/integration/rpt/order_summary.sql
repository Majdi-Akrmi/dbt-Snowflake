with final as (
    select c.R_NAME as REGION_NAME,
    count(*) as ORDER_COUNT,
    sum(o.O_TOTALPRICE) as TOTAL_AMOUNT
    from {{ source('raw_data', 'orders') }} o 
    inner join {{ ref('customer_details') }} c on o.O_CUSTKEY = c.C_CUSTKEY
    group by all 
)
select * from final