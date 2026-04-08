# Parcial 2 - Punto 3  
## SFTP protegido por Firewall UFW

## Descripción

En este punto se implementa una solución de transferencia segura de archivos mediante SFTP (SSH File Transfer Protocol) sobre OpenSSH, protegida por el firewall UFW. A diferencia de FTPS, SFTP encapsula toda la comunicación dentro de un único canal cifrado utilizando el protocolo SSH, lo que mejora la seguridad y simplifica la configuración en entornos con restricciones de red.

---

## Topología

Se trabajó con la siguiente arquitectura:

- Cliente  
- Servidor (servidor1) con UFW y servicio OpenSSH  
- Red: 192.168.50.0/24  

El cliente se conecta al servidor mediante el puerto 22 (SSH), el cual es controlado por el firewall UFW.

---

## Contenido del repositorio

- `punto3/15_openssh.md`: Configuración y verificación del servicio OpenSSH  
- `punto3/16_ufw.md`: Configuración y pruebas del firewall UFW  
- `punto3/17_sftp.md`: Conexión y operaciones SFTP  
- `punto3/18_wireshark.md`: Captura y análisis de tráfico SFTP  
- `punto3/19_tabla.md`: Comparación entre FTPS y SFTP  
- `capturas/`: Evidencias de cada uno de los puntos  

---

## Objetivos

- Implementar un servicio SFTP seguro utilizando OpenSSH  
- Configurar el firewall UFW para controlar el acceso al servicio  
- Verificar el funcionamiento de SFTP mediante pruebas desde un cliente  
- Analizar el tráfico de red para evidenciar el cifrado de la comunicación  
- Comparar SFTP con FTPS en términos de seguridad y configuración  

---

## Resultados

Se logró implementar correctamente el servicio SFTP protegido por UFW. Se comprobó que el acceso al servicio depende de las reglas del firewall, ya que al bloquear el puerto 22 la conexión falla, y al habilitarlo la transferencia se realiza exitosamente.

El análisis del tráfico mostró que toda la comunicación viaja cifrada mediante SSH, sin exposición de credenciales ni datos en texto plano. En contraste, FTP utiliza múltiples puertos y requiere negociación adicional para el cifrado.

---

## Conclusión

SFTP es una solución más eficiente y segura para la transferencia de archivos en entornos con restricciones de firewall, ya que utiliza un único puerto (22) y garantiza el cifrado completo de la comunicación desde el inicio. Esto simplifica la configuración y mejora la protección de la información frente a otros protocolos como FTPS.
