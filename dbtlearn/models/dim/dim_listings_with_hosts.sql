WITH 
listings AS (
    SELECT * FROM {{ref("dim_listings_cleansed")}}
),
hosts AS (
    SELECT * FROM {{ref('dim_hosts_cleansed')}}
)
SELECT 
    listings.LISTING_ID,
    listings.LISTING_NAME, 
    listings.ROOM_TYPE, 
    listings.MINIMUM_NIGHTS, 
    listings.HOST_ID, 
    hosts.HOST_NAME,
    hosts.IS_SUPERHOST AS host_is_superhost,
    listings.CREATED_AT, 
    GREATEST(listings.UPDATED_AT, hosts.updated_at) as updated_at
FROM listings 
LEFT JOIN hosts on (hosts.HOST_ID = listings.HOST_ID)