SELECT
    p.id_product,
    pa.reference,
    pq.quantity
FROM zksm_product p
LEFT JOIN zksm_product_attribute pa ON (p.id_product = pa.id_product)
LEFT JOIN zksm_stock_available pq ON (p.id_product = pq.id_product AND pa.id_product_attribute = pq.id_product_attribute)
LEFT JOIN zksm_product_lang pl ON (p.id_product = pl.id_product)
LEFT JOIN zksm_product_attribute_combination pac ON (pa.id_product_attribute = pac.id_product_attribute)
LEFT JOIN zksm_attribute_lang pal ON (pac.id_attribute = pal.id_attribute)
LEFT JOIN zksm_product_attribute_image pai on(pa.id_product_attribute = pai.id_product_attribute)
WHERE pl.id_lang = 1
AND pal.id_lang = 1
GROUP BY pa.reference

union

SELECT
    p.id_product,
    p.reference,
    p.quantity
FROM zksm_product p
LEFT JOIN zksm_stock_available pq ON (p.id_product = pq.id_product)
LEFT JOIN zksm_product_lang pl ON (p.id_product = pl.id_product)
WHERE pl.id_lang = 1
GROUP BY p.reference

ORDER BY id_product
