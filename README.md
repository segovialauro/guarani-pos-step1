# Guarani POS v1.0.0

Sistema POS SaaS orientado a comercios con control de ventas, caja, presupuestos, inventario, compras, pagares y reportes operativos.

## Modulos incluidos

- POS
- Caja
- Presupuestos
- Clientes
- Productos
- Inventario
- Compras
- Pagares
- Reportes
- Suscripciones
- Configuracion de factura legal
- Parametricos
- Usuarios

## Stack actual

- Backend: Spring Boot 3 / Java 17 / PostgreSQL
- Frontend: Angular 18

## Requisitos

- Java 17
- Maven 3.9+
- Node.js 20+
- PostgreSQL 15+

## Inicio rapido en Windows

1. Configurar la base en `backend/src/main/resources/application-setup.properties` y `backend/src/main/resources/application-prod.properties`
2. Ejecutar `scripts/windows/instalar-dependencias.bat`
3. Si la base esta vacia, ejecutar una sola vez `scripts/windows/iniciar-backend-setup.bat`
4. Luego iniciar normalmente con `scripts/windows/iniciar-backend-prod.bat` y `scripts/windows/iniciar-frontend.bat`

## Scripts utiles

- `scripts/windows/instalar-dependencias.bat`
- `scripts/windows/iniciar-backend.bat`
- `scripts/windows/iniciar-backend-setup.bat`
- `scripts/windows/iniciar-backend-prod.bat`
- `scripts/windows/iniciar-frontend.bat`
- `scripts/windows/iniciar-todo.bat`
- `scripts/windows/abrir-guarani-pos.bat`
- `scripts/windows/backup-db.bat`
- `scripts/windows/restore-db.bat`

## Documentacion

- `docs/manual-usuario-guarani-pos-v1.0.0.pdf`
- `docs/guia-instalacion-guarani-pos-v1.0.0.md`

## Credenciales y configuracion inicial

Revisar:

- `backend/src/main/resources/application.properties`
- `backend/src/main/resources/schema.sql`
- `backend/src/main/resources/data.sql`

## Notas para la release 1.0.0

La version 1.0.0 cubre la operacion base del comercio. Quedan explicitamente como implementaciones futuras:

- Bancard real
- Factura electronica real
- Auditoria general transversal
- Reglas comerciales avanzadas por segmento de cliente
