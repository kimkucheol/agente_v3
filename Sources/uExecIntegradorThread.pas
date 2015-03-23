unit uExecIntegradorThread;

interface

uses
  Classes, SysUtils, Windows, ShellAPI;

type
  //Thread para chamar as rotinas de integrador
  TExecIntegradorThread = class(TThread)
  private
    sThreadNavigateURL: String;
    sThreadMsgLog: String;
  protected
    procedure Execute; override;
    procedure Navigate;
    procedure MostraLog;
  public
    nTipoIntegrador : Integer;
    sDest           : String;
    sText           : String;
    sIPPABX         : String;
  end;

implementation

uses untPrincipal, unttranslate;

procedure TExecIntegradorThread.Execute;
var
  sDir: String;
  tfArq: TextFile;
begin
  try
    case nTipoIntegrador of
      0://'ARQ':
      begin
        try
          //Criando diretório*****************************************************
          sDir := sDest;
          if not DirectoryExists(sDir) then
          begin
            ForceDirectories(sDir);
          end;
          //**********************************************************************
          AssignFile(tfArq, sDir + '\INTEGRADOR.CFG');
          //if FileExists(dir + '\INTEGRADOR.CFG') then
          //begin
            //Append(arq);
          //end;
          Rewrite(tfArq);
          WriteLn(tfArq, sText);
        finally
          CloseFile(tfArq);
        end;
      end;

      1://'APL':
      begin
        ShellExecute(Handle, 'open', PChar(StringReplace(sDest, '/', '\', [rfReplaceAll, rfIgnoreCase])), PChar(sText), nil, SW_SHOWNORMAL);
      end;

      2://'HTTP':
      begin
        sDest := StringReplace(sDest, '${SERVIDOR_HTTP}', sIPPABX, [rfReplaceAll, rfIgnoreCase]);
        ShellExecute(Handle, 'open', PChar(sDest + sText), '', nil, SW_SHOWNORMAL);
      end;

      3://'POSTURL'
      begin
        try
          sThreadNavigateURL := sDest + sText;
          Synchronize(Navigate);
        except
          sThreadMsgLog := APP_MB_ERR_CANNOT_NAVIGATE[ID_LANG];
          Synchronize(MostraLog);
        end;
      end;
    end;
  except
    sThreadMsgLog := APP_MB_ERR_THREADEXEC_INTEGRA[ID_LANG];
    Synchronize(MostraLog);
  end;
end;

procedure TExecIntegradorThread.Navigate;
begin
  try
    frmPrincipal.webExecNavigate.Navigate(PChar(sThreadNavigateURL){'http://vpn.hosannatecnologia.com.br/url.php?agent=0000&phone=1111&data1=2222'});
  except
  end;
end;

procedure TExecIntegradorThread.MostraLog;
begin
  try
    frmPrincipal.Mensagem(sThreadMsgLog);
  except
  end;
end;

end.
