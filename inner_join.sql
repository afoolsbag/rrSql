-- coding: utf-8
-- dialect: Generic SQL

/*
 * 内联查询示例
 *
 * zhengrr
 * 2019-08-02 – 2020-09-15
 * Unlicense
 */

-- 准备工作：实体表

CREATE TABLE _test_entry (
    id   INTEGER PRIMARY KEY,
    name TEXT    NOT NULL
);

INSERT INTO _test_entry (id, name)
VALUES (1, 'SMT'),
       (2, 'ZL'),
       (3, 'JT');

-- 准备工作：属性表

CREATE TABLE _test_property (
    id        INTEGER PRIMARY KEY,
    entity_id INTEGER,
    name      TEXT,
    value     TEXT
);

INSERT INTO _test_property (id, entity_id, name, value)
VALUES (1, 1, 'nick', 'MT'),
       (2, 1, 'some', ''),
       (3, 2, 'nick', 'L'),
       (4, 2, 'some', ''),
       (5, 3, 'nick', 'T'),
       (6, 3, 'some', '');

-- 内联查询

SELECT e.name  AS name,
       p.name  AS property_name,
       p.value AS property_value
  FROM _test_entry AS e
       INNER JOIN _test_property AS p
       ON e.id = p.entity_id;

-- 善后工作

DROP TABLE IF EXISTS _test_entry;

DROP TABLE IF EXISTS _test_property;
