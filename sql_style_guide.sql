-- All keywords are allcaps
-- All list members are in new row
-- This query is only for demonstrating styling

WITH cte_table1 AS (                                        -- bracket in same row
    SELECT                                                  -- entire query tabbed in
        *
    FROM
        table1
    ),                                                      -- need comma if more than one CTE
cte_table2 AS (
    SELECT
        *
    FROM
        table2
    )                                                       -- no comma!
SELECT
    cte_table1.column1 AS alias1,                           -- each column in new row 
    cte_table2.column2 AS alias2,
    COUNT(*) FILTER (WHERE cte_table1.column1==1) AS alias3,
    CASE                                                    -- CASE/END in own row
        WHEN cte_table1.column1 == 1 THEN 3                 -- each condition in new row
        WHEN cte_table1.column1 == 2 THEN 4
        ELSE 5
    END AS alias4
FROM
    cte_table1                                              -- tables tabbed in 
JOIN
    cte_table2
ON
    cte_table1.column1 == cte_table2.column1                -- join condition in new row
JOIN (                                                      -- bracket in same row
    SELECT                                                  -- entire query tabbed in
        *
    FROM
        cte_table2
    ) AS table3                                             -- closeing bracket and alias tabbed in
ON
    cte_table1.column1 == table3.column1 AND                -- each term in new row, focus 
    cte_table1.column2 == table3.column2                    -- focus on readability with complex conditionals
WHERE
    cte_table1.column1 == 1 AND
    cte_table1.column2 == 2
GROUP BY
    cte_table1.column1,
    cte_table2.column1
HAVING
    SUM(cte_table1.column1) == 1 AND
    SUM(cte_table1.column2) == 2