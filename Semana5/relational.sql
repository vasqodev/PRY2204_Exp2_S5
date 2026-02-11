-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-02-10 21:49:29 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE CLIENTE 
    ( 
     rut       INTEGER  NOT NULL , 
     nombres   VARCHAR2 (100)  NOT NULL , 
     apellidos VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( rut ) ;

CREATE TABLE COMUNA 
    ( 
     id_comuna     INTEGER  NOT NULL , 
     nombre_comuna VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( id_comuna ) ;

CREATE TABLE DETALLE_VENTA 
    ( 
     cantidad                      INTEGER  NOT NULL , 
     precio_unitario               INTEGER  NOT NULL , 
     VENTA_numero_boleta           INTEGER  NOT NULL , 
     PRODUCTO_codigo               INTEGER  NOT NULL , 
     PRODUCTO_SUCURSAL_id_sucursal INTEGER  NOT NULL 
    ) 
;

ALTER TABLE DETALLE_VENTA 
    ADD CONSTRAINT DETALLE_VENTA_PK PRIMARY KEY ( VENTA_numero_boleta, PRODUCTO_codigo, PRODUCTO_SUCURSAL_id_sucursal ) ;

CREATE TABLE EMPRESA 
    ( 
     id_proveedor INTEGER  NOT NULL , 
     razon_social VARCHAR2 (50)  NOT NULL , 
     rut_empresa  INTEGER  NOT NULL 
    ) 
;

ALTER TABLE EMPRESA 
    ADD CONSTRAINT EMPRESA_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE INDIVIDUO 
    ( 
     id_proveedor INTEGER  NOT NULL , 
     nombre       VARCHAR2 (50)  NOT NULL , 
     rut          INTEGER  NOT NULL 
    ) 
;

ALTER TABLE INDIVIDUO 
    ADD CONSTRAINT INDIVIDUO_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE PRODUCTO 
    ( 
     codigo               INTEGER  NOT NULL , 
     nombre               VARCHAR2 (50)  NOT NULL , 
     precio               INTEGER  NOT NULL , 
     SUCURSAL_id_sucursal INTEGER  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( codigo, SUCURSAL_id_sucursal ) ;

CREATE TABLE PROVEEDOR 
    ( 
     id_proveedor INTEGER  NOT NULL , 
     direccion    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE SUCURSAL 
    ( 
     id_sucursal      INTEGER  NOT NULL , 
     direccion        VARCHAR2 (100)  NOT NULL , 
     telefono         INTEGER , 
     COMUNA_id_comuna INTEGER  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( id_sucursal ) ;

CREATE TABLE VENTA 
    ( 
     numero_boleta INTEGER  NOT NULL , 
     fecha         DATE  NOT NULL 
    ) 
;

ALTER TABLE VENTA 
    ADD CONSTRAINT VENTA_PK PRIMARY KEY ( numero_boleta ) ;

ALTER TABLE DETALLE_VENTA 
    ADD CONSTRAINT DETALLE_VENTA_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_codigo,
     PRODUCTO_SUCURSAL_id_sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     codigo,
     SUCURSAL_id_sucursal
    ) 
;

ALTER TABLE DETALLE_VENTA 
    ADD CONSTRAINT DETALLE_VENTA_VENTA_FK FOREIGN KEY 
    ( 
     VENTA_numero_boleta
    ) 
    REFERENCES VENTA 
    ( 
     numero_boleta
    ) 
;

ALTER TABLE EMPRESA 
    ADD CONSTRAINT EMPRESA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     id_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_proveedor
    ) 
;

ALTER TABLE INDIVIDUO 
    ADD CONSTRAINT INDIVIDUO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     id_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_proveedor
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_id_sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     id_sucursal
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_id_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     id_comuna
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
