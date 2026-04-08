# 🔐 Segundo Parcial — Servicios Telemáticos

Este repositorio contiene la documentación general del segundo parcial de **Servicios Telemáticos**, centrado en la implementación y validación de **servicios seguros de red** en Linux.

El parcial se dividió en tres partes:

1. **FTPS protegido por Firewall UFW**
2. **DNS sobre TLS (DoT)**
3. **SFTP protegido por Firewall UFW** 

---

## 📌 Objetivo

Aplicar mecanismos de seguridad en servicios telemáticos, configurando servicios reales sobre Linux y comprobando su funcionamiento mediante herramientas de administración, cifrado y análisis de tráfico. 

---

## 🧱 1. FTPS + Firewall UFW

En esta parte se implementó un servicio **FTPS** protegido por **UFW**, de forma que el acceso al servidor de archivos estuviera controlado por el firewall. Se trabajó con `vsftpd`, configuración de puertos permitidos, TLS explícito y pruebas desde **FileZilla**. También se validó el cifrado con **OpenSSL** y se analizó el tráfico con **Wireshark**. 

El objetivo principal fue demostrar que el servicio solo funcionaba cuando el firewall permitía los puertos necesarios y que la transferencia viajaba cifrada. :contentReference[oaicite:3]{index=3}

---

## 🌐 2. DNS sobre TLS (DoT)

En la segunda parte se configuró **DNS sobre TLS** en un cliente Linux usando `systemd-resolved`. Se habilitó el uso de servidores DNS compatibles con DoT, se verificó la resolución correcta de dominios y se comparó el tráfico DNS cifrado con el tráfico DNS tradicional sin cifrar. 

El objetivo fue evidenciar cómo DoT mejora la privacidad y seguridad de las consultas DNS al transportarlas mediante TLS. :contentReference[oaicite:5]{index=5}

---

## 📁 3. SFTP + Firewall UFW

En la tercera parte se trabajó con **SFTP sobre OpenSSH** como alternativa segura para la transferencia de archivos. Se protegió el acceso mediante **UFW**, permitiendo o bloqueando el puerto `22` según la prueba requerida. Luego se realizaron operaciones básicas de transferencia y se analizó el tráfico con Wireshark. 

El objetivo fue comprobar que SFTP permite una transferencia segura usando un único canal SSH cifrado, lo que simplifica la administración frente a FTPS. :contentReference[oaicite:7]{index=7}

---

## 🛠 Herramientas utilizadas

- Ubuntu / Linux
- UFW
- vsftpd
- OpenSSL
- FileZilla
- Wireshark
- systemd-resolved
- OpenSSH / SFTP 

---

## ✅ Conclusión

El parcial permitió aplicar conceptos importantes de seguridad en redes, integrando firewall, cifrado y validación de tráfico en distintos servicios. FTPS y SFTP demostraron dos formas de proteger la transferencia de archivos, mientras que DoT mostró cómo proteger la resolución DNS. En conjunto, el trabajo permitió comprender mejor la relación entre servicios, puertos, cifrado y control de acceso. 
