unit untFuncoes;
{
############################################################################
# Inclusão ...... :
#  Autor   : Rogério Teixeira
#  Data    : 24.03.2015
#  Motivo  : Library dos Metodos Publicos (Globais)
############################################################################
# Manutenção ...... :
#  Usuario :
#  Data    :
#  Motivo  :
#  Ref.    :
############################################################################
}
interface
Uses
  Registry, IniFiles, SysUtils, Messages, Dialogs, Winapi.Windows;

// Declarações
  // Le o arquivo ini
  function FncLeINI(Path:String;ChavePrincipal:String;ChaveSecundaria:String):String;
  // Grava o no arquivo ini
  procedure PrcGravaIni(Path:String;ChavePrincipal:String;ChaveSecundaria:String;Valor:String);
  // Executa e Retorna as mensagens do Prompt de comando do MSDOS
  function FncComandoMSDOS(Comando, DiretorioTrabalho: string): string;

  // Cria as Classes (Library´s do sistema)
  procedure PrcGenerateLibClass();
  // Destroi as Classes (Library´s do sistema)
  procedure PrcDestructorLibClass();

  //1. Modo de busca pelo nome do Sistema Operacional
  function GetSOComputer01: string;
  //2. Modo de busca pelo nome do Sistema Operacional
  function GetSOComputer02: string;


implementation
uses untLibrary;

function FncLeINI(Path:String;ChavePrincipal:String;ChaveSecundaria:String):String;
var
   IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(Path);
  Result :=  IniFile.ReadString(ChavePrincipal,ChaveSecundaria,'');
end;


procedure PrcGravaIni(Path:String;ChavePrincipal:String;ChaveSecundaria:String;Valor:String);
var
  Arq_Ini : TiniFile;
begin
  try
    if FileExists(Path) then
    Begin
      Arq_Ini := TIniFile.Create(Path);
      Arq_Ini.WriteString(ChavePrincipal,ChaveSecundaria,Valor);
      Arq_Ini.Free;
    End;
  Except On E: Exception Do
    Begin
      Try Arq_Ini.Free; Except End;
      MessageDlg('03 ERRO: '+QuotedStr(E.Message),mtError,[mbOk],0);
    End;
  End;
end;

function FncComandoMSDOS(Comando, DiretorioTrabalho: string): string;
var
  saSegunranca: TSecurityAttributes;
  siInformacoesInicializacao: TStartupInfo;
  piInformacaoDoProcesso: TProcessInformation;
  hLeitura, hEscrita: THandle;
  bOk, bHandle: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesLidos: Cardinal;
  Diretorio: string;
begin
  Result := '';
  with saSegunranca do
  begin
    nLength := SizeOf(saSegunranca);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(hLeitura, hEscrita, @saSegunranca, 0);
  try
    with siInformacoesInicializacao do
    begin
      FillChar(siInformacoesInicializacao, SizeOf(siInformacoesInicializacao), 0);
      cb := SizeOf(siInformacoesInicializacao);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_Hide;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := hEscrita;
      hStdError := hEscrita;
    end;
    Diretorio := DiretorioTrabalho;
    bHandle := CreateProcess(nil, PChar('cmd.exe /c ' + Comando), nil, nil, True, 0, nil,
    PChar(Diretorio), siInformacoesInicializacao, piInformacaoDoProcesso);
    CloseHandle(hEscrita);
    if bHandle then
    begin
      try
        repeat
          bOk := ReadFile(hLeitura, Buffer, 255, BytesLidos, nil);

          if BytesLidos > 0 then
          begin
            Buffer[BytesLidos] := #0;
            OemToAnsi(Buffer, Buffer);
            Result :=  Result + Buffer;
          end;
        until not bOk or (BytesLidos = 0);
        WaitForSingleObject(piInformacaoDoProcesso.hProcess, INFINITE);
      finally
        CloseHandle(piInformacaoDoProcesso.hThread);
        CloseHandle(piInformacaoDoProcesso.hProcess);
      end;
    end;
  finally
    CloseHandle(hLeitura);
  end;
end;

procedure PrcGenerateLibClass();
begin
  if Not Assigned(Configuracao) then Configuracao :=TConfiguracoes.Create;;
  if Not Assigned(Agente) then Agente :=TAgente.Create;
end;

procedure PrcDestructorLibClass();
begin
  if Assigned(Configuracao) then FreeAndNil(Configuracao);
  if Assigned(Agente) then FreeAndNil(Agente);
end;

function GetSOComputer01: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
    begin
      Result := Reg.ReadString('ProductName');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

// Função Sistema Operacional
function GetSOComputer02: string;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize:=SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  Result:='';
  with VersionInfo do
  begin
    case dwPlatformId of
      1:  case dwMinorVersion of
            00: Result:='Microsoft Windows 95';
            10: Result:='Microsoft Windows 98';
            90: Result:='Microsoft Windows Me';
          end;
      2:  case dwMajorVersion of
          5: case dwMinorVersion of
               00: Result := 'Microsoft Windows 2000';
               01: Result := 'Microsoft Windows XP';
               02: Result := 'Microsoft Windows Server 2003';
             end;
          6: case dwMinorVersion of
               00: Result := 'Microsoft Windows Vista';
               01: Result := 'Microsoft Windows 7';
               02: Result := 'Microsoft Windows 8';
             end;
      end;
    end;
  end;
  if (Result='') then
    Result:='Sistema operacional desconhecido.ID: '+IntToStr(VersionInfo.dwPlatformId)+' Versão: '+IntToStr(VersionInfo.dwMinorVersion);
end;
// Fim da Função SO


end.
