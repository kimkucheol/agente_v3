unit untfrmSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSkinManager,
  Vcl.StdCtrls, sEdit, sLabel, sButton, Vcl.CustomizeDlg, ShellApi, RotinasGerais, System.Zip,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmSobre = class(TForm)
    sPanel1: TsPanel;
    cmdSolicitarAjuda: TsButton;
    cmdFechar: TsButton;
    sSkinManager1: TsSkinManager;
    Image1: TImage;
    cmdCompactarLogs: TsButton;
    PageControl1: TPageControl;
    tbsGerais: TTabSheet;
    TbsAudio: TTabSheet;
    lblEmpresa: TsLabel;
    lblEmpresaTxt: TsLabel;
    lblAPP: TsLabel;
    lblAPPTxt: TsLabel;
    lblVersao: TsLabel;
    lblVersaoTxt: TsLabel;
    lblCopyright: TsLabel;
    lblCopyrightTxt: TsLabel;
    lblDesenvolvidoPor: TsLabel;
    lblDesenvolvidoPorTxt: TsLabel;
    sLabel5: TsLabel;
    lblUser: TsLabel;
    lblIP: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    lblSO: TsLabel;
    sLabel11: TsLabel;
    lblMAC: TsLabel;
    CDS: TClientDataSet;
    DS: TDataSource;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MmDispositivosMic: TMemo;
    LblDispositivosMic: TsLabel;
    MmDispositivosSom: TMemo;
    LblDispositivosSom: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    lblAudio: TsLabel;
    lblMic: TsLabel;
    sLabel3: TsLabel;
    DBGrid1: TDBGrid;
    AdapterCB: TComboBox;
    Label32: TLabel;
    sLabel4: TsLabel;
    sLabel6: TsLabel;
    lblAdapter: TsLabel;
    lblDescricao: TsLabel;
    lblMacAddress: TsLabel;
    CDSIP: TStringField;
    CDSMASK: TStringField;
    procedure cmdSolicitarAjudaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdCompactarLogsClick(Sender: TObject);
    procedure UpdateAudioOut();
    procedure TabSheet2Show(Sender: TObject);
    procedure AdapterCBChange(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTelasLinguagem;
  end;

var
  frmSobre: TfrmSobre;

implementation

uses untdm, untprincipal, unttranslate, untlogin, untLibrary, untFuncoes;

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
  PageControl1.ActivePage := tbsGerais;
  PageControl2.ActivePage := TabSheet1;

  DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                      dgRowLines, dgTabs,dgConfirmDelete,dgCancelOnExit];
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  CarregaTelasLinguagem;
end;

procedure TfrmSobre.TabSheet2Hide(Sender: TObject);
begin
  CDS.Close;
  lblMacAddress.Caption := '';
  lblDescricao.Caption  := '';
  lblAdapter.Caption    := '';
  AdapterCB.Clear;
end;

procedure TfrmSobre.TabSheet2Show(Sender: TObject);
Var
  Memo : TMemoryStream;
  IntI : Integer;
begin

  Memo := TStringStream.Create;
  GetIPInfo(Memo);
  Memo.Position := 0;

  AdapterCB.Items.Clear;
  AdapterCB.Items.LoadFromStream(Memo);

  FreeAndNil(Memo);

  if AdapterCB.Items.Count > 0 then
  begin
    AdapterCB.ItemIndex := 0;
    AdapterCBChange(Sender);
  end;
end;

procedure TfrmSobre.AdapterCBChange(Sender: TObject);
var
  Device           : Array[0..30] of TDevice;
  AdapterType,
  Description,
  Physicaladdress,
  Gateway,
  DHCP,
  DHCPServer,
  SecondaryWINS,
  PrimaryWINS      : WideString;
  IntJ             : Integer;

