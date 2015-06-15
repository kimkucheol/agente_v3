SELECT  COUNT(*) AS EXISTE                                                   
FROM easy_work_colaborador_has_pabx_serv_fila_universal e                    
WHERE e.easy_work_colaborador_conf_id = '20010'
  AND e.active = 'Y'
  AND (  (e.fone_atendimento_act = 'Y') XOR                  
         (e.fone_transferencia_act= 'Y') XOR                  
         (e.chat_transferencia_act= 'Y') XOR                  
         (e.chat_atendimento_act= 'Y') XOR                  
         (e.mail_atendimento_act= 'Y') XOR                  
         (e.mail_transferencia_act= 'Y') XOR                  
         (e.recuperar_gravacao_act= 'Y') XOR                  
         (e.xcrm_atendimento_act= 'Y') XOR                  
         (e.vcrm_atendimento_act= 'Y') )                    
