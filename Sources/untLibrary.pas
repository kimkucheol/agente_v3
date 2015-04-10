unit untLibrary;
{
############################################################################
# Inclusão ...... :
#  Autor   : Rogério Teixeira
#  Data    : 24.03.2015
#  Motivo  : Geração de Library (Class, Records)
############################################################################
# Manutenção ...... :
#  Usuario :
#  Data    :
#  Motivo  :
#  Ref.    :
############################################################################
}
interface
  uses SysUtils, Forms, Windows, Classes, iphlpapi, IpTypes, Winsock,
       IdComponent, IdIPWatch, mmsystem;

Type

  TAgente = Class
  private
    function GetPathArqConf: string;
    function GetTotalAudio: Integer;
    function GetTotalMicrofone: Integer;
    function GetWinSYS_OPER: string;
    function GetWinUSER: string;
    function GetWinMOTHERBOARD: string;
    function GetWinPC_NAME: string;
    function GetWinMAC_ADDRES01: string;
    function GetWinMAC_ADDRES02: string;
    function GetListaAudios: TStringList;
    function GetListaMics: TStringList;
    function GetwinIP: string;
  public
    property PathArqConf     : string read GetPathArqConf;
    property TotalMicrofone  : Integer read GetTotalMicrofone;
    property TotalAudio      : Integer read GetTotalAudio;
    property ListaAudios     : TStringList read GetListaAudios;
    property ListaMics       : TStringList read GetListaMics;
    property WinUSER         : string read GetWinUSER;
    property WinPC_NAME      : string read GetWinPC_NAME;
    property WinMAC_ADDRES01 : string read GetWinMAC_ADDRES01;
    property WinMAC_ADDRES02 : string read GetWinMAC_ADDRES02;
    property WinSYS_OPER     : string read GetWinSYS_OPER;
    property WinMOTHERBOARD  : string read GetWinMOTHERBOARD;
    property WinIP           : string read GetwinIP;
  End;


  // Classe de Conf.ini
  TConfiguracoes = Class
  private
    function Getcmd01: string;
    function Getcmd02: string;
    function Getcmd03: string;
    function Getcmd04: string;
    function Getcmd05: string;
  public
    property cmd01: string read Getcmd01;
    property cmd02: string read Getcmd02;
    property cmd03: string read Getcmd03;
    property cmd04: string read Getcmd04;
    property cmd05: string read Getcmd05;
  End;

// Classe de Devices Agente.dll
  TDevice=class(TPersistent)
  private
    FIP   : WideString;
    FMask : WideString;
  public
    property IP  : WideString read FIP write FIP;
    property MASK: WideString read FMASK write FMASK;
  end;


  Var Configuracao : TConfiguracoes;  // Conf.ini
      Agente       : TAgente;         // HosannaAgente.exe

Const
  CnstNameArqConf = 'Config.INI';

implementation
  uses untFuncoes;


{ TConfiguracoes }
function TConfiguracoes.Getcmd01: string;
begin
  Result := FncLeINI(Agente.PathArqConf,'COMANDOS','CMD01');
end;

function TConfiguracoes.Getcmd02: string;
begin
  Result := FncLeINI(Agente.PathArqConf,'COMANDOS','CMD02');
end;

function TConfiguracoes.Getcmd03: string;
begin
  Result := FncLeINI(Agente.PathArqConf,'COMANDOS','CMD03');
end;

function TConfiguracoes.Getcmd04: string;
begin
  Result := FncLeINI(Agente.PathArqConf,'COMANDOS','CMD04');
end;

function TConfiguracoes.Getcmd05: string;
begin
  Result := FncLeINI(Agente.PathArqConf,'COMANDOS','CMD05');
end;

{ TAgente }
function TAgente.GetTotalAudio: Integer;
begin
//  result := WaveOutGetNumDevs > 0;
  result := WaveOutGetNumDevs;
end;

function TAgente.GetTotalMicrofone: integer;
begin
//  result := waveInGetNumDevs > 0;
  result := waveInGetNumDevs;
end;

function TAgente.GetwinIP: string;
var
  IPWatch : TIdIPWatch;
begin
 IPWatch := TIdIPWatch.Create(nil);
 Result := IPWatch.LocalIP;
 FreeAndNil(IPWatch);
end;

function TAgente.GetListaAudios: TStringList;
Var StrResultado : TStringList;
begin
{  StrResultado := TStringList.Create;
  if Assigned(StrResultado) then
    StrResultado := FncRetornaAudio('DirectSound:');
  Result := StrResultado;}

  Result := TStringList.Create;

  if Assigned(Result) then
    PrcRetornaAudioOUT(Result);

  if Result.Count <= 0 then
    Result.Add('Dispositivo desconhecido.');

