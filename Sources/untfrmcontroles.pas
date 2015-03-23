unit untfrmcontroles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sBevel,
  Vcl.StdCtrls, sCheckBox, sLabel,  Vcl.ComCtrls, sTrackBar, acProgressBar, inifiles;

type
  Tfrmcontroles = class(TFrame)
    sWebLabel1: TsWebLabel;
    sWebLabel2: TsWebLabel;
    cbmudo: TsCheckBox;
    sBevel1: TsBevel;
    tbvolumeout: TsTrackBar;
    tbvolumein: TsTrackBar;
    cbdnd: TsCheckBox;
    procedure cbmudoClick(Sender: TObject);
    procedure tmmudoTimer(Sender: TObject);
    procedure tbvolumeoutChange(Sender: TObject);
    procedure tbvolumeinChange(Sender: TObject);
    procedure tmdndTimer(Sender: TObject);
  private
    varqini: tinifile;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses untprincipal;
{$R *.dfm}

procedure Tfrmcontroles.cbmudoClick(Sender: TObject);
begin
{  if cbmudo.checked = true then
  begin
    frmprincipal.dtmudo := now;
  end
  else
  begin
    lbmudo.caption := '00:00:00';
  end;
  tmmudo.enabled := cbmudo.checked;}

end;


procedure Tfrmcontroles.tbvolumeinChange(Sender: TObject);
begin
  frmprincipal.Vax.SetSpkVolume((10 - tbvolumein.Position) * 25);

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.Writeinteger('Controle','volumein',tbvolumein.Position);
  varqini.free;
end;

procedure Tfrmcontroles.tbvolumeoutChange(Sender: TObject);
begin
  frmprincipal.Vax.SetmicVolume((10 - tbvolumeout.Position) * 25);

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.Writeinteger('Controle','volumeout',tbvolumeout.Position);
  varqini.free;

end;

procedure Tfrmcontroles.tmdndTimer(Sender: TObject);
begin
  frmprincipal.vax.EnableDonotDisturb; // 10/02/2011
end;

procedure Tfrmcontroles.tmmudoTimer(Sender: TObject);
begin
  //lbmudo.caption := timetostr(frmprincipal.dtmudo-now);
end;

end.
