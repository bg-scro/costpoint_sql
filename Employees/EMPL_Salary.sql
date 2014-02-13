/*********************************************
* SQL query to extract basic employee data
* from Costpoint.
* 
* CAUTION:  INCLUDES SALARY DATA
*
*********************************************/

SELECT 
	(CASE e.TAXBLE_ENTITY_ID 
			WHEN 1 THEN 'MMREM'
			WHEN 2 THEN 'SDA'
			ELSE 'ERROR'
	END) AS Entity
	, el.ORG_ID
	, (CASE e.S_EMPL_STATUS_CD
			WHEN 'ACT' THEN 'Active'
			WHEN 'IN' THEN 'Inactive'
			ELSE 'ERROR'
		END) AS 'Status'
	, el.EXMPT_FL AS 'Exempt?'
	, el.S_HRLY_SAL_CD AS 'Hourly/Salary Code'
	, el.WORK_STATE_CD AS 'Work State'
	--, el.LAB_LOC_CD AS 'Labor Location Code'
	, el.REASON_DESC AS 'Reason Description'
	--, el.REASON_DESC_2
	, e.EMPL_ID
	, e.LAST_NAME
	, e.LAST_NAME + ', ' + e.FIRST_NAME as Name
	, el.TITLE_DESC AS 'Position Title'
	, el.GENL_LAB_CAT_CD AS 'GLC Code'	
	, glc.GENL_LAB_CAT_DESC
	, CAST(e.ORIG_HIRE_DT AS DATE) AS 'Original Hire Date'
	, CAST(e.ADJ_HIRE_DT AS DATE) AS 'Adjusted Hire Date'
	, CAST(e.TERM_DT AS DATE) AS 'Termination Date'
	--, el.TERM_DT_FL
	, CAST(el.END_DT AS DATE) AS 'End Date'
	, e.SPVSR_NAME
	, el.HRLY_AMT
	, el.SAL_AMT
	--, el.ANNL_AMT
FROM DELTEKCP.DELTEK.EMPL e

	LEFT JOIN DELTEKCP.DELTEK.EMPL_LAB_INFO el
		ON e.EMPL_ID=el.EMPL_ID

	LEFT JOIN DELTEKCP.DELTEK.GENL_LAB_CAT glc
	ON el.GENL_LAB_CAT_CD = glc.GENL_LAB_CAT_CD

 WHERE e.LAST_NAME = 'CLEAVER'
-- WHERE e.S_EMPL_STATUS_CD = 'ACT'
--	WHERE e.TERM_DT > '1/01/2013' OR e.TERM_DT IS NULL 

ORDER BY
	e.TAXBLE_ENTITY_ID
	, e.S_EMPL_STATUS_CD ASC
	, e.EMPL_ID
	, el.TERM_DT_FL DESC
	, el.END_DT DESC
	, el.ORG_ID
	, el.EXMPT_FL DESC
	, el.ANNL_AMT DESC
	, e.LAST_NAME
;