SELECT CASE pref_name
WHEN '徳島' THEN '四国'
WHEN '香川' THEN '四国'
WHEN '愛媛' THEN '四国'
WHEN '高知' THEN '四国'
WHEN '福岡' THEN '九州'
WHEN '佐賀' THEN '九州'
WHEN '長崎' THEN '九州'
WHEN '群馬' THEN '外国'
ELSE 'その他'
END AS district,
SUM(population)
FROM Poptable
GROUP BY distinct ;

SELECT * FROM mydb.users AS u
INNER JOIN prefectures AS p ON p.id = u.prefecture_id

SELECT p.name ,COUNT(p.name) FROM mydb.users AS u
INNER JOIN prefectures AS p ON p.id = u.prefecture_id
GROUP BY p.name;

SELECT p.name ,COUNT(p.name) AS population
FROM mydb.users AS u
INNER JOIN prefectures AS p ON p.id = u.prefecture_id
GROUP BY p.name;

SELECT CASE p.name
WHEN '北海道' THEN 'デッカイどう'
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
COUNT(p.name) AS population
FROM mydb.users AS u
INNER JOIN prefectures AS p ON p.id = u.prefecture_id
GROUP BY district;

SELECT p.name,CASE p.name
WHEN '北海道' THEN 'デッカイどう'
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
END AS district
FROM mydb.users AS u
INNER JOIN prefectures AS p ON p.id = u.prefecture_id
ORDER BY p.id;





