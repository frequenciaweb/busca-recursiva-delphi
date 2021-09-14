unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Datasnap.DBClient, SyncObjs, System.Threading;


type
  TForm1 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    edtDiretorio: TEdit;
    dsArquivos: TDataSource;
    cdsArquivos: TClientDataSet;
    cbTipoArquivo: TComboBox;
    Panel2: TPanel;
    btnCancelar: TButton;
    btnBuscar: TButton;
    btnExportar: TButton;
    SaveDialog1: TSaveDialog;
    Panel3: TPanel;
    edtDiretorioMoni: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    cdsArquivosDiretorio: TStringField;
    cdsArquivosArquivo: TStringField;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Recursiva(diretorio, tipoArquivo, diretorioMonitorado: string);
    procedure ExportarParaTexto(DataSet: TDataSet; Arq: string);
    procedure TratarArquivo(f: TSearchRec; diretorio: string);
  end;

var
  Form1: TForm1;
  Thread: TThread;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.btnBuscarClick(Sender: TObject);
begin
  btnExportar.Enabled := false;
  btnBuscar.Visible := false;
  btnCancelar.Visible := true;
  cdsArquivos.EmptyDataSet;
  StatusBar1.Panels[0].Text := 'Registros: (0)';
  StatusBar1.Panels[1].Text := 'Status: Buscando...';
  Thread := TThread.CreateAnonymousThread(
  procedure
  begin
    Self.Cursor := crSQLWait;
    Recursiva(edtDiretorio.Text, cbTipoArquivo.Text, edtDiretorioMoni.Text);
    Self.Cursor := crDefault;
    TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      StatusBar1.Panels[1].Text := 'Status: Finalizado';
      StatusBar1.Panels[2].Text := '';
      btnBuscar.Visible := true;
      btnCancelar.Visible := false;
      btnExportar.Enabled := true;
    end);
  end);
  Thread.Start();
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  btnExportar.Enabled := false;
  TerminateThread(Thread.Handle, 0);
  StatusBar1.Panels[1].Text := 'Status: Abortado';
  StatusBar1.Panels[2].Text := '';
  btnBuscar.Visible := true;
  btnCancelar.Visible := false;
end;

procedure TForm1.btnExportarClick(Sender: TObject);
begin
 btnExportar.Enabled := false;
 if SaveDialog1.Execute then
 begin
   ExportarParaTexto(cdsArquivos, SaveDialog1.FileName+'.csv');
 end;
  btnExportar.Enabled := true;
 ShowMessage('Concluido');
end;

procedure TForm1.ExportarParaTexto(DataSet: TDataSet; Arq: string);
var
  i: integer;
  sl: TStringList;
  st: string;
begin
  DataSet.First;
  sl := TStringList.Create;
  try
    st := '';
    for i := 0 to DataSet.Fields.Count - 1 do
      st := st + DataSet.Fields[i].DisplayLabel + ';';
    sl.Add(st);
    DataSet.First;
    while not DataSet.Eof do
    begin
      st := '';
      for i := 0 to DataSet.Fields.Count - 1 do
        st := st + DataSet.Fields[i].DisplayText + ';';
      sl.Add(st);
      DataSet.Next;
    end;
    sl.SaveToFile(Arq);
  finally
     sl.free;
  end;
end;

procedure TForm1.Recursiva(diretorio, tipoArquivo, diretorioMonitorado: string);
var
  F: TSearchRec;
  Ret: Integer;
begin
  if diretorio = '' then
  begin
    exit;
  end;
  StatusBar1.Panels[2].Text := 'Local: ('+diretorio+')';
  Ret := FindFirst(diretorio + '\*.*', faAnyFile or faArchive or
    faDirectory, F);
  try
    while Ret = 0 do
    begin
      if (F.Name = '.') or (F.Name = '..') then
      begin
        Ret := FindNext(F);
        Continue;
      end;
      if (F.Attr and faDirectory) <> 0 then
      begin
        Recursiva(IncludeTrailingPathDelimiter(diretorio + '\' + F.Name), tipoArquivo, diretorioMonitorado);
      end
      else
      begin
        if (Pos('.'+tipoArquivo, F.Name) > 0) then
        begin
         if (diretorioMonitorado <> '') then
         BEGIN
           if (pos(diretorioMonitorado, diretorio) > 0) then
           begin
             TratarArquivo(f, diretorio);
           end;
         END
         else
         begin
           TratarArquivo(f, diretorio);
         end;
        end;
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
end;

procedure TForm1.TratarArquivo(f: TSearchRec; diretorio: string);
begin
   TThread.Synchronize(TThread.CurrentThread,
   procedure
   begin
     cdsArquivos.Active := false;
     cdsArquivos.Open;
     cdsArquivos.Insert;
     cdsArquivos.FieldByName('Arquivo').Text := F.Name;
     cdsArquivos.FieldByName('Diretorio').Text := diretorio;
     cdsArquivos.Post;
     cdsArquivos.Active := true;
     Application.ProcessMessages;
     StatusBar1.Panels[0].Text := 'Registros: ('+intToStr(cdsArquivos.RecordCount)+')';
   end);
end;

end.
