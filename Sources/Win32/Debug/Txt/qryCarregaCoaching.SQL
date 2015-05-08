select u.id, u.descricao                                                               
from easy_work_colaborador_conf u                                                      
left join easy_sist_usuario_perfil_conf p on u.easy_sist_usuario_perfil_conf_id = p.id 
where true                                                                             
and u.active = 'Y'
and p.active = 'Y'
and p.tipo in (4, 5)                                                                   
and u.easy_call_empresa_conf_id = 10001
