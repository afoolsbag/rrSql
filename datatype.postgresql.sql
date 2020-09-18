-- coding: utf-8
-- dialect: PostgreSQL

/*
 * PostgreSQL 数据类型备忘
 * 参见 <http://www.postgres.cn/docs/12/datatype.html>
 *
 * zhengrr
 * 2020-09-07 – 2020-09-07
 * Unlicense
 */

CREATE TABLE _test_datatype (
    -- 数字类型
    "int2"        SMALLINT,          -- 标准类型，小范围整数
    "int4"        INTEGER,           -- 标准类型，整数的典型选择
    "int8"        BIGINT,            -- 标准类型，大范围整数
    "decimal"     NUMERIC,           -- 标准类型，任意范围和刻度的精确数，但其运算慢得多
    "float4"      REAL,              -- 标准类型，符合 IEEE 754 标准的单精度浮点数
    "float8"      DOUBLE PRECISION,  -- 标准类型，符合 IEEE 754 标准的双精度浮点数
    "serial2"     SMALLSERIAL,       -- 扩展类型，自增长小范围整数
    "serial4"     SERIAL,            -- 扩展类型，自增长整数
    "serial8"     BIGSERIAL,         -- 扩展类型，自增长大范围整数

    -- 货币类型
    "money"       MONEY,             -- 扩展类型

    -- 字符类型，允许的最大字符串约为 1GB
    "char"        CHARACTER,         -- 标准类型，定长字符串，不满则以空格填充；默认长度为 1
    "varchar"     CHARACTER VARYING, -- 标准类型，变长字符串
    "text"        TEXT,              -- 扩展类型，等同于不指定最大长度的变长字符串

    -- 字节类型
    "bytea"       BYTEA,             -- 扩展类型，变长字节串

    -- 日期和时间类型
    "timestamp"   TIMESTAMP WITHOUT TIME ZONE, -- 标准类型，8 字节，无时区信息的日期和时间
    "timestamptz" TIMESTAMP WITH TIME ZONE,    -- 标准类型，8 字节，带时区信息的日期和时间
    "date"        DATE,                        -- 标准类型，4 字节，仅日期
    "time"        TIME WITHOUT TIME ZONE,      -- 标准类型，8 字节，无时区信息的仅时间
    "time alt"    TIME WITH TIME ZONE,         -- 标准类型，12 字节，带时区信息的仅时间
    "interval"    INTERVAL,                    -- 标准类型，16 字节，时间间隔

    -- 布尔类型
    "bool"        BOOLEAN,           -- 标准类型，1 字节，布尔类型

    -- 枚举类型
    -- 略

    -- 几何类型
    "point"       POINT,             -- 扩展类型，16 字节，二维直角坐标系中的点
    "line"        LINE,              -- 扩展类型，32 字节，二维直角坐标系中的直线
    "lseg"        LSEG,              -- 扩展类型，32 字节，二维直角坐标系中的线段
    "box"         BOX,               -- 扩展类型，32 字节，二维直角坐标系中的矩形
    "path"        PATH,              -- 扩展类型，16+16n 字节，二维直角坐标系中的路径
    "polygon"     POLYGON,           -- 扩展类型，40+16n 字节，二维直角坐标系中的多边形
    "circle"      CIRCLE,            -- 扩展类型，24 字节，二维直角坐标系中的圆

    -- 网络地址类型
    "cidr"        CIDR,              -- 扩展类型，7 或 19 字节，IPv4 或 IPv6 网络
    "inet"        INET,              -- 扩展类型，7 或 19 字节，IPv4 或 IPv6 主机或网络
    "macaddr"     MACADDR,           -- 扩展类型，6 字节，MAC 地址
    "macaddr8"    MACADDR8,          -- 扩展类型，8 字节，EUI-64 格式的 MAC 地址

    -- 位串类型
    "bit"         BIT,               -- 扩展类型，定长位串
    "varbit"      BIT VARYING,       -- 扩展类型，变长位串

    -- 文本搜索类型
    -- 略

    -- UUID 类型
    "uuid"        UUID,              -- 扩展类型，32 字节，通用唯一标识符

    -- XML 类型
    "xml"         XML,               -- 扩展类型

    -- JSON 类型
    "json"        JSON,              -- 扩展类型，以未解析的字符串形式存储的 JSON
    "jsonb"       JSONB,             -- 扩展类型，以解析后的二进制形式存储的 JSON

    -- 数组类型
    "array"       INTEGER ARRAY      -- 标准类型

    -- 组合类型
    -- 略

    -- 范围类型
    -- 略
);
