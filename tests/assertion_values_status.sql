select
    status_pagamento 
FROM {{ ref('get_data_from_fato_pagamento_bolsa') }}
where status_pagamento not in ('Pago', 'Pendente', 'Atrasado', 'Cancelado')