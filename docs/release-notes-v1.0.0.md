# Guarani POS v1.0.0

Primera version funcional del sistema con operacion base lista para uso interno y primeras instalaciones en cliente.

## Incluye

- POS con ventas, descuentos, vuelto, suspension y reimpresion
- Caja con apertura, cierre, arqueo, ingresos y retiros
- Presupuestos con conversion a venta, vista previa y PDF
- Clientes y productos
- Inventario con ajustes, stock bajo y kardex rapido
- Compras con orden de compra, recepcion y cuentas por pagar
- Pagares con cobros parciales y totales
- Reportes operativos
- Suscripciones y configuraciones base
- Configuracion de factura legal
- Parametricos y usuarios

## Mejoras destacadas

- precio mayorista por cantidad en productos y POS
- importacion masiva de productos por Excel
- auditoria de ventas, compras y pagares
- exportaciones en reportes
- scripts Windows para instalacion e inicio rapido
- manual de usuario y guia de instalacion
- perfil de setup y produccion para instalaciones reales

## Scripts incluidos

- `scripts/windows/instalar-dependencias.bat`
- `scripts/windows/iniciar-backend-setup.bat`
- `scripts/windows/iniciar-backend-prod.bat`
- `scripts/windows/iniciar-frontend.bat`
- `scripts/windows/iniciar-todo.bat`
- `scripts/windows/backup-db.bat`
- `scripts/windows/restore-db.bat`

## Documentacion incluida

- `docs/manual-usuario-guarani-pos-v1.0.0.pdf`
- `docs/guia-instalacion-guarani-pos-v1.0.0.md`

## Pendiente para futuras versiones

- integracion real con Bancard
- factura electronica real
- auditoria general transversal
- reglas comerciales avanzadas por segmento de cliente
