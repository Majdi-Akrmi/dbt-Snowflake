{{
    config(
        materialized="view",
        alias="customer_details",
        schema="STG"
    )
}}

with final as
(
    select c.C_CUSTKEY,
    C_NAME,
    C_ADDRESS,
    C_PHONE,
    n.N_NAME,
    r.R_NAME
from {{ source('raw_data', 'customer') }} c 
inner join {{ source('raw_data', 'nation') }} n on c.C_NATIONKEY = n.N_NATIONKEY
inner join {{ source('raw_data', 'region') }} r on n.N_REGIONKEY = r.R_REGIONKEY
)
select * from final