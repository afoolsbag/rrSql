-- coding: utf-8
-- dialect: PostgreSQL

/*
 * 分页查询示例
 *
 * zhengrr
 * 2019-08-02 – 2020-09-15
 * Unlicense
 */

-- 准备工作

CREATE TABLE _test_table (
    id   INTEGER PRIMARY KEY,
    name TEXT    NOT NULL
);

DO $PLpgSQL$
BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO _test_table (id, name)
        VALUES (i, concat('value-', i::text));
    END LOOP;
END
$PLpgSQL$;

-- 分页查询

SELECT *
  FROM _test_table
 LIMIT 1000
OFFSET 5000;

-- 善后工作

DROP TABLE IF EXISTS _test_table;
