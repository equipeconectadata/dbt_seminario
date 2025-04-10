
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with olap_fato_pagamento_bolsa as (

    select * from  fato_pagamento_bolsa

)

select *
from olap_fato_pagamento_bolsa

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
