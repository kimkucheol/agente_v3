unit untdm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZStoredProcedure;

type
  Tdatam = class(TDataModule)
    con_connect: TZConnection;
    qryLogin: TZQuery;
    qr_carrega_pausa: TZQuery;
    qr_verifica_pausa: TZQuery;
    qr_carrega_sites: TZQuery;
    qry_carrega_class_fila: TZQuery;
    qryGravaClassificacao: TZQuery;
    qryTempoFila: TZQuery;
    qr_verifica_logoff: TZQuery;
    qr_carrega_integrador: TZQuery;
    qry_has_fila: TZQuery;
    qr_update_pausa_restritiva: TZQuery;
    qr_verifica_pausa_restritiva: TZQuery;
    qr_verifica_pausa_quantidade: TZQuery;
    qr_carrega_xfer_ura: TZQuery;
    qryCarregaXFerFila: TZQuery;
    qryVerificaLoginAtivo: TZQuery;
    qry_operacao_has_parametros: TZQuery;
    qry_carrega_LogCallStep: TZQuery;
    qry_carrega_class_operacao: TZQuery;
    qryCarregaXFerRamal: TZQuery;
    qr_carrega_xfer_pesquisa: TZQuery;
    qryChatQueue: TZQuery;
    conChatQueue: TZConnection;
    qryChatCarrega: TZQuery;
    qryChatCarregaRespGrupo: TZQuery;
    qryChatCarregaResp: TZQuery;
    qryChangePass: TZQuery;
    qryChatUpdateDash: TZQuery;
    dtsChatPesquisaHist: TDataSource;
    qryChatPesquisaHist: TZQuery;
    qryChatPesquisaHistMsg: TZQuery;
    qryUpdateStatus: TZQuery;
    qrySistemaVersao: TZQuery;
    qryFaqConf: TZQuery;
    qry_nregistro_hist: TZQuery;
    qryConferencia: TZQuery;
    qryConferenciaTipo: TZQuery;
    qry_has_pause: TZQuery;
    qry_has_classif_fila: TZQuery;
    qry_has_pausarestritiva: TZQuery;
    qryLoginSup: TZQuery;
    qryChatCarregaConf: TZQuery;
    qryCarregaCoaching: TZQuery;
    qryUpdateCoaching: TZQuery;
    qryCarregaFilas: TZQuery;
    qrySistemaLogado: TZQuery;
    qr_carrega_xfer_virtual: TZQuery;
    qryCentroCusto: TZQuery;
    qryAtualizaQualidade: TZQuery;
    qr_carrega_xfer_consulta: TZQuery;
    qryCarregaLoja: TZQuery;
    qryUpdateRejectCall: TZQuery;
    qryCarregaEMails: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datam: Tdatam;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
