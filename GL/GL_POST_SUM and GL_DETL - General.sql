SELECT
	glps.FY_CD
	, glps.PD_NO
	, glps.ORG_ID
	, LEFT(glps.ORG_ID,4) AS ORG_SECOND_LVL
	, LEFT(glps.ORG_ID,7) AS ORG_THIRD_LVL
	, glps.ACCT_ID
	, glps.PROJ_ID
	, glps.S_JNL_CD
	, gld.ID
	, gld.VCHR_NO
	, gld.JE_NO
	, gld.CHK_NO
	, gld.CASH_RECPT_NO
	, gld.INVC_ID
	, gld.AMT
	, gld.TRN_DESC
	, gld.COMMENTS_NT
	, glps.MODIFIED_BY
	, glps.TIME_STAMP
FROM DELTEKCP.DELTEK.GL_POST_SUM glps

LEFT JOIN DELTEKCP.DELTEK.GL_DETL gld
	ON glps.SRCE_KEY = gld.GLPSUM_SRCE_KEY
	AND glps.LVL1_KEY = gld.GLPSUM_LVL1_KEY
	AND glps.LVL2_KEY = gld.GLPSUM_LVL2_KEY
	AND glps.LVL3_KEY = gld.GLPSUM_LVL3_KEY

WHERE 
	glps.FY_CD = 2013
	--AND glps.PD_NO = 1 
	AND glps.S_JNL_CD = 'PAJ'
--glps.ACCT_ID = '3100-00020-0020'
ORDER BY 
	glps.FY_CD
	, glps.PD_NO
;