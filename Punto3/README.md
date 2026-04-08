# Punto 3 - Implementación y análisis de SFTP sobre SSH

## Descripción

En este punto se realizó la verificación, habilitación y prueba del servicio *SFTP* usando *OpenSSH, con el objetivo de validar una alternativa segura para la transferencia de archivos. Además, se comprobó su funcionamiento mediante pruebas de conexión desde el cliente, control de acceso con **UFW* y análisis de tráfico con *Wireshark*.

## Objetivo

Implementar y verificar el uso de *SFTP* como mecanismo seguro de transferencia de archivos, comprobando:

- que el servicio SSH estuviera instalado y activo,
- que SFTP estuviera habilitado,
- que el acceso pudiera controlarse mediante reglas de firewall,
- y que el tráfico viajara cifrado durante toda la sesión.

## Topología
Se trabajó con la siguiente arquitectura:

- Cliente  
- Servidor (servidor1) con UFW y servicio OpenSSH  
- Red: 192.168.50.0/24  

El cliente se conecta al servidor mediante el puerto 22 (SSH), el cual es controlado por el firewall UFW.


## Contenido del repositorio
La carpeta `punto 3` incluye un archivo **`punto3_comandos.pdf`**. Este documento contiene el desarrollo completo de la actividad, incluyendo la ejecución de comandos, configuración de servicios, pruebas realizadas y evidencias mediante capturas de pantalla que respaldan cada uno de los requerimientos solicitados.


## Procedimiento realizado

### 1. Verificación del entorno

Se comprobó que *OpenSSH* estuviera instalado correctamente en el servidor y que el servicio *SSH* se encontrara activo. Después, se validó que *SFTP* estuviera habilitado y disponible para su uso.

### 2. Prueba de conexión desde el cliente

Desde el cliente se realizó una prueba de conexión para confirmar que el acceso por SFTP funcionara correctamente. Luego se revisó el estado de *UFW* y la apertura del puerto 22.

### 3. Validación del firewall

Como parte de la prueba, se bloqueó temporalmente el *puerto 22* para verificar que la conexión fallara. Después se volvió a habilitar el acceso y se confirmó nuevamente el funcionamiento correcto del servicio.

### 4. Pruebas funcionales en SFTP

Una vez establecida la conexión, se ejecutaron los comandos solicitados dentro de la sesión SFTP. También se verificó el comportamiento del sistema al eliminar un archivo durante la práctica.

### 5. Captura y análisis con Wireshark

Finalmente, se capturó el tráfico generado durante la sesión usando el filtro:

bash
tcp.port == 22


En Wireshark se observó que:

- el protocolo identificado fue *SSHv2*,
- se realizó intercambio de claves,
- aparecieron mensajes como *New Keys*,
- y el resto de los paquetes fueron marcados como *Encrypted packet*.

Esto evidencia que toda la sesión viajó cifrada.

## Evidencias incluidas

En la carpeta evidencias/punto3/ se almacenan las capturas correspondientes a:

- verificación de OpenSSH,
- estado del servicio SSH,
- validación de SFTP,
- conexión desde el cliente,
- bloqueo y habilitación del puerto 22,
- uso de comandos en la sesión,
- eliminación de archivo,
- y capturas de tráfico en Wireshark.

## Comparación entre FTPS y SFTP

A partir de las pruebas realizadas, se identificó que *FTPS* utiliza el puerto 21 y puertos adicionales para transferencia de datos, además de negociar el cifrado después de iniciar la conexión. En cambio, *SFTP* opera únicamente sobre el *puerto 22* y cifra toda la comunicación desde el inicio usando *SSH*. También ofrece una configuración más sencilla y mejor compatibilidad con firewalls.

## Tabla comparativa

| Criterio | FTPS | SFTP |
|---|---|---|
| Protocolo base | FTP + SSL/TLS | SSH |
| Número de puertos utilizados | 21 + puertos dinámicos | Solo puerto 22 |
| Tipo de autenticación | Certificados SSL/TLS | Claves SSH |
| Modo de cifrado | Después de la negociación | Desde el inicio |
| Compatibilidad con firewalls | Baja | Alta |
| Facilidad de configuración | Más compleja | Más sencilla |

## Conclusión

La práctica permitió comprobar que *SFTP* es una alternativa más segura y práctica para la transferencia de archivos frente a FTPS, debido a que utiliza un solo puerto, simplifica la configuración y protege toda la comunicación desde el inicio mediante cifrado SSH. Las capturas de Wireshark confirmaron que no se expone información sensible en texto plano durante la sesión.
