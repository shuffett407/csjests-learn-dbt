{{ config(materialized='incremental', unique_key = 'id') }}

SELECT  id,
        image_datetime 
FROM    `bigquery-public-data`.`eclipse_megamovie`.`photos_v_0_2` 
WHERE   image_datetime <= TIMESTAMP_ADD(
            TIMESTAMP('2017-08-21 00:00:00 UTC'), 
            INTERVAL UNIX_SECONDS(CURRENT_TIMESTAMP()) - UNIX_SECONDS(TIMESTAMP(CURRENT_DATE())) 
            SECOND)

{% if is_incremental() %}
  and image_datetime > (select max(image_datetime) from {{ this }})
{% endif %}            