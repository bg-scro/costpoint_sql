/*********************************************
* SQL query to extract basic employee data
* from Costpoint.
* 
* CAUTION:  INCLUDES SALARY DATA
*
*********************************************/

SELECT 
	e.TAXBLE_ENTITY_ID
	, el.ORG_ID
	, e.EMPL_ID
	,e.LAST_NAME
	, e.LAST_NAME + ', ' + e.FIRST_NAME as Name
	, glc.GENL_LAB_CAT_DESC
	, el.EXMPT_FL
	, e.ORIG_HIRE_DT
	--, e.ADJ_HIRE_DT
	, e.TERM_DT
	--, el.TITLE_DESC
	--, el.GENL_LAB_CAT_CD
	--, el.TERM_DT_FL
	, el.END_DT
	, e.SPVSR_NAME
	, el.HRLY_AMT
	--, el.SAL_AMT
	--, el.ANNL_AMT
FROM DELTEKCP.DELTEK.EMPL e

	LEFT JOIN DELTEKCP.DELTEK.EMPL_LAB_INFO el
		ON e.EMPL_ID=el.EMPL_ID

	LEFT JOIN DELTEKCP.DELTEK.GENL_LAB_CAT glc
	ON el.GENL_LAB_CAT_CD = glc.GENL_LAB_CAT_CD

-- WHERE e.S_EMPL_STATUS_CD = 'ACT'
	WHERE e.TERM_DT > '1/01/2013' OR e.TERM_DT IS NULL 

ORDER BY
	e.TAXBLE_ENTITY_ID
	, el.ORG_ID
	, el.ANNL_AMT DESC
	, el.EXMPT_FL
	, e.LAST_NAME
;