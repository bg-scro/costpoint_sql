-- Script provides report on the underlying structure of financial reports
-- along with period ending amounts.

SELECT DISTINCT
	f.FS_CD
	, fss.ORG_ID
	, LEFT(fss.ORG_ID, 4) AS ORG_SECOND_LVL
	, LEFT(fss.ORG_ID, 7) AS ORG_THIRD_LVL
	, f.FS_LN_KEY
	, f.FS_MAJOR_NO
	, f.FS_GRP_NO
	, f.FS_LN_NO
	, f.FS_MAJOR_DESC
	, f.FS_GRP_DESC
	, f.FS_LN_DESC
	, fa.ACCT_ID
	, a.ACCT_NAME
	, fss.BEG_AMT
	, fss.PD_1_AMT
	, fss.PD_2_AMT
	, fss.PD_3_AMT
	, fss.PD_4_AMT
	, fss.PD_5_AMT
	, fss.PD_6_AMT
	, fss.PD_7_AMT
	, fss.PD_8_AMT
	, fss.PD_9_AMT
	, fss.PD_10_AMT
	, fss.PD_11_AMT
	, fss.PD_12_AMT
	, (fss.BEG_AMT 
		+fss.PD_1_AMT
		+fss.PD_2_AMT
		+fss.PD_3_AMT
		+fss.PD_4_AMT
		+fss.PD_5_AMT
		+fss.PD_6_AMT
		+fss.PD_7_AMT
		+fss.PD_8_AMT
		+fss.PD_9_AMT
		+fss.PD_10_AMT
		+fss.PD_11_AMT
		+fss.PD_12_AMT
		) AS TOTAL
FROM DELTEKCP.DELTEK.FS_LN f
LEFT JOIN 
	DELTEKCP.DELTEK.FS_LN_ACCT fa
	ON
		f.FS_CD = fa.FS_CD
		AND f.FS_LN_KEY = fa.FS_LN_KEY

LEFT JOIN DELTEKCP.DELTEK.ACCT a
	ON fa.ACCT_ID = a.ACCT_ID

RIGHT JOIN DELTEKCP.DELTEK.FS_SUM fss
	ON fa.ACCT_ID = fss.ACCT_ID

-- Optional:  use "WHERE" clause to filter by selected statements, if desired
-- WHERE f.FS_CD = 'ISELC'

ORDER BY
	f.FS_MAJOR_NO
	, f.FS_GRP_NO
	, f.FS_LN_NO
;