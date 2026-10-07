#!/bin/bash
set -uo pipefail
echo "=== Verificación Técnica TP17 Gitleaks ==="
if command -v gitleaks &> /dev/null; then
  echo "  [OK] Gitleaks instalado ($(gitleaks version))"
fi
