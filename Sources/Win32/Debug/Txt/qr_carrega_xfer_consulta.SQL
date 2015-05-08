select
 id,
 descricao
from
 easy_pabx_serv_ramal_conferencia_numeros_conf
where
 true
 and active = 'Y'
 and consulta = 'Y'
 and easy_call_empresa_conf_id = :vempresa
