
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

SELECT 
    id_pessoa_sk, 
    id_pessoa, 
    REGEXP_REPLACE(nome, '[^a-zA-ZÀ-ÿ ]', '', 'g') AS nome_corrigido,
    data_nascimento
FROM {{ ref('get_data_from_dim_pessoa') }}


/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
