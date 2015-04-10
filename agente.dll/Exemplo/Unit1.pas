unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  TDevice=class(TPersistent)
  private
    FIP   : WideString;
    FMask : WideString;
  public
    property IP  : WideString read FIP write FIP;
    property MASK: WideString read FMASK write FMASK;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    {Private declarations}
  public
    {Public declarations}
  end;

var
  Form1: TForm1;

implementation

procedure GetIPInfo(Stream :TMemoryStream); stdcall; external 'dll\Agente.dll';
procedure GetAdaptadorInfo(AdapterName : WideString; Var AdapterType, Description, Physicaladdress, Gateway, DHCP, DHCPServer,
                           SecondaryWINS, PrimaryWINS : WideString; Var Device : Array of  TDevice); stdcall; external 'dll\Agente.dll';

{  procedure GetIPInfo(Stream :TMemoryStream); stdcall; external '..\..\Agente.dll\Agente.dll';
  procedure GetAdaptadorInfo(AdapterName : WideString; Var AdapterType, Description, Physicaladdress, Gateway, DHCP, DHCPServer,
                             SecondaryWINS, PrimaryWINS : WideString; Var Device : Array of  TDevice); stdcall; external '..\Agente.dll';}

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Lst  : TStringList;
    IntI,
    IntJ : Integer;
    Memo : TMemoryStream;

    Device : Array[0..200] of TDevice;
    AdapterType,
    Description,
    Physicaladdress,
    Gateway,
    DHCP,
    DHCPServer,
    SecondaryWINS,
    PrimaryWINS : WideString;
begin
  Memo := TMemoryStream.Create;

  Lst := TStringList.Create;
  GetIPInfo(Memo);
  Memo.Position := 0;

  Lst.LoadFromStream(Memo);

  for IntI := 0 to Lst.Count-1 do
  Begin
    ShowMessage(Lst[IntI]);

    GetAdaptadorInfo(Lst[IntI],
                     AdapterType,
                     Description,
                     Physicaladdress,
                     Gateway,
                     DHCP,
                     DHCPServer,
                     SecondaryWINS,
                     PrimaryWINS,
                     Device);

  {  Teste;}
    ShowMessage('AdapterType: '+AdapterType+#13+
                'Description: '+Description+#13+
                'Physicaladdress: '+Physicaladdress+#13+
                'Gateway: '+Gateway+#13+
                'DHCP: '+DHCP+#13+
                'DHCPServer: '+DHCPServer+#13+
                'SecondaryWINS: '+SecondaryWINS+#13+
                'PrimaryWINS: '+PrimaryWINS);

    For IntJ := 0 to High(Device)-1 do
    begin
      if Device[IntJ] <> Nil then
        ShowMessage(Device[IntJ].IP+'...'+Device[IntJ].MASK);
    end;

  end;

end;

end.
