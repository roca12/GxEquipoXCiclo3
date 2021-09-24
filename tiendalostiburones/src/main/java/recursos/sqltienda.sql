######## Creacion y uso de la base de datos ########
CREATE DATABASE tiendalostiburones;

USE tiendalostiburones;

######## modulo de login y usuarios ########
CREATE TABLE usuarios (
    cedula_usuario BIGINT PRIMARY KEY,
    email_usuario VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL
); 

INSERT INTO usuarios VALUES(001,'roca230313@gmail.com','Diego Rodriguez','admin123456','admininicial');
INSERT INTO usuarios VALUES(002,'roca230313@gmail.com','Diego Rodriguez','pass','user');
INSERT INTO usuarios VALUES(003,'roca230313@gmail.com','Diego Rodriguez','pass2','user2');

CREATE UNIQUE INDEX usuario_unico 
ON usuarios(usuario);

######## modulo de clientes ########
CREATE TABLE clientes (
    cedula_cliente BIGINT PRIMARY KEY,
    direccion_cliente VARCHAR(255) NOT NULL,
    email_cliente VARCHAR(255) NOT NULL,
    nombre_cliente VARCHAR(255) NOT NULL,
    telefono_cliente VARCHAR(255) NOT NULL
);

INSERT INTO clientes VALUES(001,'Calle falsa 123','roca@gmail.com','Diego Rodriguez','3000000000');





