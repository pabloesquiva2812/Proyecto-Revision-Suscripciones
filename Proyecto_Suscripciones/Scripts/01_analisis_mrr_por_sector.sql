-- 1. SELECCIÓN DE VARIABLES (Proyección)
-- Definimos qué columnas queremos visualizar utilizando el nombre completo de la tabla original.
SELECT 
    ravenstack_accounts.industry AS sector_industrial,    
    -- 2. MÉTRICAS AGREGADAS (KPIs)
    -- Contamos las IDs de suscripción para medir el volumen de contratos por sector.
    COUNT(ravenstack_subscriptions.subscription_id) AS volumen_suscripciones,
    -- Sumamos el importe mensual (MRR) para cuantificar el impacto financiero.
    SUM(ravenstack_subscriptions.mrr_amount) AS mrr_total
-- 3. ORIGEN Y CRUCE DE DATOS (Modelo Relacional)
-- Partimos de la tabla de clientes.
FROM ravenstack_accounts
-- Unimos la tabla de suscripciones declarando explícitamente el origen de cada identificador.
JOIN ravenstack_subscriptions 
    ON ravenstack_accounts.account_id = ravenstack_subscriptions.account_id
-- 4. AGRUPACIÓN (Segmentación)
-- Todo el cálculo de COUNT y SUM se aplicará a cada sector de forma independiente.
GROUP BY ravenstack_accounts.industry
-- 5. ORDENACIÓN
-- Ordenamos el resultado de mayor a menor (DESC) basándonos en el dinero generado.
ORDER BY mrr_total DESC;