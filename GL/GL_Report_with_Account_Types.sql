SELECT
	gl.FY_CD
	, gl.PD_NO
	, gl.ORG_ID
	, LEFT(gl.ORG_ID, 4) AS ORG_SECOND_LVL
	, LEFT(gl.	ORG_ID, 7) AS ORG_THIRD_LVL
	, CASE 
		WHEN	
			-- NOTE the 1140 accounts are credit cards;  these need to 
			-- be changed to 21XX (liability) accounts, at which point this section
			-- of script should be removed.
			gl.ACCT_ID LIKE '1140-1%'
			OR gl.ACCT_ID LIKE '1140-2%'
			THEN 'LIABILITY'
		WHEN gl.ACCT_ID LIKE '1%' THEN 'ASSET'
		WHEN gl.ACCT_ID LIKE '2%' THEN 'LIABILITY'
		WHEN gl.ACCT_ID LIKE '3900-99%' THEN 'ASSET'
		WHEN gl.ACCT_ID LIKE '3%' THEN 'EQUITY'
		WHEN gl.ACCT_ID LIKE '4%' THEN 'REVENUE'
		WHEN gl.ACCT_ID LIKE '5%' THEN 'DIRECT EXP'
		WHEN gl.ACCT_ID LIKE '7%' THEN 'OHD EXP' 
		WHEN gl.ACCT_ID LIKE '8%' THEN 'GA EXP'
		WHEN gl.ACCT_ID LIKE '90%' THEN 'UNA EXP'
		WHEN gl.ACCT_ID LIKE '6000-00050%' THEN 'BONUS EXP'
		WHEN 
			gl.ACCT_ID LIKE '6000-00010%' 
			OR gl.ACCT_ID LIKE '6000-00020%'
			OR gl.ACCT_ID LIKE '6000-00030%' 
			OR gl.ACCT_ID LIKE '6000-00040%'
			THEN 'FRINGE'
		WHEN 
			gl.ACCT_ID LIKE '91%'
			OR gl.ACCT_ID LIKE '92%'
			THEN 'SERVICE CTR'
		WHEN gl.ACCT_ID LIKE '99%' THEN 'CAPX'
		WHEN 
			gl.ACCT_ID LIKE 'C%'
			OR gl.ACCT_ID LIKE 'D%'
			THEN 'POOL ALLOCATION'
		ELSE 'NONE'
	END AS ACCOUNT_TYPE
	, gl.ACCT_ID
	, a.ACCT_NAME
	, gl.AMT

FROM DELTEKCP.DELTEK.GL_POST_SUM gl

LEFT JOIN DELTEKCP.DELTEK.ACCT a
	ON gl.ACCT_ID = a.ACCT_ID
;