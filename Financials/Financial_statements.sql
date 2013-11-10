-- Script provides report on the underlying structure of financial reports


SELECT DISTINCT
	f.FS_CD
	, f.FS_LN_KEY
	, f.FS_MAJOR_NO
	, f.FS_GRP_NO
	, f.FS_LN_NO
	, f.FS_MAJOR_DESC
	, f.FS_GRP_DESC
	, f.FS_LN_DESC
	, fa.ACCT_ID
	, a.ACCT_NAME
FROM DELTEKCP.DELTEK.FS_LN f
LEFT JOIN 
	DELTEKCP.DELTEK.FS_LN_ACCT fa
	ON
		f.FS_CD = fa.FS_CD
		AND f.FS_LN_KEY = fa.FS_LN_KEY

LEFT JOIN DELTEKCP.DELTEK.ACCT a
	ON fa.ACCT_ID = a.ACCT_ID

-- Optional:  use "WHERE" clause to filter by selected statements, if desired
-- WHERE f.FS_CD = 'ISELC'

ORDER BY
	f.FS_MAJOR_NO
	, f.FS_GRP_NO
	, f.FS_LN_NO
;