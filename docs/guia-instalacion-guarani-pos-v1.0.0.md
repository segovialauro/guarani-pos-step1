# Guia de instalacion - Guarani POS v1.0.0

Esta guia explica una forma practica de instalar Guarani POS en la computadora del cliente para empezar a operar.

## 1. Requisitos recomendados

- Windows 10 o Windows 11
- 8 GB de RAM o mas
- 10 GB de espacio libre
- Java 17
- Maven 3.9 o superior
- Node.js 20 o superior
- PostgreSQL 15 o superior
- Navegador moderno: Google Chrome o Microsoft Edge

## 2. Estructura actual del proyecto

El proyecto esta separado en:

- `backend`: API Spring Boot
- `frontend`: aplicacion Angular
- `db`: apoyo para base de datos
- `scripts/windows`: utilidades para instalacion, inicio y respaldo en Windows

## 3. Instalar dependencias base

### Java

1. Descargar e instalar Java 17.
2. Verificar con:

```powershell
java -version
```

### Maven

1. Descargar Maven.
2. Configurar la variable de entorno.
3. Verificar con:

```powershell
mvn -version
```

### Node.js

1. Descargar e instalar Node.js LTS.
2. Verificar con:

```powershell
node -v
npm -v
```

### PostgreSQL

1. Instalar PostgreSQL.
2. Crear una base de datos llamada `guarani_pos`.
3. Confirmar usuario y contrasena que se usaran en la app.

## 4. Configurar el backend

Revisar estos archivos:

- `backend/src/main/resources/application.properties`
- `backend/src/main/resources/application-setup.properties`
- `backend/src/main/resources/application-prod.properties`

Valores actuales por defecto:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/guarani_pos
spring.datasource.username=postgres
spring.datasource.password=postgres
server.port=8080
```

Si el cliente usa otra contrasena o usuario, editar esos valores antes de arrancar.

Uso recomendado:

- `application-setup.properties`: solo para primera inicializacion de una base vacia
- `application-prod.properties`: para el uso normal del cliente
- `application.properties`: puede quedar como entorno demo o desarrollo interno

## 5. Esquema correcto para cliente real

Para cliente real, la base debe arrancar vacia y el sistema debe crear solo lo minimo necesario:

- empresa inicial
- superusuario administrador
- planes base
- suscripcion inicial
- parametros base del sistema

No deberian cargarse automaticamente:

- productos demo
- clientes demo
- ventas demo
- compras demo
- pagarés demo
- cajas demo

Para eso se prepararon estos archivos:

- `schema.sql`
- `data-prod.sql`

El archivo `data.sql` queda reservado para demo y pruebas internas.

## 6. Opcion recomendada con scripts de Windows

El proyecto incluye estos scripts:

- `scripts/windows/instalar-dependencias.bat`
- `scripts/windows/iniciar-backend-setup.bat`
- `scripts/windows/iniciar-backend-prod.bat`
- `scripts/windows/iniciar-backend.bat`
- `scripts/windows/iniciar-frontend.bat`
- `scripts/windows/iniciar-todo.bat`
- `scripts/windows/abrir-guarani-pos.bat`
- `scripts/windows/backup-db.bat`
- `scripts/windows/restore-db.bat`

Uso recomendado para cliente real:

1. Ejecutar `instalar-dependencias.bat` una sola vez despues de copiar el proyecto.
2. Con la base vacia, ejecutar una sola vez `iniciar-backend-setup.bat`.
3. Cuando termine la primera inicializacion, detener ese proceso.
4. Ejecutar `iniciar-backend-prod.bat`.
5. Ejecutar `iniciar-frontend.bat`.
6. Abrir la app con `abrir-guarani-pos.bat` o desde el navegador.

## 7. Primer inicio real del cliente

Escenario correcto:

1. Crear la base vacia `guarani_pos`.
2. Ejecutar `scripts/windows/iniciar-backend-setup.bat` una sola vez.
3. Verificar que se haya creado solo lo minimo.
4. Detener backend setup.
5. Ejecutar `scripts/windows/iniciar-backend-prod.bat`.
6. Ejecutar `scripts/windows/iniciar-frontend.bat`.
7. Entrar con el superusuario inicial.
8. Crear los demas usuarios reales de la empresa desde la app.
9. Cargar productos, clientes y configuraciones reales.

## 8. Superusuario inicial

El seed minimo de produccion deja un usuario administrador inicial:

- Cedula: `1000001`
- Nombre: `Administrador Principal`
- PIN rapido: `1234`
- Contrasena inicial: `Admin123*`

Recomendacion:

1. ingresar con ese usuario
2. crear los usuarios reales
3. cambiar la contrasena del administrador apenas sea posible

## 9. Arranque manual alternativo

Si no queres usar scripts, podes hacerlo manualmente.

### Backend primera inicializacion

```powershell
cd backend
mvn spring-boot:run -Dspring-boot.run.profiles=setup
```

### Backend produccion normal

```powershell
cd backend
mvn spring-boot:run -Dspring-boot.run.profiles=prod
```

### Frontend

```powershell
cd frontend
npm install
npm start
```

## 10. Primer ingreso

1. Abrir `http://localhost:4200`
2. Entrar con el superusuario inicial.
3. Verificar:
   - login correcto
   - dashboard visible
   - acceso a POS
   - acceso a caja
   - acceso a usuarios

## 11. Recomendacion para instalacion en cliente

Para una instalacion simple en la computadora del cliente:

1. Instalar PostgreSQL en la misma PC.
2. Instalar Java, Maven y Node.js.
3. Copiar el proyecto completo.
4. Configurar `application-setup.properties` y `application-prod.properties`.
5. Ejecutar `scripts/windows/instalar-dependencias.bat`.
6. Con la base vacia, ejecutar una sola vez `scripts/windows/iniciar-backend-setup.bat`.
7. Detener backend setup.
8. Ejecutar `scripts/windows/iniciar-backend-prod.bat`.
9. Ejecutar `scripts/windows/iniciar-frontend.bat`.
10. Crear accesos directos si el cliente los necesita.

## 12. Recomendacion operativa minima antes de entregar

Verificar en la PC del cliente:

- ingreso con superusuario inicial
- creacion de usuarios reales de la empresa
- impresora disponible si usara comprobantes
- fecha y hora del sistema correctas
- acceso a navegador
- apertura y cierre de caja funcionando
- venta de prueba
- compra de prueba
- reporte de prueba

## 13. Respaldo recomendado de base de datos

Para una operacion minima mas segura:

1. Ejecutar `scripts/windows/backup-db.bat` al menos una vez por dia.
2. Guardar los archivos `.sql` fuera de la PC principal si es posible.
3. Probar al menos una vez la restauracion con `restore-db.bat`.

## 14. Recomendacion para release 1.0.0

Para tu primer release te conviene:

1. subir el codigo a Git
2. crear tag `v1.0.0`
3. adjuntar este manual y la guia de instalacion en la release
4. dejar aclarado como futuras implementaciones:
   - Bancard
   - factura electronica real
   - mejoras avanzadas de auditoria y reportes

## 15. Siguiente mejora sugerida para produccion real

Cuando ya quieras una entrega mas profesional al cliente:

- compilar frontend en modo produccion
- servir frontend desde un hosting estatico o desde el mismo backend
- usar base de datos con backups programados
- cambiar credenciales por defecto
- usar configuraciones separadas para demo y produccion
