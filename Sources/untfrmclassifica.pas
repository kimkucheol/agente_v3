unit untfrmclassifica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel,
  Vcl.StdCtrls, sMemo, sButton, sComboBox, sLabel, Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sGroupBox, sCheckBox, StrUtils, DateUtils;

type
  Tfrmclassifica = class(TFrame)
    cmdSalvar: TsButton;
    pnlAgenda: TsGroupBox;
    rdgAgenda: TsRadioGroup;
    lblData: TsLabel;
    lblHora: TsLabel;
    dteAgenda: TsDateEdit;
    hraAgenda: TsMaskEdit;
    chkGravacao: TsCheckBox;
    chkPausar: TsCheckBox;
    grpFila: TsGroupBox;
    cboFila: TsComboBox;
    grpClassificacao: TsGroupBox;
    cboClassifica: TsComboBox;
    lblObservacao: TsLabel;
    memObs: TsMemo;
    chkLogoff: TsCheckBox;
    cboSubClassifica: TsComboBox;
    lblSubClass: TsLabel;
    procedure CarregaClassificacao;
    procedure CarregaTelasLinguagem;
    procedure cboClassificaChange(Sender: TObject);
    procedure cmdSalvarClick(Sender: TObject);
    procedure cboFilaChange(Sender: TObject);
    procedure cboSubClassificaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassifica: Tfrmclassifica;

implementation

{$R *.dfm}

uses untPrincipal, untdm, unttranslate, untfrmdialpad, untFuncoes, untLibrary;

{ Tfrmclassifica }

procedure Tfrmclassifica.cmdSalvarClick(Sender: TObject);
var
  temp: string;
  nForCsf: Integer;
  nForCsfS: Integer;
  nForClas: Integer;
  nForAgd: Integer;
  nForInd: Integer;
  nForFila: Integer;

  tmpTranscricao: String;
  tmpGravacaoVideoAct: String;
  tmpGravacaoVideoPath: String;
  tmpAgendamento_tipo: String;
  tmpAgendamento_data: String;
  tmpAgendamento_hora: String;
  tmpEasy_pabx_fila_ctr_id: String;
  tmpEasy_callcenter_classif_chamada_conf_id: String;
  tmpEasy_callcenter_classif_sub_chamada_conf_id: String;
  tmpTelefone: String;

  bFinalizadora: Boolean;
  bRedial: Boolean;
