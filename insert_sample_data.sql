INSERT INTO products_categories (id, name, parent_id, active, created_at, updated_at ) VALUES
	( 1, '健康食品', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 2, 'ゲーム', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO products_extend_define ( category_id, sub_id, name, sort_num, data_type, created_at, updated_at ) VALUES
	( 1, 1, '賞味期限', 1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 1, 2, '冷蔵配送フラグ', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 1, 3, '定期購入対象商品フラグ', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 2, 1, '予約開始日', 2, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 2, 2, '特典梱包フラグ', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO products ( id , name, code, category_id, active, created_at, updated_at ) VALUES
	( 1, 'これがE（ビタミンサプリメント）', '9099011', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP ),
	( 2, '幻想魔神伝（3Dアクション）', 'g001-99001', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP );

INSERT INTO products_extend ( product_id, category_id, sub_id, val, created_at, updated_at ) VALUES
	( 1, 1, 1, '90', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 1, 1, 2, '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 1, 1, 3, '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 2, 2, 1, '2100-1-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	( 2, 2, 2, '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)