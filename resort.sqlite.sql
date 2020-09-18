-- coding: utf-8
-- dialect: SQLite

/*
 * 重新排序样例
 *
 * zhengrr
 * 2020-09-01 – 2020-09-15
 * Unlicense
 */

-- 创建临时表，将原表数据复制至此
CREATE TABLE "_<table>_tmp_resort"
    AS SELECT * FROM "<table>";

-- 清空原表
DELETE FROM "<table>";

-- 将临时表数据重新排序，插入原表
INSERT INTO "<table>"
SELECT *
  FROM "_<table>_tmp_resort"
 ORDER BY "<index>";

-- 删除临时表
DROP TABLE "_<table>_tmp_resort";
