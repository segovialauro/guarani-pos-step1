DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS empresa CASCADE;

CREATE TABLE empresa (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    licencia_estado VARCHAR(20) NOT NULL,
    licencia_vencimiento DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE usuario (
    id BIGSERIAL PRIMARY KEY,
    empresa_id BIGINT NOT NULL REFERENCES empresa(id),
    cedula VARCHAR(20) NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    password_hash VARCHAR(120) NOT NULL,
    quick_pin VARCHAR(4),
    rol_codigo VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE (empresa_id, cedula),
    UNIQUE (empresa_id, quick_pin)
);

INSERT INTO empresa (codigo, nombre, estado, licencia_estado, licencia_vencimiento)
VALUES ('demo', 'Empresa Demo Guaraní POS', 'ACTIVA', 'ACTIVA', '2030-12-31');

-- contraseña: Admin123*
INSERT INTO usuario (empresa_id, cedula, nombre_completo, password_hash, quick_pin, rol_codigo, estado)
VALUES (
    1,
    '1234567',
    'Administrador Demo',
    'Admin123*',
    '1234',
    'ADMIN_EMPRESA',
    'ACTIVO'
);
