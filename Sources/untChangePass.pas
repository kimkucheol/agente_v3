unit untchangepass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSkinManager,
  Vcl.StdCtrls, sEdit, sLabel, sButton, Vcl.CustomizeDlg, RotinasGerais;

type
  TfrmChangePass = class(TForm)
    sPanel1: TsPanel;
    cmdChangePass: TsButton;
    cmdCancel: TsButton;
    lblLogin: TsLabel;
    lblOldPass: TsLabel;
    txtLogin: TsEdit;
    txtOldPass: TsEdit;
    sSkinManager1: TsSkinManager;
    lblNewPass: TsLabel;
    txtNewPass: TsEdit;
    lblNewPassCon: TsLabel;
    txtNewPassCon: TsEdit;
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdChangePassClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CarregaTelasLinguagem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangePass: TfrmChangePass;

implementation

uses untdm, untprincipal, unttranslate, untlogin;

{$R *.dfm}

{$I C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\Lang\defines.inc}

procedure TfrmChangePass.cmdCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmChangePass.cmdChangePassClick(Sender: TObject);
begin
  if Trim(txtLogin.Text) = '' then
  begin
    txtLogin.SetFocus;
    Exit;
  end;

  if Trim(txtOldPass.Text) = '' then
  begin
    txtOldPass.SetFocus;
    Exit;
  end;

  if Trim(txtNewPass.Text) = '' then
  begin
    txtNewPass.SetFocus;
    Exit;
  end;

  if Trim(txtNewPassCon.Text) = '' then
  begin
    txtNewPassCon.SetFocus;
    Exit;
  end;

  if txtNewPass.Text <> txtNewPassCon.Text then
  begin
    Application.MessageBox(PChar(APP_MB_ERR_INVALID_PASS[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
    txtNewPass.Text := '';
    txtNewPassCon.Text := '';
    txtNewPass.SetFocus;
    Exit;
  end;

  datam.qryChangePass.Active := False;
  datam.qryChangePass.SQL.Clear;
  datam.qryChangePass.SQL.Add('select senha ');
  datam.qryChangePass.SQL.Add('from easy_sist_usuario_login_conf ');
  datam.qryChangePass.SQL.Add('where login = ' + QuotedStr(txtLogin.Text));
  datam.qryChangePass.Active := True;

  if datam.qryChangePass.RecordCount > 0 then
  begin
    if datam.qryChangePass.Fields[0].AsString = txtOldPass.Text then
    begin
      try
        datam.qryChangePass.Active := False;
        datam.qryChangePass.SQL.Clear;
        datam.qryChangePass.SQL.Add('update easy_sist_usuario_login_conf ');
        datam.qryChangePass.SQL.Add('set senha = ' + QuotedStr(txtNewPass.Text));
        datam.qryChangePass.SQL.Add('where login = ' + QuotedStr(txtLogin.Text));
        datam.qryChangePass.ExecSQL;
        datam.qryChangePass.Active := False;

        Application.MessageBox(PChar(APP_MB_PASS_CHANGED[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
        frmChangePass.Close;
      except
        Application.MessageBox(PChar(APP_MB_ERR_PASS_CHANGE[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
      end;
    end
    else
    begin
      Application.MessageBox(PChar(APP_MB_ERR_INVALID_OLD_PASS[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
      txtOldPass.Text := '';
      txtOldPass.SetFocus;
    end;
  end
  else
  begin
    Application.MessageBox(PChar(APP_MB_ERR_INVALID_LOGIN[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_ICONEXCLAMATION);
    txtLogin.SetFocus;
  end;

  datam.qryChangePass.Active := False;
end;

procedure TfrmChangePass.FormShow(Sender: TObject);
begin
  if Trim(frmLogin.txtLogin.Text) <> '' then
    txtLogin.Text := frmLogin.txtLogin.Text
  else
    txtLogin.Text := '';

  txtOldPass.Text := '';
  txtNewPass.Text := '';
  txtNewPassCon.Text := '';

  CarregaTelasLinguagem;
end;

procedure TfrmChangePass.CarregaTelasLinguagem;
begin
  lblLogin.Caption := APP_FRM_PASS_LOGIN[ID_LANG];
  lblOldPass.Caption := APP_FRM_PASS_OLDPASS[ID_LANG];
  lblNewPass.Caption := APP_FRM_PASS_NEWPASS[ID_LANG];
  lblNewPassCon.Caption := APP_FRM_PASS_NEWPASSCON[ID_LANG];

  cmdChangePass.Caption := APP_FRM_PASS_CHANGEPASS[ID_LANG];
  cmdCancel.Caption := APP_FRM_PASS_CANCEL[ID_LANG];
end;

end.
