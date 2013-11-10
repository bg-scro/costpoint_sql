--Script to generate a report on Open Billing Detail table.

SELECT
o.ORG_ID
, o.TRN_PROJ_ID
, p.PROJ_NAME
, o.ACCT_ID
, a.ACCT_NAME
, o.FY_CD
, o.PD_NO
, o.S_JNL_CD
, o.VCHR_NO
, o.TRN_DESC
, o.TRN_AMT
, o.BILL_AMT
, o.HOLD_AMT

FROM 
	DELTEKCP.DELTEK.OPEN_BILLING_DETL o
	
LEFT JOIN DELTEKCP.DELTEK.PROJ p
ON o.TRN_PROJ_ID = p.PROJ_ID

LEFT JOIN DELTEKCP.DELTEK.ACCT a
ON o.ACCT_ID = a.ACCT_ID
;