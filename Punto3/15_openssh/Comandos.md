# 15. Configuración de OpenSSH para SFTP

## Descripción

Para permitir conexiones SFTP, se utilizó el servicio OpenSSH en el servidor. SFTP (SSH File Transfer Protocol) funciona sobre el protocolo SSH, por lo que no requiere instalación adicional si OpenSSH ya se encuentra instalado.

---

## Verificación de instalación de OpenSSH

Se verificó que el paquete `openssh-server` estuviera instalado mediante el siguiente comando:

`dpkg -l | grep openssh-server `

Esto permite confirmar que el servidor cuenta con el servicio necesario para conexiones SSH y SFTP.


## Verificación del estado del servicio SSH

Se comprobó que el servicio SSH estuviera activo con el siguiente comando:

`sudo systemctl status ssh`
El estado del servicio debe aparecer como:

`active (running)`
Esto indica que el servidor está listo para aceptar conexiones SSH.



## Verificación de SFTP en la configuración

Se accedió al archivo de configuración de SSH:
`sudo nano /etc/ssh/sshd_config`

Dentro de este archivo se verificó la existencia de la siguiente línea:
`Subsystem sftp /usr/lib/openssh/sftp-server`

Esta línea indica que el subsistema SFTP está habilitado en el servidor.


## Conclusión

Se verificó que OpenSSH se encuentra correctamente instalado y en ejecución, y que el subsistema SFTP está habilitado en su configuración. Esto permite establecer conexiones seguras de transferencia de archivos mediante SFTP sin necesidad de configuraciones adicionales.
