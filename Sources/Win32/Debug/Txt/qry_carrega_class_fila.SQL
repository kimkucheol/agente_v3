SELECT                                                                                                                      
c.id,                                                                                                                       
c.descricao,                                                                                                                
a.easy_pabx_serv_fila_universal_ctr_id,                                                                                     
a.disp_chat,                                                                                                                
a.disp_email,                                                                                                               
a.disp_sms                                                                                                                  
FROM                                                                                                                        
easy_pabx_serv_fila_universal_classificacao_conf c                                                                          
left join easy_pabx_serv_fila_universal_has_classificacao a on a.easy_pabx_serv_fila_universal_classificacao_conf_id = c.id 
where                                                                                                                       
a.active = 'Y'
and c.active = 'Y'
and c.easy_call_empresa_conf_id = 10001                                                           
order by c.descricao asc                                                                                                    
