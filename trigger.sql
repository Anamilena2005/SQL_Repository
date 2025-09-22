DROP TRIGGER IF EXISTS validar_correo_clientes;

DELIMITER $$

CREATE TRIGGER validar_correo_clientes
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    -- Verificar que el correo no esté vacío
    IF NEW.Correo IS NULL OR NEW.Correo = '' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El correo del cliente no puede estar vacío';
    END IF;

    -- Verificar que el correo no esté duplicado
    IF EXISTS (
        SELECT 1 FROM Clientes WHERE Correo = NEW.Correo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo ya está registrado.';
    END IF;
END$$

DELIMITER ;



