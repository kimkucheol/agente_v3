select p.id,                                                               
       p.descricao,                                                        
       p.texto,                                                            
       a.easy_wfaq_grupo_conf_id                                           
from easy_wfaq_grupo_has_pergunta a                                        
left join easy_wfaq_pergunta_conf p on a.easy_wfaq_pergunta_conf_id = p.id 
where true                                                                 
and a.active = 'Y'
and p.active = 'Y'
