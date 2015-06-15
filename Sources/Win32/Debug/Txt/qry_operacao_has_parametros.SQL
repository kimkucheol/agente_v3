select p.deslogar_agente_painel_act, time_to_sec(p.deslogar_agente_painel_tmp),              
       p.pausa_pos_atendimento_act, time_to_sec(p.pausa_pos_atendimento_tmp),                
       p.pausa_pos_popup_act, time_to_sec(p.pausa_pos_popup_tmp), p.pausa_pos_popup_msg,     
       p.pausa_login_act, time_to_sec(p.pausa_login_tmp),                                    
       p.pausa_login_popup_act, time_to_sec(p.pausa_login_popup_tmp), pausa_login_popup_msg, 
       p.alarme_act, p.alarme_1_tmp, p.alarme_1_msg,                                         
       p.alarme_2_tmp, p.alarme_2_msg,                                                       
       p.alarme_3_tmp, p.alarme_3_msg                                                        
from easy_call_operacao_parametros_conf p                                                    
where p.easy_call_operacao_conf_id = 10003
