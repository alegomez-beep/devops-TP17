# DevOps TP17 - Seguridad en el Pipeline CI/CD con Gitleaks

Este repositorio implementa la integración de controles de seguridad en el pipeline de CI/CD para detectar credenciales expuestas, llaves API y otros secretos en el historial del proyecto mediante **Gitleaks**.

---

##  Matriz de Controles de Gitleaks

| Job en Pipeline | Tipo de Evaluación | Exit Code | Acción ante Hallazgos | Evidencia Generada |
| :--- | :--- | :--- | :--- | :--- |
| **`gitleaks-andon-cord`** | Escaneo de historial completo de Git | `1` | Activa Cordón Andon (Bloquea Merge/Pipeline) | Resumen en `$GITHUB_STEP_SUMMARY` |
| `gitleaks-audit-report | Generación de Informe Técnico | `0` | Informativo (Genera Evidencia Auditable) | Artefacto JSON descargable (14 días) |

---

## 🛠️structura del Pipeline DevSecOps

1. **Fase 1: Build & Package** - Detecta de forma dinámica el Dockerfile y empaqueta la aplicación de forma inmutable.
2. **Fase 2A: Gitleaks (Andon Cord)** - Revisa el historial de commits y frena el pipeline en caso de fugas.
3. **Fase 2B: Gitleaks (Audit Report)** - Exporta el informe de hallazgos en formato JSON.
4. **Fase 3: Release & Deploy** - Ejecuta el despliegue seguro una vez superadas las fases anteriores.
