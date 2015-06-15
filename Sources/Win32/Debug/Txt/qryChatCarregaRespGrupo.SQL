select                                                                                           
m.id,                                                                                            
m.descricao,                                                                                     
m.mensagem,                                                                                      
a.easy_call_resposta_rapida_grupo_conf_id                                                        
from                                                                                             
easy_call_resposta_rapida_msg_has_grupo a                                                        
left join easy_call_resposta_rapida_msg_conf m on a.easy_call_resposta_rapida_msg_conf_id = m.id 
where true                                                                                       
  and a.active = 'Y'
  and m.active = 'Y'
  and a.easy_call_resposta_rapida_grupo_conf_id in ()                         
