unit untChatReadThread;

interface

uses
  Classes, SysUtils, Windows, ZDataset, ZConnection;

type
  //Thread para envio de arquivos automaticamente
  TAutoSendFilesThread = class(TThread)
  private
    sThreadMsgLog: String;
  protected
    procedure Execute; override;
    procedure MostraLog;
    procedure UpdateThreadCount;
    function InsertDB(nSeq: Integer; sDst: String; sFile: String; nIdUsr: Integer): Boolean;
  public
    nIDUser: Integer;

    sSrcDir        : String;
    sSrcFile       : String;
    nSplitMaxNumber: Integer;
    sFileFormat    : String;
    sDstDir        : String;

    sDBHostname: String;
    sDBDatabase: String;
    sDBUser    : String;
    sDBPassword: String;
    nDBPort    : Integer;
  end;

implementation

uses untPrincipal, unttranslate;

procedure TAutoSendFilesThread.Execute;
var
  nFor: Integer;
  sTmpSrc: String;
  sTmpDst: String;
  bRet: Boolean;
  nTryCount: Integer;
  nTryCountBD: Integer;
  bMoveOk: Boolean;
  bBDOk: Boolean;
begin
  try
    try
      for nFor := 0 to nSplitMaxNumber do
      begin
        sTmpSrc := sSrcDir + sSrcFile + IntToStr(nFor) + sFileFormat;

        sDstDir := PChar(StringReplace(sDstDir, '/', '\', [rfReplaceAll, rfIgnoreCase]));
        if not DirectoryExists(sDstDir) then
        begin
          ForceDirectories(sDstDir);
        end;
        sTmpDst := sDstDir + sSrcFile + IntToStr(nFor) + sFileFormat;

        bMoveOk := False;
        for nTryCount := 1 to 3 do
        begin
          Sleep(1000);//Wait 1 second to start copy...

          bRet := MoveFile(PChar(sTmpSrc), PChar(sTmpDst));
          if bRet = True then
          begin
            bBDOk := False;
            for nTryCountBD := 1 to 3 do
            begin
              //Insert DB
              if InsertDB(nFor, sDstDir, sSrcFile + IntToStr(nFor) + sFileFormat, nIDUser) then
              begin
                bBDOk := True;
                Break;
              end;
            end;

            if bBDOk = False then
            begin
              sThreadMsgLog := APP_FRM_PROGRESSBAR_ERRBD[ID_LANG];
              Synchronize(MostraLog);
            end;

            bMoveOk := True;
            break;
          end;
        end;//for nTryCount := 1 to 3 do

        if bMoveOk = False then
        begin
          sThreadMsgLog := APP_FRM_PROGRESSBAR_ERR1[ID_LANG];
          Synchronize(MostraLog);
        end;
      end;//for nFor := 0 to nSplitMaxNumber do
    except
      sThreadMsgLog := APP_FRM_PROGRESSBAR_ERR2[ID_LANG];
      Synchronize(MostraLog);
    end;
    Synchronize(UpdateThreadCount);
  except
    sThreadMsgLog := APP_FRM_PROGRESSBAR_ERR3[ID_LANG];
    Synchronize(MostraLog);
  end;
end;

procedure TAutoSendFilesThread.MostraLog;
begin
  try
    frmPrincipal.Mensagem(sThreadMsgLog);
  except
  end;
end;

procedure TAutoSendFilesThread.UpdateThreadCount;
begin
  try
    Dec(frmPrincipal.TMyCaptureScreen.nThreadsRunning);
  except
    sThreadMsgLog := APP_FRM_PROGRESSBAR_ERRCNT[ID_LANG];
    Synchronize(MostraLog);
  end;
end;

function TAutoSendFilesThread.InsertDB(nSeq: Integer; sDst: String; sFile: String; nIdUsr: Integer): Boolean;
var
  conInsertIntoAutoSendFilesThread: TZConnection;
  qryInsertIntoAutoSendFilesThread: TZQuery;
begin
  try
    conInsertIntoAutoSendFilesThread := TZConnection.Create(Nil);
    conInsertIntoAutoSendFilesThread.Disconnect;
    conInsertIntoAutoSendFilesThread.LoginPrompt := False;
    conInsertIntoAutoSendFilesThread.Protocol    := 'mysql-5';

    conInsertIntoAutoSendFilesThread.Hostname := sDBHostname;
    conInsertIntoAutoSendFilesThread.Database := sDBDatabase;
    conInsertIntoAutoSendFilesThread.User     := sDBUser;
    conInsertIntoAutoSendFilesThread.Password := sDBPassword;
    conInsertIntoAutoSendFilesThread.Port     := nDBPort;
    conInsertIntoAutoSendFilesThread.Connect;

    qryInsertIntoAutoSendFilesThread            := TZQuery.Create(Nil);
    qryInsertIntoAutoSendFilesThread.Active     := False;
    qryInsertIntoAutoSendFilesThread.Connection := conInsertIntoAutoSendFilesThread;
    qryInsertIntoAutoSendFilesThread.SQL.Clear;
    qryInsertIntoAutoSendFilesThread.SQL.Add('insert into easy_qual_record_screen_hist ');
    qryInsertIntoAutoSendFilesThread.SQL.Add('(cdata, sequencia, is_conf_screen_path, is_record_screen_path, easy_work_colaborador_conf_id) ');
    qryInsertIntoAutoSendFilesThread.SQL.Add('values (now(), ');
    qryInsertIntoAutoSendFilesThread.SQL.Add(IntToStr(nSeq) + ', ');
    qryInsertIntoAutoSendFilesThread.SQL.Add(QuotedStr(sDst) + ', ');
    qryInsertIntoAutoSendFilesThread.SQL.Add(QuotedStr(sFile) + ', ');
    qryInsertIntoAutoSendFilesThread.SQL.Add(IntToStr(nIdUsr) + ')');
    qryInsertIntoAutoSendFilesThread.ExecSQL;
    qryInsertIntoAutoSendFilesThread.Active := False;

    qryInsertIntoAutoSendFilesThread.Close;
    conInsertIntoAutoSendFilesThread.Disconnect;

    qryInsertIntoAutoSendFilesThread.Free;
    conInsertIntoAutoSendFilesThread.Free;

    Result := True;
  except
    Result := False;
  end;
end;

end.
