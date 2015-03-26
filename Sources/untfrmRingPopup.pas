unit untfrmRingPopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, acPNG,
  Vcl.StdCtrls, sLabel, sButton, Vcl.ImgList;

type
  TfrmRingPopup = class(TForm)
    sPanel1: TsPanel;
    cmdDesligar: TsButton;
    lblStatus: TsLabel;
    imgDisplay: TImage;
    cmdAtender: TsButton;
    imgList: TImageList;
    lblBina: TsLabel;
    imgDesligar: TImage;
    imgAtender: TImage;
    procedure FormCreate(Sender: TObject);
    procedure cmdAtenderClick(Sender: TObject);
    procedure cmdDesligarClick(Sender: TObject);
    procedure imgDesligarClick(Sender: TObject);
    procedure imgAtenderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRingPopup: TfrmRingPopup;

implementation

{$R *.dfm}

uses untPrincipal, untfrmdialpad, untdm;

procedure TfrmRingPopup.FormCreate(Sender: TObject);
var
  Hd: THandle;
begin
  Hd := CreateRoundRectRgn(0, 0, width, height, 20, 20);
  SetWindowRgn(Handle, Hd, True);
end;

procedure TfrmRingPopup.imgAtenderClick(Sender: TObject);
begin
  cmdAtenderClick(Nil);
end;

procedure TfrmRingPopup.imgDesligarClick(Sender: TObject);
begin
  cmdDesligarClick(Nil);
end;

procedure TfrmRingPopup.cmdAtenderClick(Sender: TObject);
begin
  frmRingPopup.Close;

  frmPrincipal.Show;
  frmPrincipal.framebar.OpenItem(0, True);
  Tfrmdialpad(frmPrincipal.framebar.items[0].frame).btnLigaClick(Self);
end;

procedure TfrmRingPopup.cmdDesligarClick(Sender: TObject);
begin
  frmRingPopup.Close;

  frmPrincipal.Show;

  if frmPrincipal.TMyVaxIncomingCallParam.bIncomingCall then
    if not frmPrincipal.TMyAppStatus.bAtendido then
      frmPrincipal.vax.RejectCall(frmPrincipal.TMyVaxIncomingCallParam.CallId);

  frmPrincipal.TMyVaxIncomingCallParam.sUniqueID := frmPrincipal.processacallername(frmPrincipal.TMyVaxIncomingCallParam.displayname, 3);
  frmPrincipal.TMyVaxIncomingCallParam.sFila     := frmPrincipal.processacallername(frmPrincipal.TMyVaxIncomingCallParam.displayname, 6);

  datam.qryUpdateRejectCall.Active := False;
  datam.qryUpdateRejectCall.SQL.Clear;
  datam.qryUpdateRejectCall.SQL.Add('insert into easy_rept_pabx_serv_fila_universal_ringnoanswer_hist ');
  datam.qryUpdateRejectCall.SQL.Add('(`data`,hora,uniqueid,is_tipo,easy_work_colaborador_conf_id,easy_pabx_serv_fila_universal_ctr_id) ');
  datam.qryUpdateRejectCall.SQL.Add('values ');
  datam.qryUpdateRejectCall.SQL.Add('(curdate(),curtime(),');
  datam.qryUpdateRejectCall.SQL.Add(QuotedStr(frmPrincipal.TMyVaxIncomingCallParam.sUniqueID) + ',');
  datam.qryUpdateRejectCall.SQL.Add('1,');
  datam.qryUpdateRejectCall.SQL.Add(QuotedStr(frmPrincipal.TMyInfoLogin.sIDUsuario) + ',');
  datam.qryUpdateRejectCall.SQL.Add(QuotedStr(frmPrincipal.TMyVaxIncomingCallParam.sFila) + ')');
  datam.qryUpdateRejectCall.ExecSQL;
  datam.qryUpdateRejectCall.Active := False;

  frmPrincipal.TMyVaxIncomingCallParam.sUniqueID := '';
  frmPrincipal.TMyVaxIncomingCallParam.sFila     := '';

  frmPrincipal.Desligar('A');
end;

end.