begin
  if AdapterCB.ItemIndex >= 0 then
  begin
    GetAdaptadorInfo(AdapterCB.Text,
                     AdapterType,
                     Description,
                     Physicaladdress,
                     Gateway,
                     DHCP,
                     DHCPServer,
                     SecondaryWINS,
                     PrimaryWINS,
                     Device);

    lblMacAddress.Caption := Physicaladdress;
    lblDescricao.Caption  := Description;
    lblAdapter.Caption    := AdapterType;

    if CDS.Active then CDS.Close;

    CDS.CreateDataSet;
    CDS.Open;
    CDS.IsEmpty;
    for IntJ := 0 to High(Device)-1 do
    begin
      if Device[IntJ] <> Nil then
      begin
        CDS.Insert;
        CDSIP.AsString   := Device[IntJ].IP;
        CDSMASK.AsString := Device[IntJ].MASK;
        CDS.Post;
      end;
    end;

    FreeAndNil(Device);
  end;

end;

procedure TfrmSobre.CarregaTelasLinguagem;
  Var IntI : Integer;
      Lst  : TStringList;
begin
  frmSobre.Caption              := APP_FRM_ABOUT_CAPTION[ID_LANG];
  cmdCompactarLogs.Caption      := APP_FRM_ABOUT_CMD_ZIPLOGS[ID_LANG];
  cmdSolicitarAjuda.Caption     := APP_FRM_ABOUT_CMD_HELP[ID_LANG];
  cmdFechar.Caption             := APP_FRM_ABOUT_CMD_CLOSE[ID_LANG];

  lblEmpresa.Caption            := APP_FRM_ABOUT_INFO_COMPANY[ID_LANG];
  lblAPP.Caption                := APP_FRM_ABOUT_INFO_APP[ID_LANG];
  lblVersao.Caption             := APP_FRM_MAIN_STATUS_BAR_VERSION[ID_LANG];
  lblCopyright.Caption          := APP_FRM_ABOUT_INFO_COPYRIGHT[ID_LANG];
  lblDesenvolvidoPor.Caption    := APP_FRM_ABOUT_INFO_DEVELOPED[ID_LANG];

  lblEmpresaTxt.Caption         := GetStringResource(rcNomeEmpresa);
  lblAPPTxt.Caption             := GetStringResource(rcCaptionPrincipal);
  lblVersaoTxt.Caption          := frmPrincipal.VersaoExe + '(' + frmPrincipal.stbStatusBar.Hint + ')';
  lblCopyrightTxt.Caption       := GetStringResource(rcCopyright);
  lblDesenvolvidoPorTxt.Caption := GetStringResource(rcDevelopedBy);

  lblAudio.Caption              := MmDispositivosSom.Lines[0];
  lblMic.Caption                := MmDispositivosMic.Lines[0];
  lblUser.Caption               := Agente.WinUSER;
  lblSO.Caption                 := Agente.WinSYS_OPER;
  lblIP.Caption                 := Agente.WinIP;
  lblMAC.Caption                := Agente.WinMAC_ADDRES02;

  // Lista de Audio e Microfone e o padrão
  MmDispositivosMic.Lines.Clear;
  MmDispositivosSom.Lines.Clear;
  Lst := TStringList.Create;

  // Sound
  LblDispositivosSom.Caption := 'Dispositivos de Som : Total '+FormatFloat('00', Agente.TotalAudio);

  Lst.Clear;
  Lst.Assign(Agente.ListaAudios);
  MmDispositivosSom.Lines.Assign(Lst);

  lblAudio.Caption := MmDispositivosSom.Lines[0];

  // Mic
  LblDispositivosMic.Caption := 'Dispositivos de Microfone : Total '+FormatFloat('00', Agente.TotalMicrofone);

  Lst.Clear;
  Lst.Assign(Agente.ListaMics);
  MmDispositivosMic.Lines.Assign(Lst);

  lblMic.Caption := MmDispositivosMic.Lines[0];

  FreeAndNil(Lst);

//  MmDispositivosMic.Lines.Assign(Agente.ListaMics);
end;

procedure TfrmSobre.UpdateAudioOut();
var
  nDeviceIndex : Integer;
  nDeviceId : Integer;
  sDeviceName : WideString;
//  objListData : TListData;
begin
  for nDeviceIndex := 0 to frmPrincipal.vax.GetAudioOutDevTotal() - 1 do
  begin
    nDeviceId := frmPrincipal.vax.GetAudioOutDevId(nDeviceIndex);
    sDeviceName := frmPrincipal.vax.GetAudioOutDevName(nDeviceIndex);
    ShowMessage(sDeviceName);
  end;

end;


end.
