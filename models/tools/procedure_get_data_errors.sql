CREATE OR REPLACE PROCEDURE contar_linhas_dbt_audit()
LANGUAGE plpgsql
AS $$
DECLARE
    r RECORD;
    row_count BIGINT;
BEGIN
    FOR r IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public_dbt_test__audit'
          AND table_type = 'BASE TABLE'
    LOOP
        EXECUTE format('SELECT COUNT(*) FROM public_dbt_test__audit.%I', r.table_name)
        INTO row_count;

        RAISE NOTICE 'Tabela: %, Linhas: %', r.table_name, row_count;
    END LOOP;
END;
$$;
