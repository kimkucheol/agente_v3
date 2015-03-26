unit untfrmdialpad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton,
  sLabel, sEdit, sComboBox, sCheckBox, Vcl.ComCtrls, sTrackBar, Vcl.ExtCtrls,
  sPanel, inifiles, acPNG, Vcl.ImgList, ClipBrd;

type
  TfrmDialPad = class(TFrame)
    panDial: TsPanel;
    lblNumero: TsLabel;
    cmdDial1: TsButton;
    cmdDial2: TsButton;
    cmdDial3: TsButton;
    cmdDial4: TsButton;
    cmdDial5: TsButton;
    cmdDial6: TsButton;
    cmdDial7: TsButton;
    cmdDial8: TsButton;
    cmdDial9: TsButton;
    cmdDialAst: TsButton;
    cmdDial0: TsButton;
    cmdDialTralha: TsButton;
    btnLiga: TsButton;
    tbvolumeout: TsTrackBar;
    tbvolumein: TsTrackBar;
    cboMudo: TsCheckBox;
    Image1: TImage;
    Image2: TImage;
    ImageList1: TImageList;
    cboHold: TsCheckBox;
    cboCentroCusto: TsComboBox;
    cboAtivo: TsComboBox;
    lblConfAudio: TsWebLabel;
    procedure enviadigito(vnumdigito: string);
    procedure CarregaTelasLinguagem;
    procedure CarregaCentroCusto;
    procedure cmdDial1Click(Sender: TObject);
    procedure cmdDial2Click(Sender: TObject);
    procedure cmdDial3Click(Sender: TObject);
    procedure cmdDial4Click(Sender: TObject);
    procedure cmdDial5Click(Sender: TObject);
    procedure cmdDial6Click(Sender: TObject);
    procedure cmdDial7Click(Sender: TObject);
    procedure cmdDial8Click(Sender: TObject);
    procedure cmdDial9Click(Sender: TObject);
    procedure cmdDialAstClick(Sender: TObject);
    procedure cmdDial0Click(Sender: TObject);
    procedure cmdDialTralhaClick(Sender: TObject);
    procedure btnLigaClick(Sender: TObject);
    procedure cboMudoClick(Sender: TObject);
    procedure tbvolumeinChange(Sender: TObject);
    procedure tbvolumeoutChange(Sender: TObject);
    procedure cboHoldClick(Sender: TObject);
    procedure cboAtivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure cboAtivoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboAtivoChange(Sender: TObject);
    procedure lblConfAudioClick(Sender: TObject);
  private
   varqini: tinifile;
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitaDialPad(Habilitado: Boolean);
  end;

var
  frmDialPad: TfrmDialPad;

implementation

{$R *.dfm}

uses untPrincipal, unttranslate, untfrmRingPopup, untfrmConfAudio;

procedure TfrmDialPad.btnLigaClick(Sender: TObject);
var
  sCentroCustoTemp: String;
  nFor: Integer;
  sDialStrTmp: String;
begin
  if btnLiga.Caption = APP_FRM_DIALPAD_PICKUP[ID_LANG] then
  begin
    if (frmPrincipal.TMyVaxIncomingCallParam.bAutoAnswer = False) and
       (frmPrincipal.TMyVaxIncomingCallParam.bIncomingCall = True) then
    begin
      frmPrincipal.AtivaFlashWindow(False);
      frmPrincipal.AtendeChamada;

      frmPrincipal.TMyVaxIncomingCallParam.nTotalDevices := 0;
      frmPrincipal.tmrAudioRing.Enabled := False;
      try
        frmPrincipal.wavAudioRing.Notify := False;
      except
      end;

      try
        frmRingPopup.Hide;
      except
      end;
    end;
  end
  else
  begin
    if Trim(cboAtivo.Text) = '' then
      Exit;

    try
      for nFor := 9 downto 1 do
        frmPrincipal.matrizdialednums[nFor] := frmPrincipal.matrizdialednums[nFor - 1];
      frmPrincipal.matrizdialednums[0] := cboAtivo.Text;
    except
    end;

    try
      cboAtivo.Clear;
      for nFor := 0 to 9 do
        cboAtivo.Items.Add(frmPrincipal.matrizdialednums[nFor]);
      cboAtivo.Text := frmPrincipal.matrizdialednums[0];
    except
    end;

    sDialStrTmp := Trim(cboAtivo.Text);
    if (sDialStrTmp[1] = '0') or (Length(sDialStrTmp) > 5) then
      if cboCentroCusto.ItemIndex = -1 then
        Exit;

    if ((frmprincipal.TMyAppStatus.sTipoEvento <> APP_EVENT_TYPE_PAUSE[ID_LANG]) or (frmprincipal.TMyAppStatus.bAtendido = true)) or
       ((frmprincipal.TMyAppStatus.sTipoEvento = APP_EVENT_TYPE_PAUSE[ID_LANG]) and (frmprincipal.TMyPausa.bAtivoPausa = true)) then
    begin
      sCentroCustoTemp := '';

      for nFor := 0 to frmprincipal.vnumcentrocusto-1 do
        if (frmprincipal.matrizcentrocusto[1, nFor] = cboCentroCusto.Text) then
        begin
          sCentroCustoTemp := frmprincipal.matrizcentrocusto[0, nFor];
          Break;
        end;

      frmprincipal.ligar(sCentroCustoTemp+'0'+frmprincipal.TMyInfoLogin.sIDUsuario+'0'+cboAtivo.Text);
      frmprincipal.TMyAppStatus.sNumero := cboAtivo.text;
      try
        frmprincipal.framebar.SetFocus;
      except
        try
          frmprincipal.edtbrowser.SetFocus;
        except
        end;
      end;

      if (frmprincipal.TMyAppStatus.sTipoEvento = APP_EVENT_TYPE_PAUSE[ID_LANG]) and (frmprincipal.TMyPausa.bAtivoPausa = true) then
      begin
        frmprincipal.TMyPausa.bDiscouPausa := true;
      end
      else
      begin
        frmprincipal.TMyPausa.bDiscouPausa := false;
      end;
    end
    else
    begin
      frmprincipal.mensagem(APP_MB_ERR_CANNOT_DIAL[ID_LANG]);
    end;
  end;