end;

function TAgente.GetListaMics: TStringList;
begin
  Result := TStringList.Create;

  if Assigned(Result) then
    PrcRetornaAudioIN(Result);

  if Result.Count <= 0 then
    Result.Add('Dispositivo desconhecido.');
end;

function TAgente.GetPathArqConf: string;
begin
  Result := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+CnstNameArqConf;
end;

function TAgente.GetWinMAC_ADDRES01: string;
{var pAdapterInfo:PIP_ADAPTER_INFO;
    BufLen,Status:cardinal; i:Integer;}
begin
{  result:='';
  BufLen:= sizeof(IP_ADAPTER_INFO);
  GetAdaptersInfo(nil, BufLen);
  pAdapterInfo:= AllocMem(BufLen);
  try
    Status:= GetAdaptersInfo(pAdapterInfo,BufLen);
    if (Status <> ERROR_SUCCESS) then
    begin
      case Status of
        ERROR_NOT_SUPPORTED: raise exception.create('O(s) Adaptador(es)("MAC Address") deste computador não são/é suportado pelo sistema operacional em execução.');
        ERROR_NO_DATA: raise exception.create('Nenhum adaptador de rede no computador.');
      else
        raiselastOSerror;
      end;
      Exit;
    end;
    while (pAdapterInfo^.AddressLength=0) and (pAdapterInfo^.next<>nil) do
     pAdapterInfo:=pAdapterInfo.next;
    if pAdapterInfo^.AddressLength>0 then
    for i := 0 to pAdapterInfo^.AddressLength - 1 do
      result := result + IntToHex(pAdapterInfo^.Address[I], 2);
  finally
    Freemem(pAdapterInfo);
  end;}
end;

function TAgente.GetWinMAC_ADDRES02: string;
var
  ID1, ID2: TGUID;
  apiFunc: Function(GUID: PGUID): Longint; stdcall;
  dll:cardinal;
begin
  Result := '';
  dll := LoadLibrary('rpcrt4.dll');
  if dll <> 0 then
  begin
    @apiFunc := GetProcAddress(dll, 'UuidCreateSequential');
    if Assigned(apiFunc) then
    begin
      if (apiFunc(@ID1) = 0) and
      (apiFunc(@ID2) = 0) and
      (ID1.D4[2] = ID2.D4[2]) and
      (ID1.D4[3] = ID2.D4[3]) and
      (ID1.D4[4] = ID2.D4[4]) and
      (ID1.D4[5] = ID2.D4[5]) and
      (ID1.D4[6] = ID2.D4[6]) and
      (ID1.D4[7] = ID2.D4[7]) then
      begin
        Result :=
        IntToHex(ID1.D4[2], 2) +'.'+
        IntToHex(ID1.D4[3], 2) +'.'+
        IntToHex(ID1.D4[4], 2) +'.'+
        IntToHex(ID1.D4[5], 2) +'.'+
        IntToHex(ID1.D4[6], 2) +'.'+
        IntToHex(ID1.D4[7], 2);
      end;
    end;
  end;
end;

function TAgente.GetWinMOTHERBOARD: string;
var a, b, c, d: LongWord;
begin
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov a, EAX
    mov b, EBX
    mov c, ECX
    mov d, EDX
    pop EDX
    pop ECX
    pop EBX
    pop EAX
  end;
  result := inttohex(a, 8) +
            '-' + inttohex(b, 8) +
            '-' + inttohex(c, 8) +
            '-' + inttohex(d, 8);
end;

function TAgente.GetWinPC_NAME: string;
var
  PC: Pchar;
  Tamanho: Cardinal;
begin
  Result := '';
  Tamanho := 100;
  Getmem(PC, Tamanho);
  GetComputerName(PC, Tamanho);
  Result := PC;
  FreeMem(PC);
end;

function TAgente.GetWinSYS_OPER: string;
  Var SysOper : String;
begin
  SysOper := GetSOComputer01;
  if Length(Trim(SysOper)) <= 0 then
    SysOper := GetSOComputer02;
  Result := SysOper;
end;

function TAgente.GetWinUSER: string;
var
  BufSize: DWord;
  Buffer: PWideChar;
begin
 BufSize:= 1024;
 Buffer:= AllocMem(BufSize);
 try
  if GetUserName(Buffer, BufSize) then
      SetString(result, Buffer, BufSize)
 else
  RaiseLastOSError;
 finally
  FreeMem(Buffer);
 end;
end;

end.

