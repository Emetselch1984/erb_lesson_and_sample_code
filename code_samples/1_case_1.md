# 達人に学ぶSQL指南書
## CASE
```
達人に学ぶSQL指南書CASE文
```
### 要件
| pref_name |population|
| ---- | ---- |
|徳島|100|
|香川|200|
|愛媛|150|
|高知|200|
|福岡|300|
|佐賀|400|
|長崎|300|
|群馬|3|

このテーブルを下記のように表示する

| pref_name |population|
| ---- | ---- |
|四国|650|
|九州|1000|
|外国|3|

## 人口階級ごとに都道府県を区別する

| pop_class |cnt|
| ---- | ---- |
| 01 | 1 |
| 02 | 3 |
| 03 | 3 |
| 04 | 2 |