begin
  bFinalizadora := True;
  bRedial := False;

  tmpEasy_callcenter_classif_chamada_conf_id := '';
  tmpEasy_callcenter_classif_sub_chamada_conf_id := '';

  if TMyClassificacao.bClassificou = True then
  begin
    frmprincipal.mensagem(APP_MB_WAR_ALREADY_CLASSIFIED[ID_LANG]);

    if (TMyAppStatus.sTipoChamada = 'Ativo') then//Chamada Ativa
    begin
      LogCallStep('log_hangup_act', 'sTipoChamada :: Ativo');
    end//if (TMyAppStatus.sTipoChamada = 'Ativo') then
    else
      if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) = '')) then//Chamada Receptiva DDR
      begin
        LogCallStep('log_hangup_act', 'sTipoChamada :: Receptivo - DDR');
      end//if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) = '')) then
      else
        if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) <> '')) then//Chamada Receptiva Fila
        begin
          LogCallStep('log_hangup_act', 'sTipoChamada :: Receptivo - Fila');
        end;

    LogCallStep('log_hangup_act', 'ClassificaChamadaAtiva(');
    LogCallStep('log_hangup_act', IntToStr(TMyAppStatus.nCallQuality));
    LogCallStep('log_hangup_act', tmpTranscricao);
    LogCallStep('log_hangup_act', tmpGravacaoVideoAct);
    LogCallStep('log_hangup_act', tmpGravacaoVideoPath);
    LogCallStep('log_hangup_act', memObs.Text);
    LogCallStep('log_hangup_act', tmpAgendamento_tipo);
    LogCallStep('log_hangup_act', tmpAgendamento_data);
    LogCallStep('log_hangup_act', tmpAgendamento_hora);
    LogCallStep('log_hangup_act', TimeToStr(TMyAppStatus.dtvFimChamada - TMyAppStatus.dtvInicioChamada));
    LogCallStep('log_hangup_act', TimeToStr(TMyPausa.tTempoPausa));
    LogCallStep('log_hangup_act', TimeToStr(TMyAppStatus.tTempoHoldTotal));
    LogCallStep('log_hangup_act', IfThen(TMyXFer.bXFerExec, 'Y', 'N'));
    LogCallStep('log_hangup_act', IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerTipo, ''));
    LogCallStep('log_hangup_act', IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerDest, ''));
    LogCallStep('log_hangup_act', IfThen(chkGravacao.Checked, 'Y', 'N'));
    LogCallStep('log_hangup_act', 'N');
    LogCallStep('log_hangup_act', '');
    LogCallStep('log_hangup_act', TMyAppStatus.sSipDialStatus);
    LogCallStep('log_hangup_act', IfThen(TMyPausa.bPausado, '1', '0'));
    LogCallStep('log_hangup_act', IfThen(TMyCoaching.bCoaching, 'Y', 'N'));
    LogCallStep('log_hangup_act', IfThen(TMyCoaching.bCoaching, TMyCoaching.sIdCoaching, ''));
    LogCallStep('log_hangup_act', TMyInfoLogin.sIDSupervisor);
    LogCallStep('log_hangup_act', tmpEasy_pabx_fila_ctr_id);
    LogCallStep('log_hangup_act', tmpEasy_callcenter_classif_chamada_conf_id);
    LogCallStep('log_hangup_act', tmpEasy_callcenter_classif_sub_chamada_conf_id);
    LogCallStep('log_hangup_act', TMyAppStatus.sSipDialID);
    LogCallStep('log_hangup_act', tmpTelefone);
    LogCallStep('log_hangup_act', ')');

    LogCallStep('log_hangup_act', 'bClassificou: ' + BoolToStr(TMyClassificacao.bClassificou));
    LogCallStep('log_hangup_act', 'bXFerExec: ' + BoolToStr(TMyXFer.bXFerExec));
    LogCallStep('log_hangup_act', 'tmrPausaPos: ' + BoolToStr(frmprincipal.tmrPausaPos.Enabled));
    LogCallStep('log_hangup_act', 'tmrLastClassAuto: ' + BoolToStr(frmprincipal.tmrLastClassAuto.Enabled));
    LogCallStep('log_hangup_act', 'bClassificando: ' + BoolToStr(TMyClassificacao.bClassificando));
    LogCallStep('log_hangup_act', 'bAtendido: ' + BoolToStr(TMyAppStatus.bAtendido));

    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var1: ' + BoolToStr(TMyVaxIncomingCallParam.bAutoAnswer));
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var2: ' + BoolToStr(TMyVaxIncomingCallParam.bIncomingCall));
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var3: ' + TMyVaxIncomingCallParam.CallId);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var4: ' + TMyVaxIncomingCallParam.DisplayName);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var5: ' + TMyVaxIncomingCallParam.UserName);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var6: ' + TMyVaxIncomingCallParam.FromURI);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var7: ' + TMyVaxIncomingCallParam.ToURI);

    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var8: ' + TMyVaxIncomingCallParam.sProtocolo);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var9: ' + TMyVaxIncomingCallParam.sTipoOperacao);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var10: ' + TMyVaxIncomingCallParam.sTipoLigacao);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var11: ' + TMyVaxIncomingCallParam.sUniqueID);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var12: ' + TMyVaxIncomingCallParam.sFila);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var13: ' + TMyVaxIncomingCallParam.sFilaDSC);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var14: ' + TMyVaxIncomingCallParam.sCodTipo);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var15: ' + TMyVaxIncomingCallParam.sNomeLoja);

    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var16: ' + BoolToStr(TMyVaxIncomingCallParam.bSetAudioFromDB));
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var17: ' + IntToStr(TMyVaxIncomingCallParam.SetSpkVolume));
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var18: ' + IntToStr(TMyVaxIncomingCallParam.SetMicVolume));

    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var19: ' + TMyVaxIncomingCallParam.sRingFile);
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var20: ' + IntToStr(TMyVaxIncomingCallParam.nTotalDevices));
    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var21: ' + IntToStr(TMyVaxIncomingCallParam.nCurrentDevice));

    LogCallStep('log_hangup_act', 'TMyVaxIncomingCallParam.var22: ' + BoolToStr(TMyVaxIncomingCallParam.bRecord));

    Exit;
  end;

  //Verifica Preenchimento
  temp := '';
  if (cboClassifica.ItemIndex < 0) or (cboSubClassifica.ItemIndex < 0) then
  begin
    if cboClassifica.ItemIndex < 0 then
      temp := '- Classificação' + #13
    else
      temp := '- Sub Classificação' + #13
  end
  else
  begin
    //if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) <> '')) then
    //begin
    //end
    //else//Receptivo sem fila ou Ativo
    begin
      for nForFila := 0 to Agente.SQL.vnumfila-1 do
      begin
        if (matriz_fila[1, nForFila] = cboFila.Text) then
        begin
          tmpEasy_pabx_fila_ctr_id := matriz_fila[0, nForFila];

          for nForClas := 0 to Agente.SQL.vnumclass_fila-1 do
          begin
            if matrizclassifica_fila[2,nForClas] = matriz_fila[0,nForFila] then
            begin
              if matrizclassifica_fila[1, nForClas] = cboClassifica.Text then
              begin
                tmpEasy_callcenter_classif_chamada_conf_id := matrizclassifica_fila[0, nForClas];

                for nForAgd := 0 to Agente.SQL.vnumclasssub_fila -1 do
                begin
                  if matrizclassifica_fila[0, nForClas] = matrizclassificasub_fila[2, nForAgd] then
                  begin
                    if (matrizclassificasub_fila[1, nForAgd] = cboSubClassifica.Text) then
                    begin
                      tmpEasy_callcenter_classif_sub_chamada_conf_id := matrizclassificasub_fila[0, nForAgd];

                      if matrizclassificasub_fila[3, nForAgd] = 'False' then
                      begin
                        bFinalizadora := False;

                        if rdgAgenda.ItemIndex < 0 then
                          temp := APP_FRM_CLASSIFICATION_MB_SCHED_TYPE[ID_LANG];
                        if dteAgenda.Date = 0 then
                          temp := temp + APP_FRM_CLASSIFICATION_MB_SCHED_DATE[ID_LANG];
                        if (Trim(hraAgenda.Text) = '') or (hraAgenda.Text = '  :  ') then
                          temp := temp + APP_FRM_CLASSIFICATION_MB_SCHED_TIME[ID_LANG];
                      end;

                      if matrizclassificasub_fila[5, nForAgd] = 'True' then
                        bRedial := True;

                      Break;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  if temp <> ''  then
  begin
    frmprincipal.mensagem(APP_MB_WAR_PLEASE_FILL[ID_LANG] + temp);
    Exit;
  end;

  if bFinalizadora = False then
  begin
    if FormatDateTime('yyyy-mm-dd', dteAgenda.Date) < TMyInfoLogin.sDataLogin then
    begin
      frmprincipal.mensagem(APP_MB_WAR_PLEASE_FILL_CORRECT[ID_LANG]);
      Exit;
    end;

    if FormatDateTime('yyyy-mm-dd', dteAgenda.Date) = TMyInfoLogin.sDataLogin then
    begin
      if (hraAgenda.Text <= TMyInfoLogin.sHoraLogin) or (hraAgenda.Text <= FormatDateTime('hh:nn', Now)) then
      begin
        frmprincipal.mensagem(APP_MB_WAR_PLEASE_FILL_CORRECT[ID_LANG]);
        Exit;
      end;
    end;
  end;

