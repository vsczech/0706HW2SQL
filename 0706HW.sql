/*
ПАРКТИЧЕСКОЕ ЗАНЯТИЕ №6


Задание 1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //
CREATE FUNCTION seconds_format(s INT)  
RETURNS VARCHAR(55)
DETERMINISTIC
BEGIN
    DECLARE d INT;
    DECLARE h INT;
    DECLARE m INT;
    DECLARE result VARCHAR(55);


    SET d = FLOOR(s / (24 * 3600));
    SET s = s % (24 * 3600);
    SET h = FLOOR(s / 3600);
    SET s = s % 3600;
    SET m = FLOOR(s / 60);
    SET s = s % 60;

    SET result = CONCAT(d, " days ", h, " hours ", m, " minutes ", s, " seconds");

    RETURN result;
END //

DELIMITER ;

SELECT seconds_format(123456);


/*
Задание 2. Создайте функцию, которая выводит только четные числа от 1 до 10
*/

DELIMITER //
CREATE PROCEDURE print_even_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(45) DEFAULT '';
   
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            IF result = '' THEN
                SET result = i;
            ELSE
                SET result = CONCAT(result, ',', i);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SELECT result;
END //
DELIMITER ;

CALL print_even_numbers();