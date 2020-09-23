-- coding: utf-8
-- dialect: PostgreSQL

/*
 * 初始化 9webs 数据表
 *
 * zhengrr
 * 2020-09-07 – 2020-09-19
 * Unlicense
 */

--
-- 创建 aliexpress_product_information 表
--
CREATE TABLE IF NOT EXISTS aliexpress_product_information (
    product_id     TEXT NOT NULL PRIMARY KEY,
    category_id    TEXT,
    ali_member_id  TEXT,
    algo_exp_id    TEXT,
    image_url      TEXT,
    title          TEXT,
    price_current  TEXT,
    price_big_sale TEXT
);

GRANT INSERT, SELECT, UPDATE
   ON TABLE aliexpress_product_information
   TO spider;

GRANT SELECT
   ON TABLE aliexpress_product_information
   TO digger;

--
-- 创建 aliexpress_search_results 表
--

CREATE TABLE IF NOT EXISTS aliexpress_search_results (
    search_text  TEXT      NOT NULL,
    search_time  TIMESTAMP NOT NULL,
    result_index INTEGER   NOT NULL,
    product_id   TEXT      NOT NULL,
    sale_value   BIGINT,
    PRIMARY KEY (search_text, search_time, result_index)
);

CREATE INDEX aliexpress_search_results_product_id_index
    ON aliexpress_search_results (product_id);

GRANT INSERT
   ON TABLE aliexpress_search_results
   TO spider;

GRANT SELECT
   ON TABLE aliexpress_search_results
   TO digger;

--
-- 创建 amazon_product_information 表
--

CREATE TABLE IF NOT EXISTS amazon_product_information (
    asin       TEXT NOT NULL PRIMARY KEY,
    uuid       TEXT,
    image_url  TEXT,
    title      TEXT,
    ourprice   TEXT,
    price      TEXT,
    department TEXT
);

GRANT INSERT, SELECT, UPDATE
   ON TABLE amazon_product_information
   TO spider;

GRANT SELECT
   ON TABLE amazon_product_information
   TO digger;

--
-- 创建 amazon_search_results 表
--

CREATE TABLE IF NOT EXISTS amazon_search_results (
    search_text      TEXT      NOT NULL,
    search_time      TIMESTAMP NOT NULL,
    result_index     INTEGER   NOT NULL,
    asin             TEXT      NOT NULL,
    decistars        SMALLINT,           -- “分星”，即 1/10 星
    count_of_ratings BIGINT,
    sales_rank       BIGINT,
    PRIMARY KEY (search_text, search_time, result_index)
);

CREATE INDEX amazon_search_results_asin_index
    ON amazon_search_results (asin);

GRANT INSERT
   ON TABLE amazon_search_results
   TO spider;

GRANT SELECT
   ON TABLE amazon_search_results
   TO digger;
