-- coding: utf-8
-- dialect: PostgreSQL

/*
 * 初始化 9webs 数据库
 *
 * zhengrr
 * 2020-09-07 – 2020-09-19
 * Unlicense
 */

-- 创建 spider 和 digger 用户
DO $PLpgSQL$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='spider') THEN
        CREATE USER spider
          WITH PASSWORD 'password';
    END IF;
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='digger') THEN
        CREATE USER digger
          WITH PASSWORD 'password';
    END IF;
END
$PLpgSQL$;

-- 创建 9webs_database 数据库
CREATE DATABASE "9webs_database"
  WITH ENCODING 'UTF8';
