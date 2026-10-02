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

El análisis cruzado refutó la hipótesis inicial de abandono por sensibilidad al precio o impacto de la competencia. Se demostró una deficiencia operativa estructural basada en una segmentación inadecuada del soporte técnico B2B:

1. **Foco de Pérdida:** El sector `DevTools` (clientes de perfil altamente técnico) encabeza la destrucción de capital, generando fugas severas documentadas en exigencias de reembolsos directos.
2. **Causa Operativa:** El motivo central de cancelación declarado por este segmento es la ineficacia del área de `support`.
3. **Fallo Estructural (Cuello de Botella):** El protocolo de soporte no está adaptado a la complejidad de la cartera. Los agentes de Nivel 1 cierran los tickets con alta velocidad, derivando apenas un volumen marginal (20 tickets) a los ingenieros de Nivel 2. Al intentar resolver incidencias complejas con respuestas genéricas de Nivel 1, se genera un patrón de frustración técnica que desemboca en la cancelación del servicio y la exigencia del reembolso.

## Stack Tecnológico
* **SQL:** Back-end, cruces relacionales (`JOINs`), funciones de agregación y limpieza inicial.
* **Power BI & DAX:** Front-end, esquema en estrella, métricas de inteligencia temporal cruzada (`USERELATIONSHIP`) y diseño corporativo de visualización dato-tinta.
