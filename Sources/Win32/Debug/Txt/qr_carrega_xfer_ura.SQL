select
 id, 
 descricao
from
 easy_pabx_serv_ura_conf
where 
 active = 'Y' 
 and easy_call_empresa_conf_id = :vempresa
order by descricao asc
