{{config(materialized='view')}}

SELECT
    p.nome AS nome_pessoa,           -- Nome da pessoa da dimensão pessoa
    sum(f.valor_pago) AS valor_bolsa,          -- Valor da bolsa da dimensão bolsa
    f.status_pagamento       -- Status do pagamento da tabela fato
FROM
    {{ ref('get_data_from_fato_pagamento_bolsa') }} f   -- Tabela Fato centraliza os IDs
JOIN
    {{ ref('dim_pessoa_nomes_tratados') }} p ON f.id_pessoa_sk = p.id_pessoa_sk -- Junta com dim_pessoa pela chave substituta
JOIN
    {{ ref('dim_projeto_nomes_tratados') }} pr ON f.id_projeto_sk = pr.id_projeto_sk -- Junta com dim_projeto pela chave substituta
group by p.nome ,f.status_pagamento,pr.nome_projeto
ORDER BY
    p.nome,                  -- Opcional: Ordena para melhor visualização
    pr.nome_projeto