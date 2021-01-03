CREATE OR REPLACE FUNCTION isPrime(number integer) RETURNS boolean AS
$$
DECLARE
    counter integer := 2;
BEGIN
    IF (number <= 1) THEN
        RETURN false;
    END IF;
    FOR counter IN counter..SQRT(number) LOOP
        IF (number % counter = 0) THEN
            RETURN false;
        END IF;
    END LOOP;
    RETURN true;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION nthPrimeNumber(number integer) RETURNS integer AS
$$
DECLARE
    counter integer := 1;
    num integer := 1;
BEGIN
    IF (number = 1) THEN
        return 2;
    END IF;
    WHILE (counter != number) LOOP
        num = num + 2;
        IF (isPrime(num)) THEN
            counter = counter + 1;
        END IF;
    END LOOP;
    RETURN num;
END;
$$ LANGUAGE plpgsql;

SELECT nthPrimeNumber(7);