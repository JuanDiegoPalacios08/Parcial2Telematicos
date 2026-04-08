#!/bin/bash

echo "=== Configurando DNS over TLS con systemd-resolved ==="

sudo tee /etc/systemd/resolved.conf > /dev/null <<'EOF'
[Resolve]
DNS=1.1.1.1 1.0.0.1
FallbackDNS=8.8.8.8 8.8.4.4
DNSOverTLS=yes
DNSSEC=no
Cache=yes
EOF

echo "=== Reiniciando systemd-resolved ==="
sudo systemctl restart systemd-resolved

echo "=== Limpiando caché DNS ==="
sudo resolvectl flush-caches

echo "=== Mostrando estado ==="
resolvectl status

echo "=== Consultas de prueba ==="
resolvectl query google.com
resolvectl query openai.com
resolvectl query ubuntu.com

echo "=== Fin de la configuración ==="
