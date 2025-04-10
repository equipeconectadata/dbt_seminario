{{ config(materialized='view') }}

SELECT 
    id_projeto_sk, 
    id_projeto, 
    REGEXP_REPLACE(nome_projeto, '[^a-zA-Z0-9 ]', '', 'g') AS nome_projeto,
    edital,
    data_inicio,
    data_fim 
FROM {{ ref('get_data_from_dim_projeto') }}