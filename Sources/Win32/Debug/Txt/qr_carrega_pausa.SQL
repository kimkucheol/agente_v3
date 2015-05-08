SELECT 
 p.id, 
 p.descricao,
 p.tipo,
 'N' as 'pausa_pos_rest_act',
 '0' as 'pausa_pos_rest_tmp',
 '0' as 'pausa_pos_rest_tmp',
 p.permite_chamada_ativa_act,
 o.id,
 o.active,
 o.transfer_act,
 o.restritiva_dur_act,
 o.restritiva_dur_valor,
 o.restritiva_qde_act,
 o.restritiva_qde_valor,
 o.easy_call_operacao_pausa_conf_id,
 o.easy_call_operacao_conf_id,
 o.duracao_min_act,
 o.duracao_min_valor,
 p.bloqueio_act
FROM 
 easy_call_operacao_pausa_conf p 
 left join easy_call_operacao_has_pausa o on o.easy_call_operacao_pausa_conf_id = p.id
where 
 o.active = 'Y' and
 p.active = 'Y' and
 (o.easy_call_operacao_conf_id = :vidoperacao and tipo = 'M') or (tipo = 'S')