end;

procedure TfrmDialPad.cboAtivoChange(Sender: TObject);
var
  n: Integer;
begin
  if cboAtivo.Text <> '' then
  begin
    cboAtivo.Text := StringReplace(cboAtivo.Text, ' ', '', [rfReplaceAll,rfIgnoreCase]);

    for n := 1 to Length(cboAtivo.Text) do
    begin
      if (CharInSet(cboAtivo.Text[n], ['0'..'9']) = false) and (cboAtivo.Text[n] <> '*') and (cboAtivo.Text[n] <> '#') then
      begin
        cboAtivo.Text := '';
        break;
      end;
    end;
  end;
end;

procedure TfrmDialPad.cboAtivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if word(key) = vk_delete then
  begin
    cboAtivo.clear;
  end;
end;

procedure TfrmDialPad.cboAtivoKeyPress(Sender: TObject; var Key: Char);
var
  n: Integer;
begin
  if (word(key) = 22) then
  begin
    if Clipboard.HasFormat(CF_TEXT) then
    begin
      Clipboard.AsText := StringReplace(Clipboard.AsText, ' ', '', [rfReplaceAll,rfIgnoreCase]);

      for n := 1 to Length(Clipboard.AsText) do
      begin
        if (CharInSet(Clipboard.AsText[n], ['0'..'9']) = false) and (Clipboard.AsText[n] <> '*') and (Clipboard.AsText[n] <> '#') then
        begin
          Key := #0;
          break;
        end;
      end;
    end
    else
      Key := #0;
  end
  else
    if word(key) = vk_return then
    begin
      btnLigaclick(self);
    end
    else
      if word(key) = vk_delete then
      begin
        cboAtivo.clear;
      end
      else
        //if ((Key in ['0'..'9'] = false) and (Word(Key) <> VK_BACK)) and (key <> '*') and (key <> '#') then
        if ((CharInSet(Key, ['0'..'9']) = false) and (Word(Key) <> VK_BACK)) and (key <> '*') and (key <> '#') then
        begin
          Key := #0;
        end
        else
          //if (Key in ['0'..'9'] = true) or (key = '*') or (key = '#') then
          if (CharInSet(Key, ['0'..'9']) = true) or (key = '*') or (key = '#') then
          begin
            frmprincipal.Vax.DigitDTMF(0, key);
          end;
end;

procedure TfrmDialPad.cboAtivoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if key = VK_RETURN then
  //begin
    //btligaClick(Nil);
  //end;
end;

procedure TfrmDialPad.cboHoldClick(Sender: TObject);
begin
  if cboHold.Checked = true then
  begin
    frmprincipal.vax.HoldLine(0);
    frmprincipal.TMyAppStatus.tTempoHoldIni := time;
  end
  else
  begin
    frmprincipal.vax.UnHoldLine(0);
    frmprincipal.TMyAppStatus.tTempoHoldFim := time-frmprincipal.TMyAppStatus.tTempoHoldIni;
    frmprincipal.TMyAppStatus.tTempoHoldTotal := frmprincipal.TMyAppStatus.tTempoHoldTotal + frmprincipal.TMyAppStatus.tTempoHoldFim;
  end;

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.WriteBool('Controle','Hold',cboHold.Checked);
  varqini.free;
end;

procedure TfrmDialPad.cboMudoClick(Sender: TObject);
begin
  frmprincipal.vax.MuteMic(cboMudo.checked);
  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.WriteBool('Controle','Mudo',cboMudo.Checked);
  varqini.free;
end;

procedure TfrmDialPad.enviadigito(vnumdigito: string);
begin
  cboAtivo.Text := cboAtivo.Text + vnumdigito;
  frmprincipal.vax.DigitDTMF(0, vnumdigito);

  if frmPrincipal.TMyConfCallClass.bInConfCall then
    frmprincipal.vax.DigitDTMF(1, vnumdigito);
