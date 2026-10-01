-- 1. PROYECCIÓN DE MOTIVOS DE FUGA
SELECT 
    ravenstack_churn_events.reason_code AS motivo_cancelacion,
    -- Cuantificamos la frecuencia de cada motivo.
    COUNT(ravenstack_churn_events.churn_event_id) AS volumen_fugas,
    -- Calculamos el capital devuelto al cliente (impacto directo en el flujo de caja).
    SUM(ravenstack_churn_events.refund_amount_usd) AS reembolsos_exigidos
-- 2. ORIGEN Y CRUCE DE DATOS
FROM ravenstack_churn_events
-- Cruzamos con la tabla de clientes para poder filtrar.
JOIN ravenstack_accounts 
    ON ravenstack_churn_events.account_id = ravenstack_accounts.account_id
-- 3. FILTRO CLÍNICO
-- Aislamos estrictamente el sector problemático detectado en la consulta anterior.
WHERE ravenstack_accounts.industry = 'DevTools'
-- 4. AGRUPACIÓN Y ORDENACIÓN
GROUP BY ravenstack_churn_events.reason_code
ORDER BY volumen_fugas DESC;