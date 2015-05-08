select                                                                                                                                   
s.id as subclass_id,                                                                                                                     
s.descricao,                                                                                                                             
a.easy_pabx_serv_fila_universal_classificacao_conf_id,                                                                                   
a.finalizadora,                                                                                                                          
DATE_ADD(curdate(), INTERVAL a.intervalo DAY),                                                                                           
a.redial                                                                                                                                 
from easy_pabx_serv_fila_universal_classificacao_sub_conf s                                                                              
     LEFT JOIN easy_pabx_serv_fila_universal_classificacao_has_sub a ON a.easy_pabx_serv_fila_universal_classificacao_sub_conf_id = s.id 
     LEFT JOIN easy_pabx_serv_fila_universal_classificacao_conf c ON a.easy_pabx_serv_fila_universal_classificacao_conf_id = c.id        
where s.active = 'Y'
  and a.active = 'Y'
  and s.easy_call_empresa_conf_id = 10001                                                                      
ORDER BY s.descricao ASC                                                                                                                 
