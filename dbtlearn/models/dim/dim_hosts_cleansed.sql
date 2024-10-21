{{
    config(
        materialized='view'
    )
}}
WITH dim_hosts_cleansed AS (
    SELECT * FROM {{ ref("src_hosts")}}
)
SELECT 
    HOST_ID, 
    NVL("HOST_NAME", 'Anonymous') as HOST_NAME, 
    IS_SUPERHOST, 
    CREATED_AT, 
    UPDATED_AT
FROM dim_hosts_cleansed 