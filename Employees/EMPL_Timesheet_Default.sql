-- Script joins the Employee table and the Default Timesheets table
-- to report employee information along with default timesheet.

SELECT 
	dts.EMPL_ID
	, e.LAST_FIRST_NAME
	, dts.PROJ_ID
	, dts.GENL_LAB_CAT_CD
	, dts.CHG_ORG_ID
	, el.TITLE_DESC
	, el.WORK_STATE_CD
	, el.EFFECT_DT
	, el.EXMPT_FL AS 'EXEMPT?'
	, el.HRLY_AMT
	, el.SAL_AMT

FROM DELTEKCP.DELTEK.DFLT_REG_TS dts
LEFT JOIN DELTEKCP.DELTEK.EMPL e
ON dts.EMPL_ID = e.EMPL_ID

LEFT JOIN DELTEKCP.DELTEK.EMPL_LAB_INFO el
ON dts.EMPL_ID = el.EMPL_ID

WHERE e.TERM_DT IS NULL

ORDER BY
	EMPL_ID
;