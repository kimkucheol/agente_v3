SELECT COUNT(A.id) AS EXISTE                                                                      
FROM easy_call_operacao_pausa_conf A                                                              
     LEFT JOIN easy_call_operacao_has_pausa B ON B.easy_call_operacao_pausa_conf_id = A.id        
WHERE True                                                                                        
  AND B.active = 'Y'                                                               
  AND A.active = 'Y'                                                               
  AND (B.easy_call_operacao_conf_id = 10003 and tipo = 'M') 
  AND A.id IS NOT NULL                                                                            
