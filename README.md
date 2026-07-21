# streaming-habits-ia


# 🎧 Streaming UX Analytics & Sentiment Analysis (2026)


## 📌 Descripción del Proyecto
Este proyecto es una solución **End-to-End de Inteligencia de Datos** orientada al análisis de experiencia de usuario (UX) y hábitos de consumo en plataformas de streaming musical. 

Combina una arquitectura de base de datos relacional robusta en **PostgreSQL (Supabase)**, procesamiento en tiempo real y clasificación del lenguaje natural vía **IA (n8n)**, finalizando en un panel ejecutivo dinámico de toma de decisiones en **Looker Studio**.

---

## 🏗️ Arquitectura de la Solución


```

[ Feedback Usuario ] ➔ [ Pipeline / Workflow n8n (IA) ] ➔ [ PostgreSQL (Supabase) ] ➔ [ Dashboard Looker Studio ]

```

1. **Ingesta y Procesamiento (n8n):** Recepción de feedback sin estructurar, clasificación de sentimiento (*Positivo, Neutro, Negativo*) e identificación automática de áreas de impacto en UX (*UI, Performance, Contenido, Precio*).
2. **Almacenamiento Relacional (Supabase / DBeaver):** Modelado mediante un **Modelo en Estrella (Star Schema)** centralizado para optimizar consultas analíticas.
3. **Visualización de Negocio (Looker Studio):** Tablero interactivo para el monitoreo de KPIs operativos y hábitos de reproducción.

---

## 🗄️ Modelo de Datos (PostgreSQL)

El esquema consta de una tabla principal de hechos (*Fact Table*) vinculada formalmente mediante claves foráneas (*Foreign Keys*) a sus tablas de dimensión:

* **`feedback_usuarios_ia` (Fact Table):** Contiene los registros de uso diario, métricas de retención/salto y la salida del análisis de sentimiento procesado por IA.
* **`dim_usuarios` (Dimension Table):** Información demográfica y perfil del oyente (`listener_id`).
* **`dim_plataformas` (Dimension Table):** Catálogo de canales de reproducción y dispositivos (`platform_id`).

---

## 📊 Métricas e Indicadores Clave (KPIs)

El dashboard analiza principalmente:
* **Satisfaction Score (Nivel de Satisfacción Promedio):** Calificación global del servicio (1 a 5).
* **Consumo Diario Promedio (min):** Métrica de *engagement* por usuario.
* **Tasa de Salto (Skip Rate %):** Indicador de fricción en la reproducción de contenido.
* **Análisis Cualitativo por IA:** Desglose semántico de sentimientos y categorías de fallas reportadas.

---

## 🔗 Recursos y Accesos Directos

* 📊 **Dashboard Interactivo:** [Ver Dashboard en Looker Studio](https://datastudio.google.com/s/izAF1WPnxVM)
* ⚡ **Workflow de Automatización:** [Ver archivo de exportación de n8n](https://qg-ai-internal.app.n8n.cloud/workflow/uLcf6pNt1415aGna)
* 🗄️ **Diagrama ERD / Supabase:** [Ver esquema de base de datos](https://supabase.com/dashboard/project/zbrdltklldfjeabxekpr/database/schemas)

---

### 👨‍💻 Desarrollado por:
* **Franco Suárez** — *DATA AI QUX*
* **Año:** 2026
