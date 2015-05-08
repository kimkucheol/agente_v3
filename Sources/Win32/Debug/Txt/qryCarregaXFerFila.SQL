(                                                                                                             
SELECT c1.id as codigo,                                                                                       
       concat(c1.descricao," - ", c2.descricao) as fila                                                       
FROM easy_work_colaborador_has_pabx_serv_fila_universal a                                                     
     left join easy_pabx_serv_fila_universal_ctr c1 on a.easy_pabx_serv_fila_universal_ctr_id = c1.id         
     left join easy_pabx_serv_fila_universal_call_conf c2 on c1.id = c2.easy_pabx_serv_fila_universal_ctr_id  
     left join easy_work_colaborador_conf c on a.easy_work_colaborador_conf_id = c.id                         
WHERE c1.active = 'Y'
  and c2.active = 'Y'
  and a.active = 'Y'
  and a.fone_transferencia_act = 'Y'
  and a.easy_work_colaborador_conf_id = 20010
GROUP by c1.id                                                                                                
)                                                                                                             
UNION                                                                                                         
(                                                                                                             
SELECT c1.id AS codigo,                                                                                       
       CONCAT(c1.descricao," - ", c2.descricao) AS fila                                                       
FROM easy_work_equipe_has_fila a                                                                              
     left join easy_pabx_serv_fila_universal_ctr c1 on a.easy_pabx_serv_fila_universal_ctr_id = c1.id         
     left join easy_pabx_serv_fila_universal_call_conf c2 on c1.id = c2.easy_pabx_serv_fila_universal_ctr_id  
WHERE   (c1.id NOT IN (SELECT d.id                                                                            
    		         FROM easy_work_colaborador_has_pabx_serv_fila_universal e                                     
    		         LEFT JOIN easy_pabx_serv_fila_universal_ctr d ON e.easy_pabx_serv_fila_universal_ctr_id = d.id
   		        WHERE e.easy_work_colaborador_conf_id = 20010))                         
	AND c1.active = 'Y'
  and c2.active = 'Y'
  and a.active = 'Y'
  and a.fone_transferencia_act = 'Y'
	and a.easy_work_equipe_conf_id = 1
GROUP BY 1                                                                                                    
)                                                                                                             
ORDER BY 2 ASC                                                                                                
