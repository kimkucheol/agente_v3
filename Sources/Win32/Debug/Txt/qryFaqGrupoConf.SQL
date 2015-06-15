select g.id,                                                         
       g.descricao                                                   
from easy_wfaq_has_grupo a                                           
left join easy_wfaq_grupo_conf g on a.easy_wfaq_grupo_conf_id = g.id 
where true                                                           
 and a.active = 'Y'
 and g.active = 'Y'
 and a.easy_wfaq_conf_id = 1
