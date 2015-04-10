unit uAgente;
interface
  Uses Windows, IpHlpApi, IpTypes, IpIfConst, inifiles, Classes, SysUtils, Dialogs;

Type
  TDevice=class(TPersistent)
  private
    FIP   : WideString;
    FMask : WideString;
  public
    property IP  : WideString read FIP write FIP;
    property MASK: WideString read FMASK write FMASK;
  end;

  procedure GetIPInfo(Stream :TMemoryStream); stdcall;
  procedure GetAdaptadorInfo(AdapterName : WideString; Var AdapterType, Description, Physicaladdress, Gateway, DHCP, DHCPServer,
                             SecondaryWINS, PrimaryWINS : WideString; Var Device : Array of  TDevice); stdcall;


implementation

procedure GetIPInfo(Stream :TMemoryStream); stdcall;
var
  FixedInfoSize, Err, AdapterInfoSize:DWORD;
  pFixedInfo:PFIXED_INFO;
  pAdapterInfo, pAdapt:PIP_ADAPTER_INFO;
  pAddrStr:PIP_ADDR_STRING;
  Lista : TStringList;
begin

  Lista := TStringList.Create;
  FixedInfoSize:=0;

  pFixedInfo:=PFIXED_INFO(GlobalAlloc(GPTR, FixedInfoSize));
  GetNetworkParams(pFixedInfo, FixedInfoSize);

  //Get Adapter Info
  AdapterInfoSize:=0;
  Err:=GetAdaptersInfo(nil, AdapterInfoSize);

  if (Err<>0) and (Err<>ERROR_BUFFER_OVERFLOW) then
  begin
    Lista.Add('Error');
    exit;
  end;

  pAdapterInfo := PIP_ADAPTER_INFO(GlobalAlloc(GPTR, AdapterInfoSize));
  GetAdaptersInfo(pAdapterInfo, AdapterInfoSize);
  pAdapt := pAdapterInfo;

  while pAdapt<>nil do
  begin
    case pAdapt.Type_ of
      MIB_IF_TYPE_ETHERNET:
        Lista.Add('Ethernet adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_TOKENRING:
        Lista.Add('Token Ring adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_FDDI:
        Lista.Add('FDDI adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_PPP:
        Lista.Add('PPP adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_LOOPBACK:
        Lista.Add('Loopback adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_SLIP:
        Lista.Add('Slip adapter '+pAdapt.AdapterName);
      MIB_IF_TYPE_OTHER:
        Lista.Add('Other adapter '+pAdapt.AdapterName);
    end;
    pAdapt := pAdapt.Next;
  end;

  Lista.SaveToStream(Stream);

  GlobalFree(Cardinal(pFixedInfo));
end;

procedure GetAdaptadorInfo(AdapterName : WideString; Var AdapterType, Description, Physicaladdress, Gateway, DHCP, DHCPServer,
                           SecondaryWINS, PrimaryWINS : WideString; Var Device : Array of TDevice);

var
   Err,
   AdapterInfoSize :DWORD;
   pAdapterInfo,
   pAdapt          :PIP_ADAPTER_INFO;
   Str             :String;
   i               :Integer;
   pAddrStr        :PIP_ADDR_STRING;
   IInc            : Integer;
begin
  AdapterInfoSize:=0;
  Err:=GetAdaptersInfo(nil, AdapterInfoSize);

  if (Err<>0) and (Err<>ERROR_BUFFER_OVERFLOW) then
    exit;

  pAdapterInfo := PIP_ADAPTER_INFO(GlobalAlloc(GPTR, AdapterInfoSize));
  GetAdaptersInfo(pAdapterInfo, AdapterInfoSize);
  pAdapt := pAdapterInfo;

  while pAdapt<>nil do
  begin
    case pAdapt.Type_ of
      MIB_IF_TYPE_ETHERNET:
       Str:='Ethernet adapter ';
      MIB_IF_TYPE_TOKENRING:
       Str:='Token Ring adapter ';
      MIB_IF_TYPE_FDDI:
       Str:='FDDI adapter ';
      MIB_IF_TYPE_PPP:
       Str:='PPP adapter ';
      MIB_IF_TYPE_LOOPBACK:
       Str:='Loopback adapter ';
      MIB_IF_TYPE_SLIP:
       Str:='Slip adapter ';
      MIB_IF_TYPE_OTHER:
       Str:='Other adapter ';
    end;

    if Str+pAdapt.AdapterName<>AdapterName then
    begin
      pAdapt := pAdapt.Next;
      Continue;
    end;

    AdapterType :=Str;
    Description :=pAdapt.Description;

    Str:='';
    for i:=0 to pAdapt.AddressLength-1 do
    begin
      Str:=Str+IntToHex(pAdapt.Address[i],2);
      if i<>Integer(pAdapt.AddressLength-1) then
        Str:=Str+'-';
    end;
    Physicaladdress :=Str;

    IInc := 0;
    pAddrStr:=@pAdapt.IpAddressList;

    while pAddrStr<>nil do
    begin
     Device[IInc] := TDevice.Create;

     Device[IInc].IP   := pAddrStr.IpAddress.S;
     Device[IInc].MASK := pAddrStr.IpMask.S;
     Inc(IInc);
     pAddrStr := pAddrStr.Next;
    end;

    if pAdapt.DhcpEnabled=0 then
     DHCP :='no'
    else
     DHCP :='yes';

    DHCPServer    := pAdapt.DhcpServer.IpAddress.S;
    PrimaryWINS   := pAdapt.PrimaryWinsServer.IpAddress.S;
    SecondaryWINS := pAdapt.SecondaryWinsServer.IpAddress.S;
    Gateway       := pAdapt.GatewayList.IpAddress.S;
    break;
  end;
  GlobalFree(Cardinal(pAdapterInfo));
end;

end.
