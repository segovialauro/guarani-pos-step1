# Guarani POS Suite v1.0.0

Repositorio principal de la suite Guarani POS. Centraliza documentacion, scripts de instalacion y la referencia funcional del sistema.

## Repositorios relacionados

- Suite / documentacion: [segovialauro/guarani-pos-step1](https://github.com/segovialauro/guarani-pos-step1)
- Backend: [segovialauro/guaraniPOS](https://github.com/segovialauro/guaraniPOS)
- Frontend: [segovialauro/guaraniPOSFront](https://github.com/segovialauro/guaraniPOSFront)

## Alcance de este repositorio

Este repositorio agrupa:

- documentacion funcional
- guia de instalacion
- scripts Windows para instalacion, arranque y respaldo
- copia integrada del proyecto para referencia y soporte operativo

La publicacion tecnica del backend y del frontend tambien existe en repos separados.

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

## Stack actual de la suite

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
- `docs/release-notes-v1.0.0.md`

## Credenciales y configuracion inicial para cliente

Revisar:

- `backend/src/main/resources/application.properties`
- `backend/src/main/resources/application-setup.properties`
- `backend/src/main/resources/application-prod.properties`
- `backend/src/main/resources/schema.sql`
- `backend/src/main/resources/data-prod.sql`

## Notas para la release 1.0.0

La version 1.0.0 cubre la operacion base del comercio. Quedan explicitamente como implementaciones futuras:

- Bancard real
- Factura electronica real
- Auditoria general transversal
- Reglas comerciales avanzadas por segmento de cliente
