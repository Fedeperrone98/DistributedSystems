USE DSMTDB;

-- Generate random appointments between existing users
DELIMITER //
CREATE PROCEDURE GenerateRandomAppointments()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE host VARCHAR(16);
    DECLARE guest VARCHAR(16);

    -- Declare a cursor for selecting random user pairs
    DECLARE cur CURSOR FOR SELECT u1.username AS host, u2.username AS guest
                           FROM user AS u1
                           JOIN user AS u2
                           WHERE u1.username < u2.username
                           ORDER BY RAND()
                           LIMIT 10;

    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    appointment_loop: LOOP
        FETCH cur INTO host, guest;
        IF done THEN
            LEAVE appointment_loop;
        END IF;

        -- Check if an appointment between host and guest already exists (in any order)
        SELECT COUNT(*) FROM appointment
        WHERE (host = @host AND guest = @guest) OR (host = @guest AND guest = @host) INTO @count;

        IF @count = 0 THEN
            -- Insert a new appointment
            INSERT INTO appointment (host, guest, content, timeslot)
            VALUES (host, guest, 'Sample appointment content', NOW() + INTERVAL FLOOR(1 + RAND() * 30) DAY);
        END IF;
    END LOOP;

    CLOSE cur;
END;
//
DELIMITER ;

-- Call the procedure to generate random appointments
CALL GenerateRandomAppointments();
