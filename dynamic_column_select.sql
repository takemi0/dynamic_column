SELECT
	id,
    name,
    code,
    product.category_id as category_id,
    active,
    begin_at,
    end_at,
    col1.val as val1,
    col2.val as val2,
    col3.val as val3
FROM
( SELECT * FROM products ) AS product
LEFT JOIN ( SELECT product_id, category_id, val As val FROM products_extend WHERE sub_id = 1 ) As col1 
	ON ( col1.product_id = product.id AND col1.category_id = product.category_id )
LEFT JOIN ( SELECT product_id, category_id, val As val FROM products_extend WHERE sub_id = 2 ) As col2
	ON ( col2.product_id = product.id AND col2.category_id = product.category_id )
LEFT JOIN ( SELECT product_id, category_id, val As val FROM products_extend WHERE sub_id = 3 ) As col3
	ON ( col3.product_id = product.id AND col3.category_id = product.category_id )
WHERE
	product.category_id = 1