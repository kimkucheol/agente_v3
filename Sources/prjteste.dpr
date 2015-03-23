program prjteste;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmprincipal},
  untdm in 'untdm.pas' {datam: TDataModule},
  untlogin in 'untlogin.pas' {frmlogin},
  untfrmdialpad in 'untfrmdialpad.pas' {frmdialpad: TFrame},
  untfrmpausa in 'untfrmpausa.pas' {frmpausa: TFrame},
  untfrmconfiguracoes in 'untfrmconfiguracoes.pas' {frmconfiguracoes: TFrame},
  untfrmclassifica in 'untfrmclassifica.pas' {frmclassifica: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdatam, datam);
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.Run;
end.
