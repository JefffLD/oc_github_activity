-- Operation en cours : 
SET lines 2000 pages 0
SET LONG 5000
SET pages 100
column sid format 999
column username format a12
BREAK ON sql_hash_value ON sid ON username ON status ON "Temps Ecoul�"
SELECT s.sid,
  s.serial#,
    s.username,
      s.status,
        ltrim(TO_CHAR(TRUNC(s.last_call_et/3600), '09'))
	  || ':'
	    || ltrim(TO_CHAR(TRUNC(mod(s.last_call_et,3600)/60), '09'))
	      || ':'
	        || ltrim(TO_CHAR(mod(s.last_call_et,60), '09')) "Temps Ecoul�",
		  q.sql_text
		  FROM v$session s,
		    v$sqltext q
		    WHERE s.sql_hash_value      =q.hash_value
		    AND s.sql_address           =q.address
		    AND s.username             IS NOT NULL
		    AND status                 <> 'INACTIVE'
		    AND (s.sid, s.serial#) NOT IN
		      (SELECT sid,
		          serial#
			    FROM v$session
			      WHERE audsid = sys_context('userenv','sessionid')
			        )
				ORDER BY s.username,
				  s.sid,
				    q.piece;

