unit untfrmconfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, sComboBoxes, acShellCtrls, sLabel, sListView, sComboBox, inifiles;

type
  TfrmConfiguracoes = class(TFrame)
    sLabel1: TsLabel;
    cbskin: TsComboBox;
    procedure ListarArquivos(Diretorio: string; Sub:Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure cbskinChange(Sender: TObject);
  private
    varqini: tinifile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses untPrincipal;

{ Tfrmconfiguracoes }

procedure TfrmConfiguracoes.cbskinChange(Sender: TObject);
begin
  frmprincipal.sSkinManager1.SkinName := cbskin.Text;
  try
    frmprincipal.sSkinManager1.RepaintForms(true);
  except
  end;

  vArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  varqini.Writestring('Configuracoes','skin',cbskin.Text);
  varqini.free;
end;

procedure TfrmConfiguracoes.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);

  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            ListarArquivos(TempNome, True);
          end;
      end
      else
      begin
        cbskin.items.Add(copy(F.Name,1,pos('.',F.name)-1));
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

function TfrmConfiguracoes.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

end.
