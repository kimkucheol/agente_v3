select c.id, c.descricao, c.telefone, c.easy_pabx_serv_rota_inteligente_conf_id                                        
from easy_pabx_serv_ramal_conferencia_numeros_conf c                                                                   
 left join easy_pabx_serv_ramal_conferencia_has_numeros a on a.easy_pabx_serv_ramal_conferencia_numeros_conf_id = c.id 
where c.active = 'Y'
and a.active = 'Y'
and a.easy_pabx_serv_ramal_conferencia_conf_id = 1
