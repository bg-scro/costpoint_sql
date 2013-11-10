-- Script for pulling vendors to be approved


SELECT
da.ORG_ID
, v.VEND_APPRVL_CD
, v.VEND_ID
, va.ADDR_DC
, va.MAIL_STATE_DC AS 'STATE'
, v.VEND_NAME
, v.VEND_LONG_NAME
, v.VEND_GRP_CD AS 'GROUP'
, v.AP_1099_TAX_ID AS 'TIN'
, v.PRNT_1099_FL AS '1099?'
, da.AP_ACCTS_DESC
, ca.CASH_ACCTS_DESC
, v.USER_ID

FROM 
DELTEKCP.DELTEK.VEND v
, DELTEKCP.DELTEK.DFLT_AP_ACCTS da
, DELTEKCP.DELTEK.DFLT_CASH_ACCTS ca
, DELTEKCP.DELTEK.VEND_ADDR va

WHERE
	v.AP_ACCTS_KEY = da.AP_ACCTS_KEY
	AND v.CASH_ACCTS_KEY = ca.CASH_ACCTS_KEY
	AND v.VEND_ID = va.VEND_ID
	AND v.VEND_APPRVL_CD = 'P' --OR v.VEND_APPRVL_CD = 'N'
	-- Following is optional flag, if invalid/deprecated vendors in system
	-- (modify to suit depending on code structure used)
	AND v.VEND_ID NOT LIKE '99_%'

ORDER BY 
	da.ORG_ID
	, v.VEND_ID
;