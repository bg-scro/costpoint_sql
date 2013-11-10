-- Script to generate report on total spending by vendor

SELECT
	v.VEND_GRP_CD 
	, v.VEND_ID
	, v.VEND_NAME
	, v.VEND_LONG_NAME
	, v.AP_1099_TAX_ID
	, vhh.FY_CD
	, SUM(vhh.INVC_AMT) AS Total_Invoiced

FROM 
	DELTEKCP.DELTEK.VEND v

LEFT JOIN DELTEKCP.DELTEK.VCHR_HDR_HS vhh
ON v.VEND_ID = vhh.VEND_ID

GROUP BY 
	v.VEND_GRP_CD
	, v.VEND_ID
	, v.VEND_NAME
	, v.VEND_LONG_NAME
	, v.AP_1099_TAX_ID
	, vhh.FY_CD

--ORDER BY Total_Invoiced DESC
;