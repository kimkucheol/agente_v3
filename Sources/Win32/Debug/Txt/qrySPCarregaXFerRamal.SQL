SELECT id,
       descricao
FROM easy_work_colaborador_conf
WHERE true = true
  AND active =  'Y'
  AND easy_call_empresa_conf_id = '10001'
  AND supervisor_id = '20010'
