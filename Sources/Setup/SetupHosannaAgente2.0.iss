[Setup]
#define AppVersion GetFileVersion("C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\hosannaagente20.exe")

AppId={{BA2E0DBC-05D5-4021-A3C9-34DBF5763139}
AppName=Hosanna Agente 2.0
AppVerName=Hosanna Agente {#AppVersion}
AppPublisher=Hosanna Tecnologia
AppPublisherURL=http://www.hosannatecnologia.com.br
AppSupportURL=http://www.hosannatecnologia.com.br
AppUpdatesURL=http://www.hosannatecnologia.com.br
DefaultDirName=C:\Hosanna\Agente2.0
DisableDirPage=true
DefaultGroupName=Hosanna\Agente2.0
DisableProgramGroupPage=true
WindowResizable=false

SetupIconFile=C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\easy.ico
Compression=lzma
SolidCompression=true
VersionInfoVersion={#AppVersion}

UninstallDisplayIcon={app}\hosannaagente20.exe
UninstallFilesDir={app}
Uninstallable=true
CreateUninstallRegKey=true

;OutputDir=C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\
OutputBaseFilename=Setup_HosannaAgente20-{#AppVersion}

PrivilegesRequired=poweruser

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
;Name: Portugues; MessagesFile: compiler:Languages\PortugueseStd.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\hosannaagente20.exe; DestDir: {app}; Flags: ignoreversion

;OCX VAX
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\VaxSIPUserAgentOCX.ocx; DestDir: {sys}; Flags: restartreplace sharedfile regserver

;Biblioteca MySQL
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\libmySQL55.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\libmySQL41.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\libmySQL50.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\libmySQL51.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall

;Skin
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\skin\WLM.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\skin\iOS4.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\skin\WEB2.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion

;INI Padrao
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\Config.INI; DestDir: {app}; Flags: ignoreversion

;IMGs
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\icoChat.png; DestDir: {app}\img; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\icoChatDiscar2.png; DestDir: {app}\img; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\icoChatEncerrar.png; DestDir: {app}\img; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\icoChatURL2.png; DestDir: {app}\img; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\icoHosanna.png; DestDir: {app}\img; Flags: ignoreversion

;IMGs E-Mail
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\facebook.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\arrowLeft.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\paperclip.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\adminUser.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\magnify.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\bubbles2.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\mail.png; DestDir: {app}\img\EMail; Flags: ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Win32\Debug\img\EMail\twitter.png; DestDir: {app}\img\EMail; Flags: ignoreversion

;Dic
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\Dic\Dic.cfg; DestDir: {app}\dic; Flags: onlyifdoesntexist ignoreversion
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\Dic\brazport.adm; DestDir: {app}\dic; Flags: onlyifdoesntexist

;Audio
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\Ring.wav; DestDir: {app}; Flags: ignoreversion

;OCX Screen2Video
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\wmfdist.exe; DestDir: {app}\lib; AfterInstall: AfterMyProgInstall_S2V('wmfdist.exe'); Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\msvcr71.dll; DestDir: {app}\lib
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\MFC71.dll; DestDir: {app}\lib
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\msvcp71.dll; DestDir: {app}\lib
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\gdiplus.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\ScreenSource.ax; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\videocore.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\videoformat.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\videotrans.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomflashenc.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscommpgenc.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscommp4enc.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomaudioprocess.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscommixer.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomspeaker.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomaddmp4streaming.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Screen2Video.OCX; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\lame_enc.dll; DestDir: {app}\lib; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomaudiodata.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\viscomaudioencoder.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\screentrans.dll; DestDir: {app}\lib; Flags: regserver ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Profiles\1280x1024.prx; DestDir: {app}\Profiles; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Profiles\320x240.prx; DestDir: {app}\Profiles; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Profiles\640x480.prx; DestDir: {app}\Profiles; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Profiles\800x600.prx; DestDir: {app}\Profiles; Flags: ignoreversion
Source: C:\Program Files (x86)\Screen2Video Gold ActiveX Control\Profiles\1024x768.prx; DestDir: {app}\Profiles; Flags: ignoreversion

;Video Codec
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\ffdshow-20041012.exe; DestDir: {app}\lib; AfterInstall: AfterMyProgInstall_FFD('ffdshow-20041012.exe'); Flags: ignoreversion

;TeamViewer
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\TeamViewerQS_pt-idchesmr8e.exe; DestDir: {app}\lib; Flags: ignoreversion

;OEM
Source: C:\DSD_Development\Apps\HosannaTecnologia\Agente2.0\Sources\Setup\Lang\appsHT.dll; DestDir: {app}\lang; Flags: ignoreversion

[Icons]
Name: {group}\Agente2.0; Filename: {app}\hosannaagente20.exe
Name: {group}\{cm:UninstallProgram,Agente2.0}; Filename: {uninstallexe}
Name: {commondesktop}\Hosanna Agente 2.0; Filename: {app}\hosannaagente20.exe; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Hosanna Agente 2.0; Filename: {app}\hosannaagente20.exe; Tasks: quicklaunchicon

[Code]
procedure AfterMyProgInstall_S2V(S: String);
var
  ErrorCode: Integer;
begin
  ShellExec('open', ExpandConstant('{app}\lib\wmfdist.exe'), '', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
end;

procedure AfterMyProgInstall_FFD(S: String);
var
  ErrorCode: Integer;
begin
  ShellExec('open', ExpandConstant('{app}\lib\ffdshow-20041012.exe'), '/S', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
end;

[Dirs]
Name: {app}\arquivos_chat\recebidos; Flags: uninsalwaysuninstall
;Name: {app}\arquivos_chat\enviados; Flags: uninsalwaysuninstall

[Run]
;Filename: {app}\ffdshow-20041012.exe; Flags: nowait postinstall runhidden runminimized; Parameters: /S
Filename: {app}\hosannaagente20.exe; Description: {cm:LaunchProgram,Hosanna Agente 2.0}; Flags: postinstall
;skipifsilent

[Registry]
;Registry Entries
;Root: HKCU; Subkey: Software\Hosanna\Agente2.0\UserSettings\...; ValueType: string; ValueName: ValueX
