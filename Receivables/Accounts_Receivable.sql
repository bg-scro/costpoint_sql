-- Script used to query Accounts Receivable in order to
-- build AR Aging reports

SELECT
	c.CUST_TYPE_DC AS 'CUST_TYPE'
	, arh.CUST_ID
	, arh.RCV_ORG_ID
	, LEFT(arh.RCV_ORG_ID,7) AS 'ORG_THIRD_LVL'
	, arh.INVC_DT
	, arh.DUE_DT
	, arh.INVC_AMT
	, arh.RECPT_AMT
	, (arh.INVC_AMT - arh.RECPT_AMT) AS 'BALANCE_DUE'
	,  CASE 
		WHEN DATEDIFF(d,arh.DUE_DT,GETDATE())< 0 THEN 0
		ELSE DATEDIFF(d,arh.DUE_DT,GETDATE())
		END AS AGING_DUE_DT
	,  CASE 
		WHEN DATEDIFF(d,arh.INVC_DT,GETDATE())< 0 THEN 0
		ELSE DATEDIFF(d,arh.INVC_DT,GETDATE())
		END AS AGING_INVC_DT

FROM DELTEKCP.DELTEK.AR_HDR_HS arh

LEFT JOIN DELTEKCP.DELTEK.CUST c
	ON c.CUST_ID = arh.CUST_ID
	AND c.COMPANY_ID = arh.COMPANY_ID
;