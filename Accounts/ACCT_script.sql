-- Script to pull selected fields from teh ACCT table

SELECT 
	a.ACCT_ID
	, a.ACCT_NAME
	, (a.ACCT_ID + ': ' + a.ACCT_NAME) AS FULL_ACCT_NAME
	, a.S_ACCT_TYPE_CD AS ACCT_Code

FROM DELTEKCP.DELTEK.ACCT a

WHERE a.DETL_FL = 'Y'
;