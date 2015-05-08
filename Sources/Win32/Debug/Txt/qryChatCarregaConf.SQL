(                                                                                                                  
SELECT c1.id AS sala,                                                                                              
	   c2.wrapuptime AS wrapuptime,                                                                                   
	   c2.desconexao_auto_act AS desconexao_msg_act,                                                                  
	   c2.desconexao_auto_tmp,                                                                                        
	   c2.desconexao_auto_msg AS desconexao_msg_txt                                                                   
FROM easy_work_colaborador_has_pabx_serv_fila_universal a                                                          
	 LEFT JOIN easy_pabx_serv_fila_universal_ctr c1 ON a.easy_pabx_serv_fila_universal_ctr_id = c1.id                 
	 LEFT JOIN easy_pabx_serv_fila_universal_chat_conf c2 ON c1.id = c2.easy_pabx_serv_fila_universal_ctr_id          
	 LEFT JOIN easy_work_colaborador_conf c ON a.easy_work_colaborador_conf_id = c.id                                 
WHERE c1.active = 'Y'
      AND c2.active = 'Y'
      AND a.active = 'Y'
      AND a.chat_atendimento_act = 'Y'
      AND a.easy_work_colaborador_conf_id = 20010
GROUP BY c1.id                                                                                                     
)                                                                                                                  
UNION                                                                                                              
(                                                                                                                  
SELECT c1.id AS sala,                                                                                              
	   c2.wrapuptime AS wrapuptime,                                                                                   
	   c2.desconexao_auto_act AS desconexao_msg_act,                                                                  
	   c2.desconexao_auto_tmp,                                                                                        
	   c2.desconexao_auto_msg AS desconexao_msg_txt                                                                   
FROM easy_work_equipe_has_fila a                                                                                   
	 LEFT JOIN easy_pabx_serv_fila_universal_ctr c1 ON a.easy_pabx_serv_fila_universal_ctr_id = c1.id                 
	 LEFT JOIN easy_pabx_serv_fila_universal_chat_conf c2 ON c1.id = c2.easy_pabx_serv_fila_universal_ctr_id          
WHERE (c1.id NOT IN (SELECT d.id                                                                                   
                     FROM easy_work_colaborador_has_pabx_serv_fila_universal e                                     
        		         LEFT JOIN easy_pabx_serv_fila_universal_ctr d ON e.easy_pabx_serv_fila_universal_ctr_id = d.id 
   		        WHERE e.easy_work_colaborador_conf_id = 20010))                             
 AND c1.active = 'Y'
 AND c2.active = 'Y'
 AND a.active = 'Y'
 AND a.chat_atendimento_act = 'Y'
	AND a.easy_work_equipe_conf_id = 1
GROUP BY c1.id                                                                                                     
)                                                                                                                  
order by 1 asc                                                                                                     
