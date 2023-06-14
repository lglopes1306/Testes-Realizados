unit dtmECAD;

interface

uses
  System.SysUtils, System.Classes, DBXDevartOracle, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TECAD = class(TDataModule)
    qryAutores: TSQLQuery;
    qryAlterar: TSQLQuery;
    dspAutor: TDataSetProvider;
    cdtsAutor: TClientDataSet;
    dtsAutor: TDataSource;
    qryAutoresNOME: TWideStringField;
    qryAutoresNOME_ARTISTICO: TWideStringField;
    qryAutoresCPF: TWideStringField;
    qryAutoresRG: TWideStringField;
    qryAutoresBANCO: TWideStringField;
    qryAutoresAGENCIA: TWideStringField;
    qryAutoresCONTA: TWideStringField;
    qryAutoresIDAUTOR: TFMTBCDField;
    qryMusica: TSQLQuery;
    qryMusicaNOME: TWideStringField;
    qryMusicaNACIONALIDADE: TWideStringField;
    qryMusicaDT_INSCRICAO: TSQLTimeStampField;
    qryMusicaIDMUSICA: TFMTBCDField;
    dspMusica: TDataSetProvider;
    cdtsMusica: TClientDataSet;
    dtsMusica: TDataSource;
    dspExec_Musica: TDataSetProvider;
    qryExec_Musica: TSQLQuery;
    cdtsExec_Musica: TClientDataSet;
    dtsExec_Musica: TDataSource;
    qryExec_MusicaID: TFMTBCDField;
    qryExec_MusicaIDMUSICA: TFMTBCDField;
    qryExec_MusicaNOME: TWideStringField;
    qryExec_MusicaDT_TOCOU: TSQLTimeStampField;
    qryExec_MusicaQTDE: TFMTBCDField;
    ConnectionECAD: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ECAD: TECAD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TECAD.DataModuleCreate(Sender: TObject);
begin
    ConnectionECAD.Connected:= True;
end;


end.
