-- Locked tables :
SELECT session_id "sid",
  SERIAL# "Serial",
    SUBSTR(object_name,1,20) "Object",
      SUBSTR(os_user_name,1,10) "Terminal",
        SUBSTR(oracle_username,1,10) "Locker",
	  NVL(lockwait,'active') "Wait",
	    DECODE(locked_mode, 2, 'row share', 3, 'row exclusive', 4, 'share', 5, 'share row exclusive', 6, 'exclusive', 'unknown') "Lockmode",
	      OBJECT_TYPE "Type"
	      FROM SYS.V_$LOCKED_OBJECT A,
	        SYS.ALL_OBJECTS B,
		  SYS.V_$SESSION c
		  WHERE A.OBJECT_ID = B.OBJECT_ID
		  AND C.SID         = A.SESSION_ID
		  ORDER BY 1 ASC,
		    5 DESC;
