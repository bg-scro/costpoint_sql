-- NOTE:  This script is used to populate data for the GSA-IFF report
-- Do not change structure without consulting the GSA-IFF calculator to
-- confirm the data will still work properly.
SELECT
	hs.FY_CD
	, hs.PD_NO
	, hs.CASH_RECPT_NO
	, h.LN_NO
	, h.ORG_ID
	, h.PROJ_ID
	, h.ACCT_ID
	, h.CHK_NO
	, h.CUST_ID
	, h.INVC_ID
	, h.TRN_DESC
	, h.TRN_AMT
	, LEFT(h.PROJ_ID,5) AS 'TOP LEVEL PROJECT' 
	, RIGHT(h.PROJ_ID,4) AS 'THIRD LEVEL PROJ'
	, CASE
		WHEN hs.PD_NO >= 1 AND hs.PD_NO <= 3 THEN 1
		WHEN hs.PD_NO >= 4 AND hs.PD_NO <= 6 THEN 2
		WHEN hs.PD_NO >= 7 AND hs.PD_NO <= 9 THEN 3
		WHEN hs.PD_NO >= 10 AND hs.PD_NO <=12 THEN 4
		ELSE 0
	END AS 'QTR No'

FROM DELTEKCP.DELTEK.CASH_RECPT_HDR_HS hs
LEFT JOIN DELTEKCP.DELTEK.CASH_RECPT_TRN_HS h
ON hs.CASH_RECPT_HDR_KEY = h.CASH_RECPT_HDR_KEY

ORDER BY
	hs.FY_CD
	, hs.PD_NO
	, hs.CASH_RECPT_NO
	, h.LN_NO
;	