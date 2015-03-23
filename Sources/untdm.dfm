object datam: Tdatam
  OldCreateOrder = False
  Height = 634
  Width = 940
  object con_connect: TZConnection
    AutoCommit = False
    DesignConnection = True
    Protocol = 'mysql-5'
    HostName = 'vpn.diallink.com.br'
    Port = 33306
    User = 'root'
    Password = 'sqladmin'
    Left = 60
    Top = 8
  end
  object qryLogin: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 56
  end
  object qr_carrega_pausa: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'SELECT '
      ' p.id, '
      ' p.descricao,'
      ' p.tipo,'
      ' '#39'N'#39' as '#39'pausa_pos_rest_act'#39','
      ' '#39'0'#39' as '#39'pausa_pos_rest_tmp'#39','
      ' '#39'0'#39' as '#39'pausa_pos_rest_tmp'#39','
      ' p.permite_chamada_ativa_act,'
      ' o.id,'
      ' o.active,'
      ' o.transfer_act,'
      ' o.restritiva_dur_act,'
      ' o.restritiva_dur_valor,'
      ' o.restritiva_qde_act,'
      ' o.restritiva_qde_valor,'
      ' o.easy_call_operacao_pausa_conf_id,'
      ' o.easy_call_operacao_conf_id,'
      ' o.duracao_min_act,'
      ' o.duracao_min_valor,'
      ' p.bloqueio_act'
      'FROM '
      ' easy_call_operacao_pausa_conf p '
      
        ' left join easy_call_operacao_has_pausa o on o.easy_call_operaca' +
        'o_pausa_conf_id = p.id'
      'where '
      ' o.active = '#39'Y'#39' and'
      ' p.active = '#39'Y'#39' and'
      
        ' (o.easy_call_operacao_conf_id = :vidoperacao and tipo = '#39'M'#39') or' +
        ' (tipo = '#39'S'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
  end
  object qr_verifica_pausa: TZQuery
    Params = <>
    Left = 429
    Top = 8
  end
  object qr_carrega_sites: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select * from easy_call_operacao_agente_botoes_conf'
      'where easy_call_operacao_conf_id = :voperacao'
      'order by prioridade asc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'voperacao'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'voperacao'
        ParamType = ptUnknown
      end>
  end
  object qry_carrega_class_fila: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 200
  end
  object qryGravaClassificacao: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 296
  end
  object qryTempoFila: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 248
  end
  object qr_verifica_logoff: TZQuery
    Params = <>
    Left = 429
    Top = 56
  end
  object qr_carrega_integrador: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'SELECT  '
      '  i.id,'
      '  i.active,'
      '  i.descricao,'
      '  i.integrador_tipo,'
      '  i.integrador_dest,'
      '  i.integrador_sepa,'
      '  i.param0_act, '
      '  i.param1_act, '
      '  i.param2_act, '
      '  i.param3_act, '
      '  i.param4_act, '
      '  i.param5_act, '
      '  i.param6_act, '
      '  i.param7_act, '
      '  i.param8_act, '
      '  i.param9_act, '
      '  i.param0_val,'
      '  i.param1_val,'
      '  i.param2_val,'
      '  i.param3_val,'
      '  i.param4_val,'
      '  i.param5_val,'
      '  i.param6_val,'
      '  i.param7_val,'
      '  i.param8_val,'
      '  i.param9_val,'
      '  i.param0_nome_act,'
      '  i.param1_nome_act,'
      '  i.param2_nome_act,'
      '  i.param3_nome_act,'
      '  i.param4_nome_act,'
      '  i.param5_nome_act,'
      '  i.param6_nome_act,'
      '  i.param7_nome_act,'
      '  i.param8_nome_act,'
      '  i.param9_nome_act,'
      '  i.param0_nome_txt,'
      '  i.param1_nome_txt,'
      '  i.param2_nome_txt,'
      '  i.param3_nome_txt,'
      '  i.param4_nome_txt,'
      '  i.param5_nome_txt,'
      '  i.param6_nome_txt,'
      '  i.param7_nome_txt,'
      '  i.param8_nome_txt,'
      '  i.param9_nome_txt'
      'FROM'
      '  easy_call_operacao_integrador_conf i '
      'where '
      '  i.active = '#39'Y'#39' '
      '  and i.easy_call_operacao_conf_id = :vidoperacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
    Left = 255
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
  end
  object qry_has_fila: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'Select'
      ' '#160'count(*)'
      'from'
      ' '#160'easy_work_colaborador_has_pabx_serv_fila_universal'
      'where'
      ' easy_work_colaborador_conf_id = :vusuario '
      ' and active ='#39'Y'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'vusuario'
        ParamType = ptUnknown
      end>
    Left = 428
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vusuario'
        ParamType = ptUnknown
      end>
  end
  object qr_update_pausa_restritiva: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'update easy_dash_pabx_serv_fila_de_atendimento '
      ' set pausa_restritiva = '#39'Y'#39' '
      'where '
      ' easy_work_colaborador_conf_id = :vcolaborador')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
    Left = 255
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
  end
  object qr_verifica_pausa_restritiva: TZQuery
    Connection = con_connect
    SQL.Strings = (
      
        'select pausa_restritiva from easy_dash_pabx_serv_fila_de_atendim' +
        'ento '
      'where easy_work_colaborador_conf_id = :vcolaborador')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
    Left = 255
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
  end
  object qr_verifica_pausa_quantidade: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select '
      'count(*) '
      'from '
      'easy_rept_work_colaborador_pausa_consolidado_hist '
      'where'
      'data = curdate() '
      'and easy_work_colaborador_conf_id = :viduser '
      'and easy_call_operacao_pausa_conf_id = :vidpausa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'viduser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vidpausa'
        ParamType = ptUnknown
      end>
    Left = 255
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'viduser'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vidpausa'
        ParamType = ptUnknown
      end>
  end
  object qr_carrega_xfer_ura: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      ' id, '
      ' descricao'
      'from'
      ' easy_pabx_serv_ura_conf'
      'where '
      ' active = '#39'Y'#39' '
      ' and easy_call_empresa_conf_id = :vempresa'
      'order by descricao asc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
  end
  object qryCarregaXFerFila: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 344
  end
  object qryVerificaLoginAtivo: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 104
  end
  object qry_operacao_has_parametros: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 440
  end
  object qry_carrega_LogCallStep: TZQuery
    Connection = con_connect
    SQL.Strings = (
      '')
    Params = <>
    Left = 255
    Top = 344
  end
  object qry_carrega_class_operacao: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 392
  end
  object qryCarregaXFerRamal: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 440
  end
  object qr_carrega_xfer_pesquisa: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      ' id,'
      ' descricao'
      'from'
      ' easy_call_pesquisa_satisfacao_call_conf'
      'where'
      ' true'
      ' and active = '#39'Y'#39
      ' and easy_call_empresa_conf_id = :vempresa'
      'order by descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
  end
  object qryChatQueue: TZQuery
    Connection = conChatQueue
    Params = <>
    Left = 872
    Top = 64
  end
  object conChatQueue: TZConnection
    AutoCommit = False
    DesignConnection = True
    Protocol = 'mysql-5'
    HostName = 'vpn.diallink.com.br'
    Port = 33306
    User = 'root'
    Password = 'sqladmin'
    Left = 872
    Top = 8
  end
  object qryChatCarrega: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 8
  end
  object qryChatCarregaRespGrupo: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 152
  end
  object qryChatCarregaResp: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 96
  end
  object qryChangePass: TZQuery
    Connection = con_connect
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'select'
      '  u.nome,'
      '  u.login,'
      '  u.senha,'
      '  u.email,'
      '  u.dialpad,'
      '  u.easy_callcenter_operacao_conf_id,'
      '  u.easy_sistema_usuario_perfil_conf_id,'
      '  r.name as ramal,'
      '  r.ramal_secret as senha_ramal,'
      '  r.ramal_proxy as proxy_ramal,'
      '  u.id,'
      '  u.idioma,'
      '  e.id'
      'from'
      '  easy_sistema_usuario_conf u '
      
        '  left join easy_pabx_ramal_ctr r on u.easy_pabx_ramal_ctr_id = ' +
        'r.id'
      
        '  left join easy_callcenter_operacao_conf o on u.easy_callcenter' +
        '_operacao_conf_id = o.id'
      
        '  left join easy_sistema_empresa_conf e on o.easy_sistema_empres' +
        'a_conf_id = e.id'
      'where'
      '  u.active = '#39'Y'#39'  and'
      '  u.login = :vlogin and'
      '  u.senha = :vsenha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
  end
  object qryChatUpdateDash: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 208
  end
  object dtsChatPesquisaHist: TDataSource
    DataSet = qryChatPesquisaHist
    Left = 872
    Top = 184
  end
  object qryChatPesquisaHist: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 264
  end
  object qryChatPesquisaHistMsg: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 320
  end
  object qryUpdateStatus: TZQuery
    Connection = con_connect
    Params = <>
    Left = 424
    Top = 152
  end
  object qrySistemaVersao: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      '  u.nome,'
      '  u.login,'
      '  u.senha,'
      '  u.email,'
      '  u.dialpad,'
      '  u.easy_callcenter_operacao_conf_id,'
      '  u.easy_sistema_usuario_perfil_conf_id,'
      '  r.name as ramal,'
      '  r.ramal_secret as senha_ramal,'
      '  r.ramal_proxy as proxy_ramal,'
      '  u.id,'
      '  u.idioma,'
      '  e.id,'
      '  u.atendimento_auto_act'
      'from'
      '  easy_sistema_usuario_conf u '
      
        '  left join easy_pabx_ramal_ctr r on u.easy_pabx_ramal_ctr_id = ' +
        'r.id'
      
        '  left join easy_callcenter_operacao_conf o on u.easy_callcenter' +
        '_operacao_conf_id = o.id'
      
        '  left join easy_sistema_empresa_conf e on o.easy_sistema_empres' +
        'a_conf_id = e.id'
      'where'
      '  u.active = '#39'Y'#39'  and'
      '  u.login = :vlogin and'
      '  u.senha = :vsenha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
    Left = 255
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
  end
  object qryFaqConf: TZQuery
    Connection = con_connect
    Params = <>
    Left = 664
    Top = 8
  end
  object qry_nregistro_hist: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 488
  end
  object qryConferencia: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 368
  end
  object qryConferenciaTipo: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 416
  end
  object qry_has_pause: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'SELECT'
      ' COUNT(p.id)'
      'FROM '
      ' easy_call_operacao_pausa_conf p '
      
        ' left join easy_call_operacao_has_pausa o ON o.easy_call_operaca' +
        'o_pausa_conf_id = p.id'
      'WHERE'
      ' TRUE'
      ' AND p.active = '#39'Y'#39' '
      ' AND o.active = '#39'Y'#39
      
        ' AND ((o.easy_call_operacao_conf_id = :vidoperacao AND tipo = '#39'M' +
        #39') OR (tipo = '#39'S'#39'))')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
    Left = 428
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
  end
  object qry_has_classif_fila: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      'count(c.id)'
      'from '
      'easy_pabx_serv_fila_universal_has_classificacao a'
      
        'left join easy_pabx_serv_fila_universal_classificacao_conf c on ' +
        'a.easy_pabx_serv_fila_universal_classificacao_conf_id = c.id'
      'where'
      'true'
      'and a.active = '#39'Y'#39
      'and c.active = '#39'Y'#39
      'and c.easy_call_empresa_conf_id = :vidoperacao'
      'order by c.descricao asc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
    Left = 428
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vidoperacao'
        ParamType = ptUnknown
      end>
  end
  object qry_has_pausarestritiva: TZQuery
    Connection = con_connect
    SQL.Strings = (
      
        'select pausa_restritiva from easy_dash_pabx_serv_fila_de_atendim' +
        'ento '
      'where easy_work_colaborador_conf_id = :vcolaborador')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
    Left = 428
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vcolaborador'
        ParamType = ptUnknown
      end>
  end
  object qryLoginSup: TZQuery
    Connection = con_connect
    Params = <>
    Left = 60
    Top = 104
  end
  object qryChatCarregaConf: TZQuery
    Connection = con_connect
    Params = <>
    Left = 560
    Top = 56
  end
  object qryCarregaCoaching: TZQuery
    Connection = con_connect
    Params = <>
    Left = 425
    Top = 200
  end
  object qryUpdateCoaching: TZQuery
    Connection = con_connect
    Params = <>
    Left = 426
    Top = 246
  end
  object qryCarregaFilas: TZQuery
    Connection = con_connect
    Params = <>
    Left = 564
    Top = 480
  end
  object qrySistemaLogado: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      '  u.nome,'
      '  u.login,'
      '  u.senha,'
      '  u.email,'
      '  u.dialpad,'
      '  u.easy_callcenter_operacao_conf_id,'
      '  u.easy_sistema_usuario_perfil_conf_id,'
      '  r.name as ramal,'
      '  r.ramal_secret as senha_ramal,'
      '  r.ramal_proxy as proxy_ramal,'
      '  u.id,'
      '  u.idioma,'
      '  e.id,'
      '  u.atendimento_auto_act'
      'from'
      '  easy_sistema_usuario_conf u '
      
        '  left join easy_pabx_ramal_ctr r on u.easy_pabx_ramal_ctr_id = ' +
        'r.id'
      
        '  left join easy_callcenter_operacao_conf o on u.easy_callcenter' +
        '_operacao_conf_id = o.id'
      
        '  left join easy_sistema_empresa_conf e on o.easy_sistema_empres' +
        'a_conf_id = e.id'
      'where'
      '  u.active = '#39'Y'#39'  and'
      '  u.login = :vlogin and'
      '  u.senha = :vsenha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
    Left = 663
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vlogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vsenha'
        ParamType = ptUnknown
      end>
  end
  object qr_carrega_xfer_virtual: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      ' id,'
      ' descricao'
      'from'
      ' easy_pabx_serv_ramal_conferencia_numeros_conf'
      'where'
      ' true'
      ' and active = '#39'Y'#39
      ' and transferencia = '#39'Y'#39
      ' and easy_call_empresa_conf_id = :vempresa'
      'order by descricao asc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
  end
  object qryCentroCusto: TZQuery
    Connection = con_connect
    Params = <>
    Left = 664
    Top = 104
  end
  object qryAtualizaQualidade: TZQuery
    Connection = con_connect
    Params = <>
    Left = 668
    Top = 208
  end
  object qr_carrega_xfer_consulta: TZQuery
    Connection = con_connect
    SQL.Strings = (
      'select'
      ' id,'
      ' descricao'
      'from'
      ' easy_pabx_serv_ramal_conferencia_numeros_conf'
      'where'
      ' true'
      ' and active = '#39'Y'#39
      ' and consulta = '#39'Y'#39
      ' and easy_call_empresa_conf_id = :vempresa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vempresa'
        ParamType = ptUnknown
      end>
  end
  object qryCarregaLoja: TZQuery
    Connection = con_connect
    Params = <>
    Left = 255
    Top = 536
  end
  object qryUpdateRejectCall: TZQuery
    Connection = con_connect
    Params = <>
    Left = 426
    Top = 534
  end
  object qryCarregaEMails: TZQuery
    Connection = con_connect
    Params = <>
    Left = 564
    Top = 536
  end
end
