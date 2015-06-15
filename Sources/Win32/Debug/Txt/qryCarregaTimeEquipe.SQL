SELECT IF(c.horario_entrada < w.horario_entrada, c.horario_entrada, w.horario_entrada)                       AS Hr_Entrada,
       IF(c.horario_saida   > w.horario_saida, c.horario_saida, w.horario_saida)                             AS Hr_Saida,  
       w.avisar_saida_act                                                                                    AS AvisaouNao,
       w.avisar_saida_tmp                                                                                    AS Hr_MSG,    
       w.avisar_saida_msg                                                                                    AS Msg        
FROM easy_work_colaborador_conf c                                                                                          
     LEFT JOIN easy_work_equipe_worktime_conf w ON c.easy_work_equipe_conf_id = w.easy_work_equipe_conf_id                 
WHERE TRUE                                                                                                                 
 and w.cdata = 1
 and c.easy_work_equipe_conf_id = 1
 and c.id = 20010
