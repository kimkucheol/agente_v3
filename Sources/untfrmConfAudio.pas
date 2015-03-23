unit untfrmConfAudio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSkinManager,
  Vcl.StdCtrls, sEdit, sLabel, sButton, Vcl.CustomizeDlg, ShellApi, RotinasGerais, System.Zip,
  sGroupBox, sComboBox;

type
  TfrmConfAudio = class(TForm)
    sPanel1: TsPanel;
    cmdCancelar: TsButton;
    cmdFechar: TsButton;
    sSkinManager1: TsSkinManager;
    cmdSalvar: TsButton;
    grpIn: TsGroupBox;
    lblTotalIn: TsLabel;
    lblDeviceIn: TsLabel;
    txtTotalIn: TsEdit;
    cboDeviceIn: TsComboBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTelasLinguagem;
    procedure CarregaConfiguracoes;
  end;

var
  frmConfAudio: TfrmConfAudio;

implementation

uses untdm, untprincipal, unttranslate, untlogin;

{$R *.dfm}

{$I C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\Lang\defines.inc}


procedure TfrmConfAudio.cmdFecharClick(Sender: TObject);
begin
  ModalResult := mrOk;//mrCancel;
end;

procedure TfrmConfAudio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
    CanClose := True
  else
    CanClose := False;
end;

procedure TfrmConfAudio.FormCreate(Sender: TObject);
begin
  ModalResult := mrNone;
end;

procedure TfrmConfAudio.FormShow(Sender: TObject);
begin
  CarregaTelasLinguagem;
  CarregaConfiguracoes;
end;

procedure TfrmConfAudio.CarregaTelasLinguagem;
begin
  frmConfAudio.Caption := APP_FRM_CONFAUDIO_CAPTION[ID_LANG];
  cmdSalvar.Caption := APP_FRM_CONFAUDIO_CMD_SAVE[ID_LANG];
  cmdCancelar.Caption := APP_FRM_CONFAUDIO_CMD_CANCEL[ID_LANG];
  cmdFechar.Caption := APP_FRM_CONFAUDIO_CMD_CLOSE[ID_LANG];

  grpIn.Caption := APP_FRM_CONFAUDIO_INFO_IN[ID_LANG];
  lblTotalIn.Caption := APP_FRM_CONFAUDIO_INFO_TOTALIN[ID_LANG];
  lblDeviceIn.Caption := APP_FRM_CONFAUDIO_INFO_DEVICEIN[ID_LANG];
end;

procedure TfrmConfAudio.CarregaConfiguracoes;
var
  nFor: Integer;
begin
  txtTotalIn.Text := IntToStr(frmPrincipal.vax.GetAudioInDevTotal);

{  cboDeviceIn.Items.Clear;
  for nFor := 1 to frmPrincipal.vax.GetAudioInDevTotal do
  begin
    cboDeviceIn.Items.Add(frmPrincipal.vax.GetAudioInDevName(nFor));
    memo1.Lines.Add('['+frmPrincipal.vax.GetAudioInDevName(nFor)+']');
  end;
 }
  for nFor := 1 to frmPrincipal.vax.GetAudioOutDevTotal do
  begin
    memo1.Lines.Add(IntToStr(frmPrincipal.vax.GetAudioOutDevId(nFor)));
    memo1.Lines.Add(frmPrincipal.vax.GetAudioOutDevName(nFor));
  end;

end;

end.
