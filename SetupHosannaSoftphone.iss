[Setup]
#define AppVersion GetFileVersion("Z:\GitHub\agente_v3\Sources\Win32\Debug\hosannasoftphone.exe")

AppId={{6A2BA935-F425-4D9D-8C0B-6BF5D088E067}
AppName=Hosanna Softphone
AppVerName=Hosanna Softphone {#AppVersion}
AppPublisher=Hosanna Tecnologia
AppPublisherURL=http://www.hosannatecnologia.com.br
AppSupportURL=http://www.hosannatecnologia.com.br
AppUpdatesURL=http://www.hosannatecnologia.com.br
DefaultDirName=C:\Hosanna\Softphone
DisableDirPage=True
DefaultGroupName=Hosanna\Softphone
DisableProgramGroupPage=true
WindowResizable=False

SetupIconFile=Z:\GitHub\Softphone\Sources\Setup\softphone.ico
Compression=lzma
SolidCompression=yes
VersionInfoVersion={#AppVersion}

UninstallDisplayIcon={app}\hosannasoftphone.exe
UninstallFilesDir={app}
Uninstallable=True
CreateUninstallRegKey=True

;OutputDir=Z:\GitHub\Softphone\Sources\Setup\
OutputBaseFilename=Setup_HosannaSoftphone-{#AppVersion}

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
;Name: Portugues; MessagesFile: compiler:Languages\PortugueseStd.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: Z:\GitHub\agente_v3\Sources\Win32\Debug\hosannasoftphone.exe; DestDir: {app}; Flags: ignoreversion
Source: Z:\GitHub\agente_v3\Sources\Win32\Debug\Agente.dll; DestDir: {app}; Flags: ignoreversion
Source: Z:\GitHub\agente_v3\Sources\Win32\Debug\midas.dll; DestDir: {app}; Flags: ignoreversion
Source: Z:\GitHub\agente_v3\Sources\Win32\Debug\iphist.dat; DestDir: {app}; Flags: ignoreversion

;OCX VAX
Source: Z:\GitHub\Softphone\Sources\Setup\VaxSIPUserAgentOCX.ocx; DestDir: {sys}; Flags: restartreplace sharedfile regserver

;Biblioteca MySQL
Source: Z:\GitHub\Softphone\Sources\Setup\libmySQL55.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: Z:\GitHub\Softphone\Sources\Setup\libmySQL41.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: Z:\GitHub\Softphone\Sources\Setup\libmySQL50.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall
Source: Z:\GitHub\Softphone\Sources\Setup\libmySQL51.dll; DestDir: {sys}; Flags: onlyifdoesntexist uninsneveruninstall

;Skin
Source: Z:\GitHub\Softphone\Sources\Setup\skin\WLM.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion
Source: Z:\GitHub\Softphone\Sources\Setup\skin\iOS4.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion
Source: Z:\GitHub\agente_v3\Sources\Setup\skin\WEB2.asz; DestDir: {app}\skin; Flags: onlyifdoesntexist ignoreversion

;INI Padrao
Source: Z:\GitHub\Softphone\Sources\Setup\Config.INI; DestDir: {app}; Flags: ignoreversion

;IMGs
Source: Z:\GitHub\Softphone\Sources\Win32\Debug\img\icoChat.png; DestDir: {app}\img; Flags: ignoreversion
Source: Z:\GitHub\Softphone\Sources\Win32\Debug\img\icoChatDiscar2.png; DestDir: {app}\img; Flags: ignoreversion
Source: Z:\GitHub\Softphone\Sources\Win32\Debug\img\icoChatEncerrar.png; DestDir: {app}\img; Flags: ignoreversion
Source: Z:\GitHub\Softphone\Sources\Win32\Debug\img\icoChatURL2.png; DestDir: {app}\img; Flags: ignoreversion

;Dic
Source: Z:\GitHub\Softphone\Sources\Setup\Dic\Dic.cfg; DestDir: {app}\Dic; Flags: onlyifdoesntexist ignoreversion
Source: Z:\GitHub\Softphone\Sources\Setup\Dic\brazport.adm; DestDir: {app}\Dic; Flags: onlyifdoesntexist

;Audio
Source: Z:\GitHub\Softphone\Sources\Setup\Ring.wav; DestDir: {app}; Flags: ignoreversion

[Icons]
Name: {group}\Softphone; Filename: {app}\hosannasoftphone.exe
Name: {group}\{cm:UninstallProgram,Softphone}; Filename: {uninstallexe}
Name: {commondesktop}\Hosanna Softphone; Filename: {app}\hosannasoftphone.exe; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Hosanna Softphone; Filename: {app}\hosannasoftphone.exe; Tasks: quicklaunchicon

;[Dirs]
;Name: {app}\XXXDirectory; Flags: uninsneveruninstall

[Run]
Filename: {app}\hosannasoftphone.exe; Description: {cm:LaunchProgram,Hosanna Softphone}; Flags: nowait postinstall
;skipifsilent

[Registry]
;Registry Entries
;Root: HKCU; Subkey: Software\Hosanna\Softphone\UserSettings\...; ValueType: string; ValueName: ValueX
