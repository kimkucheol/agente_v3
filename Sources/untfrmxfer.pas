unit untfrmxfer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton,
  Vcl.ExtCtrls, sLabel, sComboBox, Vcl.ComCtrls, sTabControl, RotinasGerais;

type
  TfrmXFer = class(TFrame)
    tabXFer: TsTabControl;
    btnXFer: TsButton;
    cboXFer: TsComboBox;
    lblSelecioneXFer: TsLabel;
    procedure btnXFerClick(Sender: TObject);
    procedure carregaxfer;
    procedure CarregaTelasLinguagem;
    procedure tabXFerChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXFer: TfrmXFer;

implementation

uses untPrincipal, unttranslate;

{$R *.dfm}

{$I C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\Lang\defines.inc}

procedure TfrmXFer.btnXFerClick(Sender: TObject);
var
  nForXfer: integer;
begin
  if cboXFer.text = '' then
  begin
    application.MessageBox(PChar(APP_MB_WAR_SELECT_XFER[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
  end
  else
  begin
    if frmprincipal.TMyAppStatus.bAtendido = true then
    begin
      case tabxfer.TabIndex of
        0:
        for nForXfer := 0 to frmprincipal.vnumxferfila-1 do
        begin
          if (frmprincipal.matrizxferfila[1,nForXfer] = cboXFer.text) then
          begin
            frmprincipal.vax.TransferCallEx(0, '48' + frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxferfila[0,nForXfer] + frmPrincipal.TMyVaxIncomingCallParam.sCodTipo + frmprincipal.TMyAppStatus.sNumero);
            frmprincipal.LogCallStep('log_xfer_act', '48' + frmprincipal.matrizxferfila[0,nForXfer]);
            frmprincipal.TMyXFer.bXFerExec := True;
            frmprincipal.TMyXFer.sXFerTipo := 'Fila';
            frmprincipal.TMyXFer.sXFerDest := frmprincipal.matrizxferfila[0,nForXfer];
            break;
          end;
        end;

        1:
        begin
          for nForXfer := 0 to frmprincipal.vnumxferura-1 do
          begin
            if (frmprincipal.matrizxferura[1,nForXfer] = cboXFer.text) then
            begin
              frmprincipal.vax.TransferCallEx(0, '58' + frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxferura[0,nForXfer] + frmPrincipal.TMyVaxIncomingCallParam.sCodTipo + frmprincipal.TMyAppStatus.sNumero);
              frmprincipal.LogCallStep('log_xfer_act', '58' + frmprincipal.matrizxferura[0,nForXfer]);
              frmprincipal.TMyXFer.bXFerExec := True;
              frmprincipal.TMyXFer.sXFerTipo := 'Ura';
              frmprincipal.TMyXFer.sXFerDest := frmprincipal.matrizxferura[0,nForXfer];
              break;
            end;
          end;
        end;

        2:
        begin
          for nForXfer := 0 to frmprincipal.vnumxferramal-1 do
          begin
            if (frmprincipal.matrizxferramal[1,nForXfer] = cboXFer.text) then
            begin
              if btnXFer.Caption = APP_FRM_XFER_XFER1[ID_LANG] then
                frmprincipal.ExecutaXFerAssistida(0, 1)
              else
              begin
                //frmprincipal.CriaXFerAssistida(1, 68, frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxferramal[0,nForXfer] + frmprincipal.TMyAppStatus.sNumero);
                frmprincipal.vax.TransferCallEx(0, '68' + frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxferramal[0,nForXfer] + frmPrincipal.TMyVaxIncomingCallParam.sCodTipo + frmprincipal.TMyAppStatus.sNumero);
                frmprincipal.LogCallStep('log_xfer_act', '68' + frmprincipal.matrizxferramal[0,nForXfer]);
                frmprincipal.TMyXFer.bXFerExec := True;
                frmprincipal.TMyXFer.sXFerTipo := 'Ramal';
                frmprincipal.TMyXFer.sXFerDest := frmprincipal.matrizxferramal[0,nForXfer];
              end;
              break;
            end;
          end;
        end;

        3:
        begin
          for nForXfer := 0 to frmprincipal.vnumxferpesquisa-1 do
          begin
            if (frmprincipal.matrizxferpesquisa[1,nForXfer] = cboXFer.text) then
            begin
              frmprincipal.vax.TransferCallEx(0, '78' + frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxferpesquisa[0,nForXfer] + frmPrincipal.TMyVaxIncomingCallParam.sCodTipo + frmprincipal.TMyAppStatus.sNumero);
              frmprincipal.LogCallStep('log_xfer_act', '78' + frmprincipal.matrizxferpesquisa[0,nForXfer]);
              frmprincipal.TMyXFer.bXFerExec := True;
              frmprincipal.TMyXFer.sXFerTipo := 'Pesquisa';
              frmprincipal.TMyXFer.sXFerDest := frmprincipal.matrizxferpesquisa[0,nForXfer];
              break;
            end;
          end;
        end;

        4:
        begin
          for nForXfer := 0 to frmprincipal.vnumxfervirtual-1 do
          begin
            if (frmprincipal.matrizxfervirtual[1,nForXfer] = cboXFer.text) then
            begin
              frmprincipal.vax.TransferCallEx(0, '88' + frmPrincipal.TMyInfoLogin.sRamal + frmprincipal.matrizxfervirtual[0,nForXfer] + frmPrincipal.TMyVaxIncomingCallParam.sCodTipo + frmprincipal.TMyAppStatus.sNumero);
              frmprincipal.LogCallStep('log_xfer_act', '88' + frmprincipal.matrizxfervirtual[0,nForXfer]);
              frmprincipal.TMyXFer.bXFerExec := True;
              frmprincipal.TMyXFer.sXFerTipo := 'Virtual';
              frmprincipal.TMyXFer.sXFerDest := frmprincipal.matrizxfervirtual[0,nForXfer];
              break;
            end;
          end;
        end;

        5:
        begin
          for nForXfer := 0 to frmprincipal.vnumxferconsulta-1 do
          begin
            if (frmprincipal.matrizxferconsulta[1,nForXfer] = cboXFer.text) then
            begin
              frmprincipal.CriaConsulta(1, 98, frmprincipal.matrizxferconsulta[0,nForXfer]);
              frmprincipal.LogCallStep('log_xfer_act', '98' + frmprincipal.matrizxferconsulta[0,nForXfer]);
              break;
            end;
          end;
        end;
      end;
    end
    else//if frmprincipal.TMyAppStatus.bAtendido = true then
    begin
      frmprincipal.mensagem(APP_MB_ERR_CANNOT_XFER[ID_LANG]);
    end;//if frmprincipal.TMyAppStatus.bAtendido = true then
  end;
end;

procedure TfrmXFer.carregaxfer;
var
  ind: integer;
begin
  cboXFer.Items.Clear;

  btnXFer.Caption := APP_FRM_XFER_XFER1[ID_LANG];
  btnXFer.Enabled := True;
  cboXFer.Enabled := True;

  case tabxfer.TabIndex of
    0:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_QUEUE[ID_LANG];
      for ind := 0 to frmprincipal.vnumxferfila-1 do
      begin
        if frmPrincipal.TMyVaxIncomingCallParam.sFila <> frmprincipal.matrizxferfila[0,ind] then
          cboXFer.Items.Add(frmprincipal.matrizxferfila[1,ind]);
      end;
    end;

    1:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_IVR[ID_LANG];
      for ind := 0 to frmprincipal.vnumxferura-1 do
      begin
        cboXFer.Items.Add(frmprincipal.matrizxferura[1,ind]);
      end;
    end;

    2:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_EXTEN[ID_LANG];

      for ind := 0 to frmprincipal.vnumxferramal-1 do
      begin
        cboXFer.Items.Add(frmprincipal.matrizxferramal[1,ind]);
      end;

      if frmprincipal.TMyAtxferCallClass.bInAtxferCall = True then
      begin
        cboXFer.Enabled := False;
        cboXFer.ItemIndex := frmprincipal.TMyAtxferCallClass.nLastDest;
        Exit;
      end
      else
        btnXFer.Caption := APP_FRM_DIALPAD_DIAL[ID_LANG];
    end;

    3:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_RESEARCH[ID_LANG];
      for ind := 0 to frmprincipal.vnumxferpesquisa-1 do
      begin
        cboXFer.Items.Add(frmprincipal.matrizxferpesquisa[1,ind]);
      end;
    end;

    4:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_VIRTUAL[ID_LANG];
      for ind := 0 to frmprincipal.vnumxfervirtual-1 do
      begin
        cboXFer.Items.Add(frmprincipal.matrizxfervirtual[1,ind]);
      end;
    end;

    5:
    begin
      lblSelecioneXfer.Caption := APP_FRM_XFER_SELECT_CONSULTATION[ID_LANG];
      btnXFer.Caption := APP_FRM_XFER_XFER2[ID_LANG];

      for ind := 0 to frmprincipal.vnumxferconsulta-1 do
      begin
        cboXFer.Items.Add(frmprincipal.matrizxferconsulta[1,ind]);
      end;

      if frmprincipal.TMyConsultaCallClass.bInConsCall = True then
      begin
        btnXFer.Enabled := False;
        cboXFer.Enabled := False;
        cboXFer.ItemIndex := frmprincipal.TMyConsultaCallClass.nLastDest;
        Exit;
      end;
    end;
  end;

  cboXFer.Enabled := True;
end;

procedure TfrmXFer.CarregaTelasLinguagem;
begin
  btnXFer.Caption := APP_FRM_XFER_XFER1[ID_LANG];

  tabXFer.Tabs.Clear;
  tabXFer.Tabs.Add(APP_FRM_XFER_QUEUE[ID_LANG]);
  tabXFer.Tabs.Add(APP_FRM_XFER_IVR[ID_LANG]);
  tabXFer.Tabs.Add(APP_FRM_XFER_EXTEN[ID_LANG]);
  tabXFer.Tabs.Add(APP_FRM_XFER_RESEARCH[ID_LANG]);
  tabXFer.Tabs.Add(APP_FRM_XFER_VIRTUAL[ID_LANG]);
  tabXFer.Tabs.Add(APP_FRM_XFER_CONSULTATION[ID_LANG]);
end;

procedure TfrmXFer.tabXFerChange(Sender: TObject);
begin
  carregaxfer;
end;

end.
