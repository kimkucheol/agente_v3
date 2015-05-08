select g.easy_work_colaborador_conf_id as id,                                        
       u.descricao                                                                   
from easy_work_colaborador_has_grupo g                                               
left join easy_work_colaborador_conf u on g.easy_work_colaborador_conf_id = u.id     
where g.active = 'Y'
and g.easy_call_grupo_conf_id in ( select g2.easy_call_grupo_conf_id                 
                                     from easy_work_colaborador_has_grupo g2         
                                     where true                                      
                                     and g2.active = 'Y'
                                     and g2.easy_work_colaborador_conf_id =          
'20010')           
and g.easy_work_colaborador_conf_id not in ('20010')
group by g.easy_work_colaborador_conf_id                                             
order by u.descricao asc                                                             
