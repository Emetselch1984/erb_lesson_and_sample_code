SELECT shohin_id,shohin_mei,hanbai_tanka
AVG(hanbai_tanka)
OVER (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
AS moving_avg
FROM shohin;

-- 名前付きウィンドウ構文
SELECT shohin_id,shohin_mei,hanbai_tanka
AVG(hanbai_tanka) OVER W AS moving_avg FROM shohin
WINDOW W AS (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

-- 名前付きウィンドウ構文は使いまわしが可能

SELECT shohin_id,shohin_mei,hanbai_tanka
AVG(hanbai_tanka) OVER W AS moving_avg
SUM(hanbai_tanka) OVER W AS moving_sum
COUNT(hanbai_tanka) OVER W AS moving_count
MAX(hanbai_tanka) OVER W AS moving_max
FROM shohin
WINDOW W AS (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

