-- 1. PROYECCIÓN DE MÉTRICAS DE RENDIMIENTO DE SOPORTE
SELECT 
    ravenstack_accounts.industry AS sector_industrial,
    -- Calculamos la media de tiempo que tardan en resolver el problema completo.
    ROUND(AVG(ravenstack_support_tickets.resolution_time_hours), 2) AS horas_medias_resolucion,
    -- Calculamos cuánto esperan los clientes para recibir el primer mensaje.
    ROUND(AVG(ravenstack_support_tickets.first_response_time_minutes), 2) AS minutos_medios_primera_respuesta,
    -- Evaluamos la nota media que dejan los clientes.
    ROUND(AVG(ravenstack_support_tickets.satisfaction_score), 2) AS nota_satisfaccion,
    -- Contabilizamos el volumen total de problemas graves (tickets escalados).
    SUM(ravenstack_support_tickets.escalation_flag) AS volumen_tickets_escalados
-- 2. ORIGEN Y CRUCE DE DATOS
FROM ravenstack_support_tickets
JOIN ravenstack_accounts 
    ON ravenstack_support_tickets.account_id = ravenstack_accounts.account_id
-- 3. AGRUPACIÓN Y ORDENACIÓN
GROUP BY ravenstack_accounts.industry
ORDER BY horas_medias_resolucion DESC;