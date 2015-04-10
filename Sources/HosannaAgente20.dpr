program HosannaAgente20;

uses
  Forms,
  dialogs,
  Windows,
  RotinasGerais,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untdm in 'untdm.pas' {datam: TDataModule},
  untlogin in 'untlogin.pas' {frmLogin},
  untfrmdialpad in 'untfrmdialpad.pas' {frmDialPad: TFrame},
  untfrmpausa in 'untfrmpausa.pas' {frmPausa: TFrame},
  untfrmconfiguracoes in 'untfrmconfiguracoes.pas' {frmConfiguracoes: TFrame},
  untfrmclassifica in 'untfrmclassifica.pas' {frmclassifica: TFrame},
  untfrmxfer in 'untfrmxfer.pas' {frmXFer: TFrame},
  unttranslate in 'unttranslate.pas',
  untChangePass in 'untChangePass.pas' {frmChangePass},
  untfrmRingPopup in 'untfrmRingPopup.pas' {frmRingPopup},
  untfrmDesbloquear in 'untfrmDesbloquear.pas' {frmDesbloquear},
  untfrmcoaching in 'untfrmcoaching.pas' {frmCoaching: TFrame},
  uAutoSendFilesThread in 'uAutoSendFilesThread.pas',
  uExecIntegradorThread in 'uExecIntegradorThread.pas',
  untProgressBar in 'untProgressBar.pas' {frmProgressBar},
  untfrmSobre in 'untfrmSobre.pas' {frmSobre},
  untStartup in 'untStartup.pas',
  untfrmConfAudio in 'untfrmConfAudio.pas' {frmConfAudio},
  untLibrary in 'untLibrary.pas',
  untFuncoes in 'untFuncoes.pas';

{$R *.res}
{$I C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\Lang\defines.inc}

function CanStart: Boolean;
var
  Wdw: HWND;
begin
  Wdw := FindDuplicateMainWdw;
  if Wdw = 0 then
    Result := True
  else
    Result := not SwitchToPrevInst(Wdw);
end;

begin
  Application.Title := '';
  ID_LANG := 0;

  if ResourceModule = 0 then
  begin
    Application.MessageBox(PChar(APP_MB_APP_DLL_NOT_FOUND[ID_LANG] + ' (' + dllname + ').'), PChar(APP_NAME[ID_LANG]), MB_OK + MB_ICONSTOP);
    if hDLL <> 0 then FreeLibrary(hDLL);
    Exit;
  end;

  if (FindWindow(Nil, PChar(GetStringResource(rcCaptionPrincipal))) = 0) or (CanStart) then
  begin
    Application.Title := GetStringResource(rcCaptionPrincipal);

    Application.Initialize;
    //Application.MainFormOnTaskBar := False;
    Application.CreateForm(Tdatam, datam);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmChangePass, frmChangePass);
  Application.CreateForm(TfrmRingPopup, frmRingPopup);
  Application.CreateForm(TfrmDesbloquear, frmDesbloquear);
  Application.CreateForm(TfrmProgressBar, frmProgressBar);
  Application.CreateForm(TfrmConfAudio, frmConfAudio);
  Application.Run;
  end
  else
    if ParamCount = 0 then
      Application.MessageBox(PChar(APP_MB_APP_ALREADY_RUNNING[ID_LANG]), PChar(GetStringResource(rcCaptionPrincipal)), MB_OK+MB_ICONSTOP);

  if hDLL <> 0 then FreeLibrary(hDLL);

end.
