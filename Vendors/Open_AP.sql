-- SCRIPT USED TO COLLECT AP DATA FOR CASH FLOW REPORTING
-- AND OPEN AP REPORTING

SELECT
 vhh.AP_ORG_ID
 , vhh.VEND_ID
 , vhh.TERMS_DC
 , v.PAY_WHEN_PAID_FL AS 'VEND_PWP'
 , vhh.INVC_DT
 , vhh.DUE_DT
 , vhh.S_STATUS_CD
 , vhh.PAY_WHEN_PAID_FL AS 'VCHR_PWP'
 , vhh.PAYWPD_AMT
 , vhh.INVC_AMT
 , oa.PAID_AMT
 , oa.PAY_AMT
 , (vhh.INVC_AMT - oa.PAID_AMT) AS BALANCE_DUE
 , CASE 
	WHEN DATEDIFF(d,vhh.DUE_DT,GETDATE())< 0 THEN 0
	ELSE DATEDIFF(d,vhh.DUE_DT,GETDATE())
	END AS AGING

FROM DELTEKCP.DELTEK.VCHR_HDR_HS vhh

LEFT JOIN DELTEKCP.DELTEK.OPEN_AP oa
	ON oa.VCHR_KEY = vhh.VCHR_KEY
	
LEFT JOIN DELTEKCP.DELTEK.VEND v
	ON vhh.VEND_ID = v.VEND_ID
;	