end;

procedure TfrmDialPad.CarregaTelasLinguagem;
var
  nFor: Integer;
begin
  btnLiga.Caption := APP_FRM_DIALPAD_DIAL[ID_LANG];
  btnLiga.Enabled := frmPrincipal.TMyInfoLogin.bDialPad;
  lblNumero.Caption := APP_FRM_DIALPAD_NUMBER[ID_LANG];
  cboMudo.Caption := APP_FRM_DIALPAD_MUTE[ID_LANG];
  cboHold.Caption := APP_FRM_DIALPAD_HOLD[ID_LANG];
  lblConfAudio.Caption := APP_FRM_DIALPAD_CAUDIO[ID_LANG];
  //cboDnd.Caption := APP_FRM_DIALPAD_DND[ID_LANG];

  try
    cboAtivo.Clear;
    for nFor := 0 to 9 do
      cboAtivo.Items.Add(frmPrincipal.matrizdialednums[nFor]);
  except
  end;
end;

procedure TfrmDialPad.CarregaCentroCusto;
var
  ind: Integer;
begin
  cboCentroCusto.Items.Clear;

  if frmprincipal.TMyInfoLogin.bRotaInteligente then
  begin
    cboCentroCusto.Items.Add(frmprincipal.matrizcentrocusto[1,0]);
    cboCentroCusto.Enabled := False;
    cboCentroCusto.ItemIndex := 0;
  end
  else
  begin
    for ind := 0 to frmprincipal.vnumcentrocusto-1 do
    begin
      cboCentroCusto.Items.Add(frmprincipal.matrizcentrocusto[1,ind]);
    end;

    if frmprincipal.vnumcentrocusto = 1 then
    begin
      try
        cboCentroCusto.ItemIndex := 0;
        cboCentroCusto.Enabled := False;
      except
        cboCentroCusto.Enabled := True;
      end;
    end
    else
      cboCentroCusto.Enabled := True;
  end;
end;

procedure TfrmDialPad.cmdDialAstClick(Sender: TObject);
begin
  enviadigito('*');
end;

procedure TfrmDialPad.cmdDial0Click(Sender: TObject);
begin
  enviadigito('0');
end;

procedure TfrmDialPad.cmdDialTralhaClick(Sender: TObject);
begin
  enviadigito('#');
end;

procedure TfrmDialPad.cmdDial1Click(Sender: TObject);
begin
  enviadigito('1');
end;

procedure TfrmDialPad.cmdDial2Click(Sender: TObject);
begin
  enviadigito('2');
end;

procedure TfrmDialPad.cmdDial3Click(Sender: TObject);
begin
  enviadigito('3');
end;

procedure TfrmDialPad.cmdDial4Click(Sender: TObject);
begin
  enviadigito('4');
end;

procedure TfrmDialPad.cmdDial5Click(Sender: TObject);
begin
  enviadigito('5');
end;

procedure TfrmDialPad.cmdDial6Click(Sender: TObject);
begin
  enviadigito('6');
end;

procedure TfrmDialPad.cmdDial7Click(Sender: TObject);
begin
  enviadigito('7');
end;

procedure TfrmDialPad.cmdDial8Click(Sender: TObject);
begin
  enviadigito('8');
end;

procedure TfrmDialPad.cmdDial9Click(Sender: TObject);
begin
  enviadigito('9');
end;

procedure TfrmDialPad.tbvolumeinChange(Sender: TObject);
begin
  frmprincipal.Vax.SetSpkVolume((10 - tbvolumein.Position) * 25);

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.Writeinteger('Controle','volumein',tbvolumein.Position);
  varqini.free;
end;

procedure TfrmDialPad.tbvolumeoutChange(Sender: TObject);
begin
  frmprincipal.Vax.SetMicVolume((10 - tbvolumeout.Position) * 25);

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.Writeinteger('Controle','volumeout',tbvolumeout.Position);
  varqini.free;
end;

procedure TfrmDialPad.HabilitaDialPad(Habilitado: Boolean);
begin
  try
    cmdDial0.Enabled := Habilitado;
    cmdDial1.Enabled := Habilitado;
    cmdDial2.Enabled := Habilitado;
    cmdDial3.Enabled := Habilitado;
    cmdDial4.Enabled := Habilitado;
    cmdDial5.Enabled := Habilitado;
    cmdDial6.Enabled := Habilitado;
    cmdDial7.Enabled := Habilitado;
    cmdDial8.Enabled := Habilitado;
    cmdDial9.Enabled := Habilitado;
    cmdDialAst.Enabled := Habilitado;
    cmdDialTralha.Enabled := Habilitado;
    btnLiga.Enabled := Habilitado;
    lblNumero.Enabled := Habilitado;
    cboAtivo.Enabled := Habilitado;
    cboCentroCusto.Enabled := Habilitado;
  except
  end;
end;

procedure TfrmDialPad.lblConfAudioClick(Sender: TObject);
begin
  frmConfAudio.ShowModal;
end;

end.