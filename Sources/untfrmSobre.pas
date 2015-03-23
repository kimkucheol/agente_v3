unit untfrmSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSkinManager,
  Vcl.StdCtrls, sEdit, sLabel, sButton, Vcl.CustomizeDlg, ShellApi, RotinasGerais, System.Zip;

type
  TfrmSobre = class(TForm)
    sPanel1: TsPanel;
    cmdSolicitarAjuda: TsButton;
    cmdFechar: TsButton;
    lblEmpresa: TsLabel;
    lblAPP: TsLabel;
    sSkinManager1: TsSkinManager;
    lblCopyright: TsLabel;
    lblDesenvolvidoPor: TsLabel;
    lblEmpresaTxt: TsLabel;
    lblAPPTxt: TsLabel;
    lblCopyrightTxt: TsLabel;
    lblDesenvolvidoPorTxt: TsLabel;
    Image1: TImage;
    lblVersaoTxt: TsLabel;
    lblVersao: TsLabel;
    cmdCompactarLogs: TsButton;
    procedure cmdSolicitarAjudaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdCompactarLogsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTelasLinguagem;
  end;

var
  frmSobre: TfrmSobre;

implementation

uses untdm, untprincipal, unttranslate, untlogin;

{$R *.dfm}

{$I C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\Lang\defines.inc}


procedure TfrmSobre.cmdCompactarLogsClick(Sender: TObject);
var
  Zipfile: TZipFile;
  sDirLogs: String;
  sFileLogs: String;
  ano,mes,dia,hora,minuto,segundo,mili: word;
begin
  decodedate(now,ano,mes,dia);
  decodetime(now,hora,minuto,segundo,mili);

  sDirLogs := ExtractFilePath(Application.ExeName) + 'log';
  sFileLogs := IntToStr(dia) + '-' + IntToStr(mes) + '-' + IntToStr(ano) + '_' + IntToStr(hora) + IntToStr(minuto) + IntToStr(segundo) + '_Agente_Logs.zip';
  ZipFile := TZipFile.Create;
  try
    ZipFile.ZipDirectoryContents(sFileLogs, sDirLogs);
    ZipFile.Close;
  finally
    ZipFile.Free;
  end;
end;

procedure TfrmSobre.cmdFecharClick(Sender: TObject);
begin
  ModalResult := mrOk;//mrCancel;
end;

procedure TfrmSobre.cmdSolicitarAjudaClick(Sender: TObject);
begin
  try
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName)+'lib\TeamViewerQS_pt-idchesmr8e.exe'), nil, nil, SW_SHOWNORMAL);
  except
  end;

  ModalResult := mrOk;
end;

procedure TfrmSobre.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
    CanClose := True
  else
    CanClose := False;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  ModalResult := mrNone;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  CarregaTelasLinguagem;
end;

procedure TfrmSobre.CarregaTelasLinguagem;
begin
  frmSobre.Caption := APP_FRM_ABOUT_CAPTION[ID_LANG];
  cmdCompactarLogs.Caption := APP_FRM_ABOUT_CMD_ZIPLOGS[ID_LANG];
  cmdSolicitarAjuda.Caption := APP_FRM_ABOUT_CMD_HELP[ID_LANG];
  cmdFechar.Caption := APP_FRM_ABOUT_CMD_CLOSE[ID_LANG];

  lblEmpresa.Caption := APP_FRM_ABOUT_INFO_COMPANY[ID_LANG];
  lblAPP.Caption := APP_FRM_ABOUT_INFO_APP[ID_LANG];
  lblVersao.Caption := APP_FRM_MAIN_STATUS_BAR_VERSION[ID_LANG];
  lblCopyright.Caption := APP_FRM_ABOUT_INFO_COPYRIGHT[ID_LANG];
  lblDesenvolvidoPor.Caption := APP_FRM_ABOUT_INFO_DEVELOPED[ID_LANG];

  lblEmpresaTxt.Caption := GetStringResource(rcNomeEmpresa);
  lblAPPTxt.Caption := GetStringResource(rcCaptionPrincipal);
  lblVersaoTxt.Caption := frmPrincipal.VersaoExe + '(' + frmPrincipal.stbStatusBar.Hint + ')';
  lblCopyrightTxt.Caption := GetStringResource(rcCopyright);
  lblDesenvolvidoPorTxt.Caption := GetStringResource(rcDevelopedBy);
end;

end.
