-- データを別のカテゴリーに分類して集計する
SELECT CASE pref_name
WHEN '徳島県' THEN '四国'
WHEN '香川県' THEN '四国'
WHEN '愛媛県' THEN '四国'
WHEN '高知県' THEN '四国'
WHEN '福岡県' THEN '九州'
WHEN '佐賀県' THEN '九州'
WHEN '長崎県' THEN '九州'
WHEN '鹿児島県' THEN '九州'
WHEN '宮崎県' THEN '九州'
WHEN '熊本県' THEN '九州'
WHEN '群馬県' THEN '外国'
ELSE 'その他'
END AS district,
SUM(population)
FROM PropTbl
GROUP BY CASE pref_name
WHEN '徳島県' THEN '四国'
WHEN '香川県' THEN '四国'
WHEN '愛媛県' THEN '四国'
WHEN '高知県' THEN '四国'
WHEN '福岡県' THEN '九州'
WHEN '佐賀県' THEN '九州'
WHEN '長崎県' THEN '九州'
WHEN '鹿児島県' THEN '九州'
WHEN '宮崎県' THEN '九州'
WHEN '熊本県' THEN '九州'
WHEN '群馬県' THEN '外国'
ELSE 'その他'
END;

-- 人口階級ごとに都道府県を分布
SELECT
CASE WHEN population < 100  THEN '01'
CASE WHEN population >= 100  AND population < 200 THEN '02'
CASE WHEN population >= 200  AND population < 300 THEN '03'
CASE WHEN population >= 300  AND population < 400 THEN '04'
ELSE NULL
END AS pop_class,
COUNT(*) AS cnt
FROM PropTable
GROUP BY
CASE WHEN population < 100  THEN '01'
CASE WHEN population >= 100  AND population < 200 THEN '02'
CASE WHEN population >= 200  AND population < 300 THEN '03'
CASE WHEN population >= 300  AND population < 400 THEN '04'
ELSE NULL
END;

-- データを別のカテゴリーに分類して集計する
-- リファクタリング
SELECT CASE pref_name
WHEN '徳島県' THEN '四国'
WHEN '香川県' THEN '四国'
WHEN '愛媛県' THEN '四国'
WHEN '高知県' THEN '四国'
WHEN '福岡県' THEN '九州'
WHEN '佐賀県' THEN '九州'
WHEN '長崎県' THEN '九州'
WHEN '鹿児島県' THEN '九州'
WHEN '宮崎県' THEN '九州'
WHEN '熊本県' THEN '九州'
WHEN '群馬県' THEN '外国'
ELSE 'その他'
END AS district,
SUM(population)
FROM PropTbl
GROUP BY district
END;

-- 人口階級ごとに都道府県を分布
-- リファクタリング
SELECT
CASE WHEN population < 100  THEN '01'
CASE WHEN population >= 100  AND population < 200 THEN '02'
CASE WHEN population >= 200  AND population < 300 THEN '03'
CASE WHEN population >= 300  AND population < 400 THEN '04'
ELSE NULL
END AS pop_class,
COUNT(*) AS cnt
FROM PropTable
GROUP BY pop_class
END;
