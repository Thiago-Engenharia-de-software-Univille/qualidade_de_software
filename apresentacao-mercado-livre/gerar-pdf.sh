#!/usr/bin/env bash
# Gera o PDF dos slides e a imagem de capa usada na página de download.
# Rode de novo sempre que mudar algo no index.html.
set -euo pipefail
cd "$(dirname "$0")"
CHROME=$(command -v google-chrome || command -v chromium || command -v chromium-browser)

"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=5000 \
  --print-to-pdf=mercado-livre-iso25000.pdf "file://$PWD/index.html?print"

"$CHROME" --headless=new --disable-gpu --window-size=1600,900 --virtual-time-budget=5000 \
  --screenshot=capa.png "file://$PWD/index.html?print"

echo "Gerado: mercado-livre-iso25000.pdf e capa.png"
