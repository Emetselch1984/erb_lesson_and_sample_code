SELECT shohin_id,shohin_mei,hanbai_tanka,
AVG(hanbai_tanka)
OVER (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
AS moving_avg
FROM shohin;

-- 名前付きウィンドウ構文
SELECT shohin_id,shohin_mei,hanbai_tanka,
AVG(hanbai_tanka) OVER W AS moving_avg
FROM shohin
WINDOW W AS (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

-- 名前付きウィンドウ構文は使いまわしが可能

SELECT shohin_id,shohin_mei,hanbai_tanka,
AVG(hanbai_tanka) OVER W AS moving_avg,
SUM(hanbai_tanka) OVER W AS moving_sum,
COUNT(hanbai_tanka) OVER W AS moving_count,
MAX(hanbai_tanka) OVER W AS moving_max
FROM shohin
WINDOW W AS (ORDER BY shohin_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

-- 過去の直近の日付を求める
SELECT sample_date AS cur_date,
MIN (sample_date)
OVER (ORDER BY sample_date ASC
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING )
AS latest_date
FROM LoadSample;

-- 直近のsample_date
SELECT sample_date AS cur_date,
MIN (sample_date)
OVER (ORDER BY sample_date ASC
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING )
AS latest_date,
MIN (load_val)
OVER (ORDER BY load_val ASC
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING )
AS latest_load
FROM LoadSample;

-- 名前付きウィンドウでまとめる
SELECT sample_date AS cur_date,
MIN (sample_date) OVER W AS latest_date,
MIN (load_val) OVER W AS latest_load
FROM LoadSample
WINDOW W AS (ORDER BY sample_date ASC
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)

-- フレームを後ろに移動
SELECT sample_date AS cur_date,
load_val AS cur_load,
MIN (sample_date) OVER W AS next_date,
MIN (load_val) OVER W AS next_load
FROM LoadSample
WINDOW W AS (ORDER BY sample_date ASC
ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING)

