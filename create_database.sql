CREATE DATABASE dynamic_column_test DEFAULT CHARACTER SET utf8;

USE dynamic_column_test;

CREATE TABLE products_categories (
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '商品カテゴリID',
	name VARCHAR( 100 ) NOT NULL COMMENT '商品カテゴリ名',
	parent_id BIGINT UNSIGNED COMMENT '親カテゴリID',
	active TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '有効フラグ',
	created_at DATETIME COMMENT '作成日',
	updated_at DATETIME COMMENT '最終更新日',
	PRIMARY KEY ( id )
) ENGINE=innodb COMMENT '商品カテゴリマスタ';

CREATE TABLE products (
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '商品ID',
	name VARCHAR(100) NOT NULL COMMENT '商品名',
	code VARCHAR(20) NOT NULL COMMENT '商品コード',
	category_id BIGINT UNSIGNED COMMENT '商品カテゴリID',
	active TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '有効フラグ',
	begin_at DATETIME COMMENT '発売日',
	end_at DATETIME COMMENT '終売日',
	created_at DATETIME COMMENT '作成日',
	updated_at DATETIME COMMENT '最終更新日',
	PRIMARY KEY( id ),
	FOREIGN KEY( category_id ) REFERENCES products_categories( id )
) ENGINE=innodb COMMENT '商品マスタ';

CREATE TABLE products_extend_define (
	category_id BIGINT UNSIGNED NOT NULL COMMENT 'カテゴリID',
	sub_id BIGINT UNSIGNED NOT NULL COMMENT '拡張定義ID',
	sort_num BIGINT UNSIGNED NOT NULL COMMENT '列順',
	name VARCHAR(100) NOT NULL COMMENT '情報名',
	data_type TINYINT UNSIGNED NOT NULL COMMENT 'データ型(システムにて定義)',
	created_at DATETIME COMMENT '作成日',
	updated_at DATETIME COMMENT '最終更新日',
	PRIMARY KEY ( category_id, sub_id ),
	FOREIGN KEY( category_id ) REFERENCES products_categories( id )
) ENGINE=innodb COMMENT '商品拡張情報定義';

CREATE TABLE products_extend (
	product_id BIGINT UNSIGNED NOT NULL COMMENT '商品ID',
	category_id BIGINT UNSIGNED NOT NULL COMMENT 'カテゴリID',
	sub_id BIGINT UNSIGNED NOT NULL COMMENT '拡張定義ID',
	val TEXT NOT NULL COMMENT '値',
	created_at DATETIME COMMENT '作成日',
	updated_at DATETIME COMMENT '最終更新日',
	PRIMARY KEY ( product_id, category_id, sub_id ),
	FOREIGN KEY( product_id ) REFERENCES products( id ),
	FOREIGN KEY( category_id, sub_id ) REFERENCES products_extend_define( category_id, sub_id )
) ENGINE=innodb COMMENT '商品拡張情報';