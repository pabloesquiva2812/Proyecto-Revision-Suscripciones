-- 1. PROYECCIÓN DE MÉTRICAS DE FUGA
SELECT 
    ravenstack_accounts.industry AS sector_industrial,
    -- Contamos cuántos eventos de cancelación ha registrado cada sector.
    COUNT(ravenstack_churn_events.churn_event_id) AS volumen_cancelaciones,
    -- Sumamos el MRR de esas suscripciones canceladas para cuantificar la pérdida real.
    SUM(ravenstack_subscriptions.mrr_amount) AS mrr_perdido_fuga
-- 2. TRIPLE CRUCE RELACIONAL
FROM ravenstack_accounts
-- Primer enlace: Obtenemos el valor económico de la suscripción.
JOIN ravenstack_subscriptions 
    ON ravenstack_accounts.account_id = ravenstack_subscriptions.account_id
-- Segundo enlace: Filtramos estrictamente a los clientes que han generado un evento de baja.
JOIN ravenstack_churn_events 
    ON ravenstack_accounts.account_id = ravenstack_churn_events.account_id
-- 3. AGRUPACIÓN Y ORDENACIÓN
GROUP BY ravenstack_accounts.industry
ORDER BY mrr_perdido_fuga DESC;