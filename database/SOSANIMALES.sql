-- CREA LA BBDD SI NO EXISTE --
CREATE DATABASE IF NOT EXISTS `SOSANIMALES`;

-- USAR LA BBDD SI EXISTE --
USE `SOSANIMALES`;

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_COLOR` (
    `ID` INT NOT NULL,
    `COLOR` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_TAMAÑO` (
    `ID` INT NOT NULL,
    `TAMAÑO` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_ESTADO` (
    `ID` INT NOT NULL,
    `ESTADO` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_ESPECIE` (
    `ID` INT NOT NULL,
    `ESPECIE` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_USUARIO` (
    `ID` INT NOT NULL,
    `NOMBRE` VARCHAR(45) NOT NULL,
    `EMAIL` VARCHAR(50) NOT NULL,
    `CONTRASEÑA` VARCHAR(25) NOT NULL,
    `TELEFONO` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_CONTACTOEXTRA` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `NOMBRE` VARCHAR(45) NOT NULL,
    `TELEFONO` VARCHAR(20) NOT NULL,
    `EMAIL` VARCHAR(50) NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_ANIMAL` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `NOMBRE` VARCHAR(45) NOT NULL,
    `DESCRIPCION` VARCHAR(100) NOT NULL,
    `IMAGEN` VARCHAR(100) NOT NULL,
    `COLOR_ID` INT,
    `TAMAÑO_ID` INT,
    `ESPECIE_ID` INT,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_AVISO` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `FECHADESAPARECIDO` DATETIME NOT NULL,
    `LUGARDESAPARECIDO` VARCHAR(100) NOT NULL,
    `ANIMAL_ID` INT,
    `CONTACTOEXTRA_ID` INT,
    `ESTADO_ID` INT,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `SOSANIMALES`.`T_TOKEN` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `TOKEN` VARCHAR(50) NOT NULL,
    `FECHAVENCIMIENTO` DATETIME NOT NULL,
    `FECHACREACION` DATETIME NOT NULL,
    `ULTIMACONEXION` DATETIME NOT NULL,
    `USUARIO_ID` INT,
    PRIMARY KEY (`ID`)
);

-- AÑADIMOS LAS CLAVES FORÁNEAS --
ALTER TABLE `SOSANIMALES`.`T_ANIMAL`
    ADD FOREIGN KEY (`COLOR_ID`) REFERENCES `T_COLOR`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD FOREIGN KEY (`TAMAÑO_ID`) REFERENCES `T_TAMAÑO`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE,
    ADD FOREIGN KEY (`ESPECIE_ID`) REFERENCES `T_ESPECIE`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE;

ALTER TABLE `SOSANIMALES`.`T_TOKEN`
    ADD FOREIGN KEY (`USUARIO_ID`) REFERENCES `T_USUARIO`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE;

ALTER TABLE `SOSANIMALES`.`T_AVISO`
    ADD FOREIGN KEY (`ANIMAL_ID`) REFERENCES `T_ANIMAL`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE,
    ADD FOREIGN KEY (`CONTACTOEXTRA_ID`) REFERENCES `T_CONTACTOEXTRA`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE,
    ADD FOREIGN KEY (`ESTADO_ID`) REFERENCES `T_ESTADO`(`ID`) ON DELETE CASCADE  ON UPDATE CASCADE;

-- AÑADIMOS EL CONTENIDO DE LAS TABLAS --
INSERT IGNORE INTO `SOSANIMALES`.`T_COLOR` (`ID`, `COLOR`) VALUES ('1', 'BLANCO'), ('2', 'NEGRO'), ('3', 'GRIS'), ('4', 'MARRON');

INSERT IGNORE INTO `SOSANIMALES`.`T_TAMAÑO` (`ID`, `TAMAÑO`) VALUES ('1', 'PEQUEÑO'), ('2', 'MEDIANO'), ('3', 'GRANDE');

INSERT IGNORE INTO `SOSANIMALES`.`T_ESPECIE` (`ID`, `ESPECIE`) VALUES ('1', 'PERRO'), ('2', 'GATO');

INSERT IGNORE INTO `SOSANIMALES`.`T_ESTADO` (`ID`, `ESTADO`) VALUES ('1', 'PERDIDO'), ('2', 'ENCONTRADO'), ('3', 'DEVUELTO');

INSERT IGNORE INTO `SOSANIMALES`.`T_USUARIO` (`ID`, `NOMBRE`, `EMAIL`, `CONTRASEÑA`, `TELEFONO`) VALUES
('1', 'admin', 'admin@sosanimales.com', '1234', '928987654'),
('2', 'cliente', 'cliente@sosanimales.com', '1234', '928123456'),
('3', 'usuario', 'usuario@sosanimales.com', '1234', '928112233');