// Rogério Teixeira
//  if TMyInfoLogin.bQualidadeChamada then
//    if TMyAppStatus.bAtendido then
//      if TMyAppStatus.nCallQuality = 0 then

  if TMyInfoLogin.bQualidadeChamada then
    if TMyAppStatus.nCallQuality = 0 then
    begin
      frmprincipal.mensagem(APP_MB_WAR_PLEASE_FILL_QUALITY[ID_LANG]);
      frmprincipal.actclientesExecute(self);
      TMyClassificacao.bClassificou := False;
      Exit;
    end;

// Rogério Teixeira
//  TMyAppStatus.bAtendido := False;
//  TMyAppStatus.bSainte := False;


  tmpAgendamento_tipo := '';
  tmpAgendamento_data := '';
  tmpAgendamento_hora := '';
  tmpTelefone := '';

  {for nForAgd := 0 to frmprincipal.vnumclasssub_fila-1 do
  begin
    if (matrizclassificasub_fila[1, nForAgd] = cboSubClassifica.Text) then
    begin
      if matrizclassificasub_fila[3, nForAgd] = 'False' then}
      if bFinalizadora = False then
      begin
        tmpAgendamento_tipo := copy(rdgAgenda.Items.Strings[rdgAgenda.ItemIndex], 1, 1);
        tmpAgendamento_data := formatdatetime('yyyy-mm-dd', dteAgenda.date);
        tmpAgendamento_hora := hraAgenda.Text;
      end;
      {Break;
    end;
  end;}

  {for nForCsf := 0 to Agente.SQL.vnumfila-1 do
  begin
    if (matriz_fila[1,nForCsf] = cboFila.Text) then
    begin
        tmpEasy_pabx_fila_ctr_id := matriz_fila[0, nForCsf];
        Break;
    end;
  end;

  for nForCsf := 0 to Agente.SQL.vnumclass_fila-1 do
  begin
    if (matrizclassifica_fila[1,nForCsf] = cboClassifica.Text) then
    begin
        tmpEasy_callcenter_classif_chamada_conf_id := matrizclassifica_fila[0, nForCsf];
        Break;
    end;
  end;

  for nForCsfS := 0 to frmprincipal.vnumclasssub_fila-1 do
  begin
    if (matrizclassificasub_fila[1,nForCsfS] = cboSubClassifica.Text) then
    begin
        tmpEasy_callcenter_classif_sub_chamada_conf_id := matrizclassificasub_fila[0, nForCsfS];
        Break;
    end;
  end;}

  {var sTempTel: String;
  if TMyAppStatus.sNumero[1] = '0' then
  begin
    sTempTel := TMyAppStatus.sNumero;
    Delete(sTempTel, 1, 1);
    tmpTelefone := '%' + sTempTel;
  end
  else}
  tmpTelefone := TMyAppStatus.sNumero;

  tmpTranscricao := '';
  try
    tmpTranscricao := frmPrincipal.memTranscricao.Text;
  except
    tmpTranscricao := APP_FRM_CLASSIFICATION_ERR_TRANSCRIPT[ID_LANG];
  end;

  tmpGravacaoVideoAct := 'N';
  tmpGravacaoVideoPath := '';
  if (TMyCaptureScreen.bCapture) and
     (TMyCaptureScreen.bCapturing) and
     (TMyCaptureScreen.nCaptureMode = CAPTURE_MODE_PHONE) then
  begin
    tmpGravacaoVideoAct := 'Y';
    tmpGravacaoVideoPath := TMyCaptureScreen.sCaptureStorageFile +
                            IntToStr(TMyCaptureScreen.nSplitStep) +
                            TMyCaptureScreen.sCaptureFileFormat;
  end;

  if (TMyAppStatus.sTipoChamada = 'Ativo') then//Chamada Ativa
  begin
    frmPrincipal.ClassificaChamadaAtiva(
                                        TMyAppStatus.nCallQuality,
                                        tmpTranscricao,
                                        tmpGravacaoVideoAct,
                                        tmpGravacaoVideoPath,
                                        memObs.Text,
                                        tmpAgendamento_tipo,
                                        tmpAgendamento_data,
                                        tmpAgendamento_hora,
                                        TimeToStr(TMyAppStatus.dtvFimChamada - TMyAppStatus.dtvInicioChamada),
                                        TimeToStr(TMyPausa.tTempoPausa),
                                        TimeToStr(TMyAppStatus.tTempoHoldTotal),
                                        IfThen(TMyXFer.bXFerExec, 'Y', 'N'),
                                        IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerTipo, ''),
                                        IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerDest, ''),
                                        IfThen(chkGravacao.Checked, 'Y', 'N'),
                                        'N',
                                        '',
                                        TMyAppStatus.sSipDialStatus,
                                        IfThen(TMyPausa.bPausado, '1', '0'),
                                        IfThen(TMyCoaching.bCoaching, 'Y', 'N'),
                                        IfThen(TMyCoaching.bCoaching, TMyCoaching.sIdCoaching, ''),
                                        TMyInfoLogin.sIDSupervisor,
                                        tmpEasy_pabx_fila_ctr_id,
                                        tmpEasy_callcenter_classif_chamada_conf_id,
                                        tmpEasy_callcenter_classif_sub_chamada_conf_id,
                                        TMyAppStatus.sSipDialID,
                                        tmpTelefone
    );
  end//if (TMyAppStatus.sTipoChamada = 'Ativo') then
  else
    if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) = '')) then//Chamada Receptiva DDR
    begin
      frmPrincipal.ClassificaChamadaReceptiva(
                                          TMyAppStatus.nCallQuality,
                                          tmpTranscricao,
                                          tmpGravacaoVideoAct,
                                          tmpGravacaoVideoPath,
                                          memObs.Text,
                                          tmpAgendamento_tipo,
                                          tmpAgendamento_data,
                                          tmpAgendamento_hora,
                                          TimeToStr(TMyAppStatus.dtvFimChamada - TMyAppStatus.dtvInicioChamada),
                                          TimeToStr(TMyPausa.tTempoPausa),
                                          TimeToStr(TMyAppStatus.tTempoHoldTotal),
                                          IfThen(TMyXFer.bXFerExec, 'Y', 'N'),
                                          IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerTipo, ''),
                                          IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerDest, ''),
                                          IfThen(chkGravacao.Checked, 'Y', 'N'),
                                          'N',
                                          '',
                                          IfThen(TMyCoaching.bCoaching, 'Y', 'N'),
                                          IfThen(TMyCoaching.bCoaching, TMyCoaching.sIdCoaching, ''),
                                          TMyInfoLogin.sIDSupervisor,
                                          tmpEasy_pabx_fila_ctr_id,
                                          tmpEasy_callcenter_classif_chamada_conf_id,
                                          tmpEasy_callcenter_classif_sub_chamada_conf_id,
                                          TMyVaxIncomingCallParam.sTipoOperacao,//Old -> '4',
                                          TMyVaxIncomingCallParam.sCampo[1],
                                          TMyVaxIncomingCallParam.sCampo[2],
                                          TMyVaxIncomingCallParam.sCampo[3],
                                          TMyVaxIncomingCallParam.sCampo[4],
                                          TMyVaxIncomingCallParam.sCampo[5],
                                          TMyVaxIncomingCallParam.sCampo[6],
                                          TMyVaxIncomingCallParam.sCampo[7],
                                          TMyVaxIncomingCallParam.sCampo[8],
                                          TMyVaxIncomingCallParam.sCampo[9],
                                          TMyVaxIncomingCallParam.sCampo[10]
      );
    end//if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) = '')) then
    else
      if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) <> '')) then//Chamada Receptiva Fila
      begin
        frmPrincipal.ClassificaChamadaReceptiva(
                                            TMyAppStatus.nCallQuality,
                                            tmpTranscricao,
                                            tmpGravacaoVideoAct,
                                            tmpGravacaoVideoPath,
                                            memObs.Text,
                                            tmpAgendamento_tipo,
                                            tmpAgendamento_data,
                                            tmpAgendamento_hora,
                                            TimeToStr(TMyAppStatus.dtvFimChamada - TMyAppStatus.dtvInicioChamada),
                                            TimeToStr(TMyPausa.tTempoPausa),
                                            TimeToStr(TMyAppStatus.tTempoHoldTotal),
                                            IfThen(TMyXFer.bXFerExec, 'Y', 'N'),
                                            IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerTipo, ''),
                                            IfThen(TMyXFer.bXFerExec, TMyXFer.sXFerDest, ''),
                                            IfThen(chkGravacao.Checked, 'Y', 'N'),
                                            'N',
                                            '',
                                            IfThen(TMyCoaching.bCoaching, 'Y', 'N'),
                                            IfThen(TMyCoaching.bCoaching, TMyCoaching.sIdCoaching, ''),
                                            TMyInfoLogin.sIDSupervisor,
                                            tmpEasy_pabx_fila_ctr_id,
                                            tmpEasy_callcenter_classif_chamada_conf_id,
                                            tmpEasy_callcenter_classif_sub_chamada_conf_id,
                                            TMyVaxIncomingCallParam.sTipoOperacao,
                                            TMyVaxIncomingCallParam.sCampo[1],
                                            TMyVaxIncomingCallParam.sCampo[2],
                                            TMyVaxIncomingCallParam.sCampo[3],
                                            TMyVaxIncomingCallParam.sCampo[4],
                                            TMyVaxIncomingCallParam.sCampo[5],
                                            TMyVaxIncomingCallParam.sCampo[6],
                                            TMyVaxIncomingCallParam.sCampo[7],
                                            TMyVaxIncomingCallParam.sCampo[8],
                                            TMyVaxIncomingCallParam.sCampo[9],
                                            TMyVaxIncomingCallParam.sCampo[10]
        );
      end;

  TMyClassificacao.bClassificou := True;
  TMyXFer.bXFerExec := False;
  frmprincipal.memTranscricao.Lines.Clear;
  frmprincipal.ClearImgCallQuality(False);
  frmprincipal.tmrPausaPos.Enabled := False;
  frmprincipal.tmrLastClassAuto.Enabled := False;
  TMyClassificacao.bClassificando := False;

  if TMyAppStatus.bAtendido = False then
  begin
    if chkLogoff.Checked then
    begin
      frmPrincipal.actlogoffExecute(Nil);
      TMyAppStatus.bPodeFechar := True;
      frmPrincipal.Close;
      Exit;
    end;

    if bRedial then
    begin
      TMyPausa.bLastCallRedial := True;
      TMyPausa.bAtivoPausa := True; //Permite discar mesmo estando em pausa pos atendimento...

      with frmPrincipal do
      begin
        framebar.OpenItem(2,true);

        browseragenda.Stop;
        browsercliente.Stop;

        try
          if tabCliente.Tag = 0 then
            browsercliente.Navigate('about:blank');
          browseragenda.Navigate('about:blank');
          browserscript.Navigate('about:blank');
          //browserchat.Navigate('about:blank');
          //browseremail.Navigate('about:blank');
          browserfax.Navigate('about:blank');
          browsersms.Navigate('about:blank');
          browserpesquisa.Navigate('about:blank');
          browserajuda.Navigate('about:blank');

          tabcliente.TabVisible := false;
          tabagenda.TabVisible := false;
          tabscript.TabVisible := false;
          //tabchat.TabVisible := false;
          tabChatHist.TabVisible := False;
          //tabFAQ.TabVisible := False;
          tabemail.TabVisible := false;
          tabfax.TabVisible := false;
          tabsms.TabVisible := false;
          tabpesquisa.TabVisible := false;
          tabajuda.TabVisible := false;
          tabConferencia.TabVisible := False;
        except
        end;
      end;

      frmPrincipal.framebar.OpenItem(0, True);
      if Length(tmpTelefone) >= 16 then
        Tfrmdialpad(frmPrincipal.framebar.items[0].frame).cboAtivo.Text := tmpTelefone
      else
      begin
        if Trim(TMyVaxIncomingCallParam.sUniqueID) = '' then
          Tfrmdialpad(frmPrincipal.framebar.items[0].frame).cboAtivo.Text := '00000000000' +
                                                                             '0' +
                                                                             tmpTelefone
        else
          Tfrmdialpad(frmPrincipal.framebar.items[0].frame).cboAtivo.Text := TMyVaxIncomingCallParam.sUniqueID +
                                                                             '0' +
                                                                             tmpTelefone;
      end;
      Tfrmdialpad(frmPrincipal.framebar.items[0].frame).btnLigaClick(Self);
    end
    else
    begin
      if chkPausar.Checked then
      begin
        for nForInd := 0 to Agente.SQL.sVNumPausa-1 do
        begin
          if matrizpausa[0,nForInd] = '10002' then//if matrizpausa[1,nForInd] = APP_PAUSE_TYPE_AFTER_HU[ID_LANG] then
          begin
            if matrizparametros[2] = 'True' then
            begin
              frmprincipal.tmrVerificaTrocaPausa.Enabled := False;
              frmprincipal.tmrVerificaTrocaPausa.Interval := StrToInt(matrizparametros[3])*1000;
              frmprincipal.tmrVerificaTrocaPausa.Enabled := True;
            end;
          end;
        end;

        TMyPausa.bTrocandoPausa := True;
        TMyAppStatus.sTipoEvento := APP_EVENT_TYPE_CHANGEPAUSE[ID_LANG];
        frmprincipal.framebar.OpenItem(2,true);
      end
      else
      begin
        if TMyPausa.bLastCallRedial then
        begin
          TMyPausa.bLastCallRedial := False;
          TMyPausa.bDiscouPausa := False; //Reseta variavel de controle!
        end;

        frmprincipal.despausapos;
      end;
    end;
  end
  else
  begin
    //frmprincipal.framebar.closeItem(4, True);
    frmprincipal.gravaarq('err0', 'Verificar, nao executou despausapos');
  end;

  TMyAppStatus.dtvInicioChamada := Now;
  TMyAppStatus.dtvFimChamada := Now;
  TMyAppStatus.sSipDialID := '0';

  if Agente.EquipeHrTrab.NaoFazNada then
  begin
    if Assigned(frmPrincipal.Vax) then frmPrincipal.Vax.UnInitialize();
    MessageDlg('O Tempo limite do agente foi ultrapassado, portanto o sistema será concluido' ,mtError,[mbOk],0);
    frmPrincipal.actlogoffExecute(Sender);
    Application.Terminate;
    Exit;
  end;
