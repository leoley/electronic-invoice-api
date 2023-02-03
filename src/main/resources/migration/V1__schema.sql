SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `invoiceDB` DEFAULT CHARACTER SET utf8;
USE `invoiceDB`;

-- -----------------------------------------------------
-- Table `invoiceDB`.`cabecera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`cabecera`
(
    `docu_codigo`               INT(11)       NOT NULL AUTO_INCREMENT COMMENT 'Codigo de tabla Autogenerado',
    `idExterno`                 VARCHAR(45)   NULL COMMENT 'Identificador del documento electronico',
    `empr_razonsocial`          VARCHAR(200)  NULL DEFAULT NULL COMMENT 'Razon social de la empresa',
    `empr_ubigeo`               VARCHAR(20)   NULL DEFAULT NULL COMMENT 'Codigo de Ubigeo de la empresa',
    `empr_nombrecomercial`      VARCHAR(200)  NULL DEFAULT NULL COMMENT 'Nombre Comercial de la empresa',
    `empr_direccion`            VARCHAR(450)  NULL DEFAULT NULL COMMENT 'Direccion de la Empresa',
    `empr_provincia`            VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Provincia de la empresa',
    `empr_departamento`         VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Departamento de la empresa',
    `empr_distrito`             VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Distrito de la empresa',
    `empr_pais`                 VARCHAR(10)   NULL DEFAULT NULL COMMENT 'Pais de la empresa - PE',
    `empr_nroruc`               VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Numero de Ruc de la empresa',
    `empr_tipodoc`              VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tiop de documento de la empresa - 6 - RUC',
    `clie_numero`               VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Documento del cliente',
    `clie_tipodoc`              VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tipo de documento del cliente  - 6  - RUC  /  1 - DNI',
    `clie_nombre`               VARCHAR(200)  NULL DEFAULT NULL COMMENT 'Nombre / Razon Social del cliente',
    `docu_fecha`                DATE          NULL DEFAULT NULL COMMENT 'fecha del documento formato YYYY-MM-DD',
    `docu_hora`                 TIME          NULL DEFAULT NULL COMMENT 'HORA del documento formato 00:00:00',
    `docu_tipodocumento`        VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tipo de Documento \n01 - Factura\n03 - Boleta de Venta\n07 - Nota de Credito' /* comment truncated */ /*08 - Nota de Debito*/,
    `docu_numero`               VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Numero de Documento\nformat \nserie - numero\nserie: \nF000 factura\nB000 Boleta \nR000 Retenciones\n-------------\nNota de credito  y Nota de Debito\nsi e a una factura\nFC00\nsi es a una Boleta' /* comment truncated */ /*BC00*/,
    `docu_moneda`               VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Moneda del documento' /* comment truncated */ /*PEN - Soles*/,
    `docu_gravada`              VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Importe total de Documento grabado al IGV',
    `docu_inafecta`             VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe inafecto del documento',
    `docu_exonerada`            VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe exonerado del IGV  del documento',
    `docu_gratuita`             VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe de valor gratuito  del documento',
    `docu_descuento`            VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe de descuento del documento',
    `docu_subtotal`             VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe subtotal del documento',
    `docu_total`                VARCHAR(45)   NULL DEFAULT NULL COMMENT 'importe total  del documento',
    `docu_igv`                  VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Importe del IGV del documento',
    `tasa_igv`                  VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tasa del IGV =18 ',
    `docu_isc`                  VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Importe  del ISC',
    `tasa_isc`                  VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tasa ISC',
    `docu_otrostributos`        VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Otros importes de otros tributos',
    `tasa_otrostributos`        VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Tasa de otros tributos',
    `docu_otroscargos`          VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Otros cargos',
    `docu_percepcion`           VARCHAR(45)   NULL DEFAULT NULL COMMENT 'Importe de percepcion',
    `hashcode`                  VARCHAR(100)  NULL DEFAULT NULL COMMENT 'Has code de la impresion',
    `cdr`                       VARCHAR(200)  NULL DEFAULT NULL COMMENT 'Estado del CDR',
    `cdr_nota`                  VARCHAR(500)  NULL DEFAULT NULL COMMENT 'Nota del CDR',
    `cdr_observacion`           VARCHAR(2000) NULL DEFAULT ' ' COMMENT 'Notas de Observaciones del CDR',
    `docu_enviaws`              VARCHAR(45)   NULL DEFAULT 'S' COMMENT 'Estado si el documento se envia al ws de SUNAT\nS- Si se envia.' /* comment truncated */ /*N- No se Envia*/,
    `docu_proce_status`         VARCHAR(45)   NULL DEFAULT 'N' COMMENT 'N - Nuevo\nB - Bloqueo\nP - Proceso-\nE - Enviado\nX - Error de Envio\n',
    `docu_proce_fecha`          DATETIME      NULL DEFAULT NULL,
    `docu_link_pdf`             VARCHAR(200)  NULL DEFAULT NULL,
    `docu_link_cdr`             VARCHAR(200)  NULL DEFAULT NULL,
    `docu_link_xml`             VARCHAR(200)  NULL DEFAULT NULL,
    `clie_correo_cpe1`          VARCHAR(100)  NULL DEFAULT NULL COMMENT 'Correo cliente 1',
    `clie_correo_cpe2`          VARCHAR(100)  NULL DEFAULT NULL COMMENT 'Correo cliente 2',
    `docu_tipodocumento_anular` CHAR(10)      NULL DEFAULT NULL,
    `docu_tipodocumento_numero` VARCHAR(45)   NULL DEFAULT NULL,
    `docu_motivoanular`         VARCHAR(45)   NULL DEFAULT NULL,
    PRIMARY KEY (`docu_codigo`),
    UNIQUE INDEX `idExterno_UNIQUE` (`idExterno` ASC),
    INDEX `idExterno_Cab_idx` (`idExterno` ASC)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 39
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `invoiceDB`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`cliente`
(
    `indice`    INT(11)      NOT NULL AUTO_INCREMENT,
    `tipodoc`   VARCHAR(45)  NULL DEFAULT NULL,
    `dnioruc`   VARCHAR(11)  NOT NULL,
    `razon`     VARCHAR(70)  NOT NULL,
    `direccion` VARCHAR(200) NOT NULL,
    `celular`   VARCHAR(45)  NULL DEFAULT NULL,
    `email`     VARCHAR(70)  NULL DEFAULT NULL,
    PRIMARY KEY (`indice`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 10
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `invoiceDB`.`comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`comprobante`
(
    `indice`      INT(11)     NOT NULL AUTO_INCREMENT,
    `punto_venta` VARCHAR(20) NULL DEFAULT NULL COMMENT 'lugar, sucursal o nombre empresa\n',
    `nombre`      VARCHAR(25) NULL DEFAULT NULL COMMENT 'FACTURA\nBOLETA' /* comment truncated */ /*NOTA DE CREDITO*/,
    `serie`       VARCHAR(45) NULL DEFAULT NULL COMMENT 'FACTURAS - F###\nBOLETAS    - B###\nNOTA DE CREDITO (FACT): FC##\nNOTA DE CREDITO (BOL): BC##',
    `correlativo` VARCHAR(40) NULL DEFAULT NULL COMMENT 'POSICION DE 8 DIGITOS: 00000001',
    PRIMARY KEY (`indice`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 17
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `invoiceDB`.`detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`detalle`
(
    `iddetalle`              INT(11)      NOT NULL AUTO_INCREMENT COMMENT 'Codigo autogenerado de la tabla',
    `docu_codigo`            INT(11)      NOT NULL COMMENT 'Codigo relacion de la tabla cabecera',
    `item_orden`             VARCHAR(45)  NULL COMMENT 'Numero de Orden',
    `item_unidad`            VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Unidad de Medida del Item',
    `item_cantidad`          VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Cantidad de Item',
    `item_codproducto`       VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Codigo del Producto',
    `item_descripcion`       VARCHAR(255) NULL DEFAULT NULL COMMENT 'Descripcion del Producto ',
    `item_afectacion`        VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Tipo de afectacion\n' /* comment truncated */ /*10 Gravado - Operación Onerosa (uso comun)*/,
    `item_tipo_precio_venta` VARCHAR(45)  NULL DEFAULT '01' COMMENT 'Código de tipo de precio - Catálogo No. 16',
    `item_pventa`            VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Precio de venta unitario sin IGV',
    `item_pventa_nohonerosa` VARCHAR(45)  NULL DEFAULT '0.00' COMMENT 'Valor referencial unitario por ítem en operaciones no onerosas ( gratuito)',
    `item_to_subtotal`       VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Importe sub total',
    `item_to_igv`            VARCHAR(45)  NULL DEFAULT NULL COMMENT 'Importe del IGV',
    `item_pvtaigv`           VARCHAR(45)  NULL DEFAULT NULL,
    PRIMARY KEY (`iddetalle`),
    INDEX `fk_detalle_cabecera_idx` (`docu_codigo` ASC),
    CONSTRAINT `fk_detalle_cabecera`
        FOREIGN KEY (`docu_codigo`)
            REFERENCES `invoiceDB`.`cabecera` (`docu_codigo`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 86
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `invoiceDB`.`leyenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`leyenda`
(
    `id_leyenda`     INT(11)      NOT NULL AUTO_INCREMENT,
    `docu_codigo`    INT(11)      NOT NULL,
    `leyenda_codigo` VARCHAR(10)  NOT NULL,
    `leyenda_texto`  VARCHAR(500) NOT NULL,
    PRIMARY KEY (`id_leyenda`),
    INDEX `fk_table1_cabecera1_idx` (`docu_codigo` ASC),
    CONSTRAINT `fk_table1_cabecera1`
        FOREIGN KEY (`docu_codigo`)
            REFERENCES `invoiceDB`.`cabecera` (`docu_codigo`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 33
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `invoiceDB`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`pagos`
(
    `docu_codigo`          INT(11)       NOT NULL AUTO_INCREMENT,
    `nrocuota`             VARCHAR(45)   NULL DEFAULT NULL,
    `fecha`                DATE          NULL DEFAULT NULL,
    `monto`                DECIMAL(7, 2) NULL DEFAULT NULL,
    `cabecera_docu_codigo` INT(11)       NOT NULL,
    PRIMARY KEY (`docu_codigo`),
    INDEX `fk_pagos_cabecera1_idx` (`cabecera_docu_codigo` ASC),
    CONSTRAINT `fk_pagos_cabecera1`
        FOREIGN KEY (`cabecera_docu_codigo`)
            REFERENCES `invoiceDB`.`cabecera` (`docu_codigo`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `invoiceDB`.`parametro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`parametro`
(
    `nombre`       VARCHAR(45)   NOT NULL,
    `valorentero`  INT(11)       NULL DEFAULT NULL,
    `valordecimal` DECIMAL(7, 2) NULL DEFAULT NULL,
    `valorstring`  VARCHAR(450)  NULL DEFAULT NULL,
    PRIMARY KEY (`nombre`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `invoiceDB`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`marca`
(
    `idmarca` INT         NOT NULL AUTO_INCREMENT,
    `nombre`  VARCHAR(45) NULL,
    PRIMARY KEY (`idmarca`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invoiceDB`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`producto`
(
    `indice`        INT(11)       NOT NULL AUTO_INCREMENT,
    `codigo`        VARCHAR(25)   NULL DEFAULT NULL,
    `undmed`        VARCHAR(10)   NULL DEFAULT NULL,
    `stock`         INT(11)       NULL DEFAULT NULL,
    `descripcion`   VARCHAR(100)  NULL DEFAULT NULL,
    `preciovta`     DECIMAL(7, 2) NULL DEFAULT NULL,
    `costo`         DECIMAL(7, 2) NULL DEFAULT NULL,
    `igv`           CHAR(1)       NULL DEFAULT NULL,
    `icbper`        CHAR(5)       NULL DEFAULT NULL,
    `marca_idmarca` INT           NOT NULL,
    PRIMARY KEY (`indice`),
    INDEX `fk_producto_marca1_idx` (`marca_idmarca` ASC),
    CONSTRAINT `fk_producto_marca1`
        FOREIGN KEY (`marca_idmarca`)
            REFERENCES `invoiceDB`.`marca` (`idmarca`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 13
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `invoiceDB`.`unidadmedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoiceDB`.`unidadmedida`
(
    `indice`     INT(11)     NOT NULL AUTO_INCREMENT,
    `nombre`     VARCHAR(45) NULL DEFAULT NULL,
    `simbologia` VARCHAR(10) NULL DEFAULT NULL,
    PRIMARY KEY (`indice`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
    DEFAULT CHARACTER SET = utf8;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;