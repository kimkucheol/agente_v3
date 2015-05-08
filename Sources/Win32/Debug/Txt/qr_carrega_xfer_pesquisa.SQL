select
 id,
 descricao
from
 easy_call_pesquisa_satisfacao_call_conf
where
 true
 and active = 'Y'
 and easy_call_empresa_conf_id = :vempresa
order by descricao