end;

procedure Tfrmclassifica.CarregaClassificacao;
var
  ind: integer;
begin
  TMyClassificacao.bClassificando := True;

  cboFila.Items.Clear;

  if ((TMyAppStatus.sTipoChamada = 'Ativo') or
      ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) = ''))) then//Chamada Receptiva DDR
  begin
    for ind := 0 to Agente.SQL.vnumfila-1 do
      cboFila.Items.Add(matriz_fila[1,ind]);

    cboFila.Enabled := True;
  end
  else
  begin//Chamada Receptiva Fila
    for ind := 0 to Agente.SQL.vnumfila-1 do
      if matriz_fila[0,ind] = TMyVaxIncomingCallParam.sFila then
      begin
        cboFila.Items.Add(matriz_fila[1,ind]);
        cboFila.ItemIndex := 0;
        cboFila.Enabled := False;
        cboFilaChange(Self);
        Break;
      end;
  end;
end;

procedure Tfrmclassifica.CarregaTelasLinguagem;
begin
  grpFila.Caption := APP_FRM_CLASSIFICATION_QUEUE[ID_LANG];

  grpClassificacao.Caption := APP_FRM_CLASSIFICATION_CLASSIFICATION[ID_LANG];
  lblSubClass.Caption := APP_FRM_CLASSIFICATION_SUB_CLASS[ID_LANG];
  lblObservacao.Caption := APP_FRM_CLASSIFICATION_OBSERVATION[ID_LANG];
  pnlAgenda.Caption := APP_FRM_CLASSIFICATION_SCHEDULE[ID_LANG];

  rdgAgenda.Caption := APP_FRM_CLASSIFICATION_TYPE[ID_LANG];
  rdgAgenda.Items.Clear;
  rdgAgenda.Items.Add(APP_FRM_CLASSIFICATION_SPECIFIC[ID_LANG]);
  rdgAgenda.Items.Add(APP_FRM_CLASSIFICATION_GENERIC[ID_LANG]);

  lblData.Caption := APP_FRM_CLASSIFICATION_DATE[ID_LANG];
  lblHora.Caption := APP_FRM_CLASSIFICATION_HOUR[ID_LANG];
  chkGravacao.Caption := APP_FRM_CLASSIFICATION_ASK_RECORDING[ID_LANG];
  chkPausar.Caption := APP_FRM_CLASSIFICATION_GOTO_PAUSE[ID_LANG];
  chkLogoff.Caption := APP_FRM_CLASSIFICATION_GOTO_LOGOFF[ID_LANG];

  cmdSalvar.Caption := APP_FRM_CLASSIFICATION_SAVE[ID_LANG];

  grpClassificacao.Enabled := False;
  cboSubClassifica.Enabled := False;
  pnlAgenda.Enabled := False;
  chkGravacao.Enabled := False;
  chkPausar.Enabled := False;
  chkLogoff.Enabled := False;
  cmdSalvar.Enabled := False;
