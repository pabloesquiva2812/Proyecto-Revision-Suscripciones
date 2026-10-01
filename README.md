# Auditoría Analítica SaaS: Diagnóstico Operativo de Fuga de Capital y Retención de MRR

Este repositorio contiene una auditoría analítica *end-to-end* sobre un modelo de negocio SaaS (Software as a Service). El objetivo central es cuantificar la destrucción de Ingresos Recurrentes Mensuales (MRR) mediante el procesamiento relacional de bases de datos y aislar la causa raíz operativa de la cancelación de clientes mediante un modelo semántico.

## Estructura del Repositorio

La arquitectura del proyecto se divide en tres fases lógicas de procesamiento, documentadas en sus respectivos directorios[cite: 8]:

### 📁 Database
Contiene el conjunto de datos transaccionales sin procesar, segmentado en entidades de negocio[cite: 8]:
* `ravenstack_accounts.csv`: Dimensión de clientes y sector industrial[cite: 8].
* `ravenstack_subscriptions.csv`: Histórico de altas y facturación recurrente[cite: 8].
* `ravenstack_churn_events.csv`: Registro de cancelaciones y volumen de reembolsos[cite: 8].
* `ravenstack_support_tickets.csv`: Tiempos de resolución, evaluación técnica y escalados[cite: 8].
* `ravenstack_feature_usage.csv`: Registro de telemetría y uso de producto[cite: 8].

### 📁 Scripts
Motor analítico del proyecto. Contiene las consultas SQL estructuradas de forma secuencial para la extracción del diagnóstico[cite: 8]:
* `01_analisis_mrr_por_sector.sql`: Segmentación del volumen de negocio y exposición inicial de riesgo[cite: 8].
* `02_analisis_churn_fuga_capital.sql`: Cuantificación del impacto económico directo por pérdida de cohortes[cite: 8].
* `03_causa_raiz_churn_devtools.sql`: Aislamiento de la industria crítica y cruce con motivos de cancelación declarados[cite: 8].
* `04_auditoria_tiempos_soporte.sql`: Evaluación de eficiencia operativa del Nivel 1 de asistencia[cite: 8].
* `Suscripciones_Sql`: Espacio de trabajo base de la base de datos relacional[cite: 8].

### 📁 Dashboard
Capa de visualización directiva interactiva, construida sobre un esquema en estrella con modelado DAX (inteligencia de tiempo inactiva/activa)[cite: 8]:
* `Dashboard.pbix`: Archivo principal interactivo de Power BI[cite: 8].
* `Resumen financiero - P.Subs.png`: Vista estática del síntoma económico global[cite: 8].
* `Diagnostico- P.Subs.png`: Vista estática del aislamiento de la falla de negocio[cite: 8].

## Diagnóstico Clínico y Hallazgos

El análisis cruzado refutó la hipótesis inicial de abandono por sensibilidad al precio o impacto de la competencia. Se demostró una deficiencia operativa estructural:

1. **Foco de Pérdida:** El sector `DevTools` encabeza la destrucción de capital, generando fugas severas documentadas en exigencia de reembolsos.
2. **Causa Operativa:** El motivo central de cancelación es la deficiente calidad del soporte técnico (nota promedio inferior a 2.5/5).
3. **Fallo Estructural:** Los agentes de Nivel 1 cierran los tickets técnicos con alta velocidad, pero la tasa de escalado a ingenieros de Nivel 2 es del 0%. Los clientes técnicos reciben respuestas genéricas no resolutivas, generando un patrón directo de frustración y cancelación de licencias.

## Stack Tecnológico
* **SQL:** Back-end, cruces relacionales (`JOINs`), funciones de agregación y limpieza inicial.
* **Power BI & DAX:** Front-end, esquema en estrella, métricas de inteligencia temporal cruzada (`USERELATIONSHIP`) y diseño corporativo de visualización dato-tinta.
