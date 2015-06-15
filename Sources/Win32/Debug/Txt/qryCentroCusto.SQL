select r.id,                                                                                              
       r.descricao                                                                                        
from easy_call_operacao_has_pabx_serv_rota_inteligente i                                                  
     left join easy_pabx_serv_rota_inteligente_conf r on i.easy_pabx_serv_rota_inteligente_conf_id = r.id 
where true                                                                                                
  and i.active = 'Y'
  and r.active = 'Y'
  and i.easy_call_operacao_conf_id = 10003 
order by r.descricao asc                                                                                  
