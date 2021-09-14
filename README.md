# busca-recursiva-delphi

## Prints

![Alt text](/../main/printscreen/Captura01.PNG?raw=true "Exemplo")
![Alt text](/../main/printscreen/Captura02.PNG?raw=true "Exemplo")


## Usage



```
procedure TForm1.Recursiva(diretorio, tipoArquivo: string);
var
  F: TSearchRec;
  Ret: Integer;
begin
  if diretorio = '' then
  begin
    exit;
  end;  
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
        Recursiva(IncludeTrailingPathDelimiter(diretorio + '\' + F.Name), tipoArquivo);
      end
      else
      begin
        if (Pos('.'+tipoArquivo, F.Name) > 0) then
        begin          
            cdsArquivos.Active := false;
            cdsArquivos.Open;
            cdsArquivos.Insert;
            cdsArquivos.FieldByName('Arquivo').Text := F.Name;
            cdsArquivos.FieldByName('Diretorio').Text := diretorio;
            cdsArquivos.Post;
            cdsArquivos.Active := true;                      
        end;
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
end;

 ```

