CREATE OR REPLACE FUNCTION nthFibonacciNumber(number integer) RETURNS integer AS
$$
BEGIN
    IF (number BETWEEN 0 AND 1) THEN
        RETURN number;
    END IF;

    RETURN nthFibonacciNumber(number - 1) + nthFibonacciNumber(number - 2);
END;
$$ LANGUAGE plpgsql;

SELECT nthFibonacciNumber(9);