end;

procedure Tfrmclassifica.cboClassificaChange(Sender: TObject);
var
  nFor: Integer;
  nForSub: Integer;
begin
  pnlAgenda.enabled := false;
  dteAgenda.Date := 0;
  dteAgenda.Text := '  /  /    ';
  hraAgenda.Text := '';

  cboSubClassifica.Items.Clear;
  cboSubClassifica.ItemIndex := -1;
  cboSubClassifica.Text := APP_FRM_CLASSIFICATION_SELECTSUBCLASS[ID_LANG];

  for nFor := 0 to Agente.SQL.vnumclass_fila-1 do
  begin
    if matrizclassifica_fila[1, nFor] = cboClassifica.Text then
    begin
      for nForSub := 0 to Agente.SQL.vnumclasssub_fila-1 do
      begin
        if matrizclassifica_fila[0, nFor] = matrizclassificasub_fila[2, nForSub] then
        begin
          cboSubClassifica.Items.Add(matrizclassificasub_fila[1, nForSub]);
        end;
      end;
      break;
    end;
  end;

  if cboSubClassifica.Items.Count > 0 then
  begin
    cboSubClassifica.Enabled := True;
    //pnlAgenda.Enabled := True;
    chkGravacao.Enabled := True;
    chkPausar.Enabled := True;
    chkLogoff.Enabled := True;
    cmdSalvar.Enabled := True;
  end;
