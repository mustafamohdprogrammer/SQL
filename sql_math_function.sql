-- Demonstrating usage of ROUND() function with different decimal places
SELECT
    3.516 AS round_of_value,           -- Original value
    ROUND(3.516, 2) AS round_2,        -- Rounded to 2 decimal places
    ROUND(3.516, 1) AS round_1,        -- Rounded to 1 decimal place
    ROUND(3.516, 0) AS round_0;        -- Rounded to nearest whole number


-- Demonstrating usage of ABS() function to get absolute value
SELECT
    -10 AS before_abs,                -- Original negative value
    ABS(-10) AS after_abs;            -- Absolute value (positive)


