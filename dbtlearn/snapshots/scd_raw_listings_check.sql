{% snapshot scd_raw_listings_check %}

{{
   config(
       target_schema='dev',
       unique_key='id',
       strategy='check',
       check_cols=['minimum_nights'],
       invalidate_hard_deletes=True
   )
}}

SELECT * FROM {{ source('airbnb', 'listings') }}


{% endsnapshot %}