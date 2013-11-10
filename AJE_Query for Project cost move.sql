/*
*  Script to extract key information useful for constructing AJEs - e.g. if
*  required to transfer project costs from one project to another.
*/

SELECT
	glps.PROJ_ID
	, glps.ACCT_ID
	, glps.ORG_ID
	, glps.FY_CD
	, glps.PD_NO
	, glps.S_JNL_CD
	, gld.ID
	, gld.VCHR_NO
	, gld.JE_NO
	, gld.CHK_NO
	, gld.CASH_RECPT_NO
	, gld.AMT
	, gld.TRN_DESCn
	, gld.COMMENTS_NT
	, glps.TIME_STAMP
FROM DELTEKCP.DELTEK.GL_POST_SUM glps

LEFT JOIN DELTEKCP.DELTEK.GL_DETL gld
ON glps.SRCE_KEY = gld.GLPSUM_SRCE_KEY
AND glps.LVL1_KEY = gld.GLPSUM_LVL1_KEY
AND glps.LVL2_KEY = gld.GLPSUM_LVL2_KEY
AND glps.LVL3_KEY = gld.GLPSUM_LVL3_KEY

WHERE
	-- OPTIONAL:  filter by year and period
	glps.FY_CD = '2013'
	--AND glps.PD_NO = 1

	-- Select applicable project code in following line
	AND glps.PROJ_ID LIKE '01CNF.13.%%%%'
;