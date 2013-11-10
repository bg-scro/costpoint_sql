-- Script to select key fields from the PSR report table

SELECT 
	psr.PROJ_ID,
	proj.PROJ_NAME,
	psr.ACCT_ID, 
	acct.ACCT_NAME,
	psr.ORG_ID, 
	psr.FY_CD,
	psr.PD_NO,
	psr.PTD_INCUR_AMT,
	psr.YTD_INCUR_AMT

FROM 
	DELTEKCP.DELTEK.PSR_FINAL_DATA psr
	, DELTEKCP.DELTEK.PROJ proj
	, DELTEKCP.DELTEK.ACCT acct

WHERE
	psr.PROJ_ID = proj.PROJ_ID
	AND psr.ACCT_ID = acct.ACCT_ID