unit untProgressBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSkinManager,
  Vcl.StdCtrls, sEdit, sLabel, sButton, Vcl.CustomizeDlg,
  OverbyteIcsMultiProgressBar, IWProgressIndicator, Vcl.ComCtrls, acProgressBar;

type
  TfrmProgressBar = class(TForm)
    sSkinManager1: TsSkinManager;
    tmrProgressBar: TTimer;
    sPanel1: TsPanel;
    lblProgressBar: TsLabel;
    barProgressBar: TsProgressBar;
    procedure FormShow(Sender: TObject);
    procedure CarregaTelasLinguagem;
    procedure tmrProgressBarTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgressBar: TfrmProgressBar;

implementation
uses untdm, untprincipal, unttranslate, untlogin, untLibrary;
{$R *.dfm}

procedure TfrmProgressBar.FormShow(Sender: TObject);
begin
  barProgressBar.Position := 0;

  tmrProgressBar.Enabled := False;
  tmrProgressBar.Interval := 1000;
  tmrProgressBar.Enabled := True;

  CarregaTelasLinguagem;
end;

procedure TfrmProgressBar.tmrProgressBarTimer(Sender: TObject);
begin
  if TMyCaptureScreen.nThreadsRunning > 0 then
  begin
    if barProgressBar.Position >= 100 then
      barProgressBar.Position := 0;

    barProgressBar.Position := barProgressBar.Position + 10;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmProgressBar.CarregaTelasLinguagem;
begin
  lblProgressBar.Caption := APP_FRM_PROGRESSBAR_STATUS[ID_LANG];
end;

end.
