

{{ config(materialized='view') }}

SELECT 
    id_pessoa_sk, 
    id_pessoa, 
    REGEXP_REPLACE(nome, '[^a-zA-ZÀ-ÿ ]', '', 'g') AS nome,
    data_nascimento,
    data_inicio ,
    data_fim 
FROM {{ ref('get_data_from_dim_pessoa') }}

