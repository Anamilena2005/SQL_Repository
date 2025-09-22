USE `entertaiment`;
DROP function IF EXISTS `ClasificacionEdad`;

DELIMITER $$
USE `entertaiment`$$
CREATE FUNCTION ClasificacionEdad(fechaNacimiento DATE)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE());

    IF edad < 13 THEN
        RETURN 'PG';
    ELSEIF edad < 18 THEN
        RETURN '14+';
    ELSE
        RETURN '18+';
    END IF;
END$$

DELIMITER ;