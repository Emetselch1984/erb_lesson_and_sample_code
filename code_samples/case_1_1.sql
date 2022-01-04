SELECT CASE pref_name
WHERE '徳島' THEN '四国'
WHERE '香川' THEN '四国'
WHERE '愛媛' THEN '四国'
WHERE '高知' THEN '四国'
WHERE '福岡' THEN '九州'
WHERE '佐賀' THEN '九州'
WHERE '長崎' THEN '九州'
WHERE '群馬' THEN '外国'
ELSE 'その他'
END AS distinct,
SUM(population)
FROM Poptable
GROUP BY
