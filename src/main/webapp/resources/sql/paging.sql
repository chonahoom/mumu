-- 일부 데이터만을 SELECT 출력할 경우
# SELECT *
# FROM tbl_board
# WHERE historyNumber > 0
# ORDER BY historyNumber DESC
# LIMIT 시작데이터, 데이터의 갯수;

SELECT *
FROM tbl_board
WHERE historyNumber > 0
ORDER BY historyNumber DESC
LIMIT 0, 10;