end;

procedure Tfrmclassifica.cboFilaChange(Sender: TObject);
var
  ind: Integer;
  nForFila: Integer;
begin
  cboClassifica.Items.Clear;

  if (cboFila.ItemIndex >= 0) then
  begin
    for nForFila := 0 to Agente.SQL.vnumfila-1 do
    begin
      if (matriz_fila[1,nForFila] = cboFila.Text) then
      begin
        for ind := 0 to Agente.SQL.vnumclass_fila-1 do
          if matrizclassifica_fila[2,ind] = matriz_fila[0,nForFila] then
            cboClassifica.Items.Add(matrizclassifica_fila[1,ind]);
      end;
    end;
  end;

  if cboClassifica.Items.Count > 0 then
  begin
    grpClassificacao.Enabled := True;
  end;

  if TMyPausa.bDiscouPausa then
    chkPausar.Enabled := False
  else
    chkPausar.Enabled := True
end;

procedure Tfrmclassifica.cboSubClassificaChange(Sender: TObject);
var
  nForFila: Integer;
  nForClas: Integer;
  nForAgd: Integer;
begin
  //if ((TMyAppStatus.sTipoChamada = 'Receptivo') and (Trim(TMyVaxIncomingCallParam.sFila) <> '')) then
  //begin

  for nForFila := 0 to Agente.SQL.vnumfila-1 do
  begin
    if (matriz_fila[1, nForFila] = cboFila.Text) then
    begin
      for nForClas := 0 to Agente.SQL.vnumclass_fila-1 do
      begin
        if matrizclassifica_fila[2,nForClas] = matriz_fila[0,nForFila] then
        begin
          if matrizclassifica_fila[1, nForClas] = cboClassifica.Text then
          begin
            for nForAgd := 0 to Agente.SQL.vnumclasssub_fila-1 do
            begin
              if matrizclassifica_fila[0, nForClas] = matrizclassificasub_fila[2, nForAgd] then
              begin
                if (matrizclassificasub_fila[1, nForAgd] = cboSubClassifica.Text) then
                begin
                  if matrizclassificasub_fila[3, nForAgd] = 'True' then
                  begin
                    pnlAgenda.Enabled := False;
                    dteAgenda.Date := 0;
                    dteAgenda.Text := '  /  /    ';
                    hraAgenda.Text := '';
                  end
                  else
                  begin
                    pnlAgenda.Enabled := True;
                    dteAgenda.Date := StrToDateFmt('dd-mm-yyyy', matrizclassificasub_fila[4, nForAgd]);
                    hraAgenda.Text := FormatDateTime('hh:nn', IncHour(Now, 1));
                  end;
                  break;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  //end
  //else//Receptivo sem fila ou Ativo
  //begin
    //nothing to do
  //end;
end;

end.
