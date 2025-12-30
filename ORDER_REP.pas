unit ORDER_REP;

interface
var OrderFieldName:string;
    SverkaFieldName:string;

 procedure OrderExcelPrint(ID_NAKLCAP:longint; is_show:boolean; v_ID_DOC_TYPE:longint);

// procedure OrderExcelPrint_1(ID_NAKLCAP:longint; is_show:boolean; v_ID_DOC_TYPE:longint);

implementation
uses dm_orders, myfuncs, main_f, Excel2000, Variants, OleServer, Windows, SysUtils, ComObj,
Math;


procedure OrderExcelPrint(ID_NAKLCAP:longint; is_show:boolean; v_ID_DOC_TYPE:longint);
var RangeE:Excel2000.ExcelRange;
Last_RangeE, First_RangeE, First_RangeE1:Excel2000.ExcelRange;
var i_row, i: integer;
WorkBk: _WorkBook;
WorkSheet: _WorkSheet;
ExcelApplication1: TExcelApplication;
name_file:string;
name_doc_print, name_D, name_K:string;
//d_now:TDateTime;
begin
name_file:='order';
name_doc_print:='Заказ';
name_D := 'Заказчик';
name_K := 'Поставщик';

 if v_ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_TNP then
    begin
      name_file:='order';
      name_doc_print:='Заказ';
      name_D := 'Заказчик';
      name_K := 'Поставщик';
    end;

    if v_ID_DOC_TYPE=сID_DOC_TYPE_Prihod_TNP_Nakl then
     begin
        name_file:='prihod';
        name_doc_print:='Приход';
        name_D := 'Получатель';
        name_K := 'Поставщик';
     end;
     if v_ID_DOC_TYPE=сID_DOC_TYPE_Vozvrat_TNP then
     begin
        name_file:='vozvr';
        name_doc_print:='Возврат поставщику';
        name_D := 'Поставщик';
        name_K := 'Грузоотправитель';
     end;

//d_now:=Now;

//name_file:=name_file+FloatToStr(d_now)+'_'+IntToStr(ID_NAKLCAP)+'.xls';
name_file:=name_file+IntToStr(ID_NAKLCAP)+'.xls';
OrderFieldName:=  GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+name_file;
DeleteFile(OrderFieldName);

ExcelApplication1:= TExcelApplication.Create(F_main);
ExcelApplication1.ConnectKind := ckNewInstance;
ExcelApplication1.Connect;
ExcelApplication1.AutoQuit := false;
ExcelApplication1.Workbooks.Add(EmptyParam,LOCALE_USER_DEFAULT);
ExcelApplication1.Visible[LOCALE_USER_DEFAULT] := false;

i_row:=1;

RangeE:=ExcelApplication1.ActiveCell;
WorkBk := ExcelApplication1.Workbooks.Item[1];
WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;
RangeE:= Worksheet.Range['A1',Worksheet.Cells.Item[1,1]];

with DM1.QOrder_Cap do
begin
Close;
Parameters[0].Value := ID_NAKLCAP;
Open;
First;

// RangeE.Value:='Заказ № '+FieldByName('NN').AsString+' на '+ dateToStr(FieldByName('D').AsFloat);
RangeE.Value:=name_doc_print;
RangeE:=RangeE.Next;
RangeE:=RangeE.Next;
RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('NN').AsString;
RangeE:=RangeE.Next;
RangeE.Value:=' от ';
RangeE:=RangeE.Next;
RangeE.Font.Bold:=true;
RangeE.Value:=dateToStr(FieldByName('D').AsFloat);

Inc(i_row);
RangeE:= Worksheet.Range['A'+IntToStr(i_row), 'A'+IntToStr(i_row)];

// RangeE.Value:='Заказчик - '+FieldByName('CLI_D').AsString;
RangeE.Value:=name_D;
RangeE:=RangeE.Next;
RangeE:=RangeE.Next;
RangeE.Value:='Код';

Inc(i_row);
RangeE:= Worksheet.Range['A'+IntToStr(i_row), 'A'+IntToStr(i_row)];
 RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('CLI_D').AsString;
RangeE:=RangeE.Next;
RangeE:=RangeE.Next;
RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('ID_CLI_D').AsString;
RangeE:=RangeE.Next;
RangeE:= Worksheet.Range['D'+IntToStr(i_row), 'F'+IntToStr(i_row)];
RangeE.MergeCells := True;
RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('ADRES').AsString;
RangeE:= Worksheet.Range['G'+IntToStr(i_row), 'H'+IntToStr(i_row)];
RangeE.MergeCells := True;
RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('AUX_INFO').AsString;

Inc(i_row);
RangeE:= Worksheet.Range['A'+IntToStr(i_row),'A'+IntToStr(i_row)];

// RangeE.Value:='Поставщик - '+FieldByName('CLI_K').AsString;
RangeE.Value:=name_K;
RangeE:=RangeE.Next;
RangeE:=RangeE.Next;
RangeE.Value:='Код';

Inc(i_row);
RangeE:= Worksheet.Range['A'+IntToStr(i_row), 'A'+IntToStr(i_row)];
 RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('CLI_K').AsString;
RangeE:=RangeE.Next;
RangeE:=RangeE.Next;
RangeE.Font.Bold:=true;
RangeE.Value:=FieldByName('ID_CLI_K').AsString;


Close;
end;  // with DM1.QOrder_Cap do

with DM1.QOrder_Tov do
begin
Close;
Parameters[0].Value := ID_NAKLCAP;
Open;


Inc(i_row,2);
 RangeE:=ExcelApplication1.Range['A'+IntToStr(i_row),'A'+IntToStr(i_row)];
 First_RangeE:=RangeE;
 First_RangeE1:=RangeE;
 RangeE.ColumnWidth:=6;
 RangeE.Value:='№ п/п';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=30;
 RangeE.Value:='Группа товара';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=50;
 RangeE.Value:='Товар';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=10;
 RangeE.Value:='Код';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=6;
 RangeE.Value:='Ед.изм';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=12;
 RangeE.Value:='Количество';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=12;
 RangeE.Value:='Цена без НДС';
 RangeE:=RangeE.Next;

 RangeE.ColumnWidth:=12;
 RangeE.Value:='Сумма без НДС';
 RangeE:=RangeE.Next;
 Last_RangeE:=RangeE;


  RangeE:=ExcelApplication1.Range[First_RangeE, Last_RangeE];

  With RangeE do
  begin
        Font.Bold:=True;
        RowHeight := 100;

        HorizontalAlignment := xlCenter;
        VerticalAlignment := xlCenter;
        WrapText := True;
        Orientation := 0;
        AddIndent := False;
        IndentLevel := 0;
        ShrinkToFit := False;
        ReadingOrder := xlContext;
        MergeCells := False;
  end;


  first;
 i:=1;
 while not eof do
 begin
  Inc(i_row);
  RangeE:=ExcelApplication1.Range['A'+IntToStr(i_row),'A'+IntToStr(i_row)];

  RangeE.NumberFormat:='0';
  RangeE.Value:=i;
  RangeE:=RangeE.Next;

  RangeE.Value:=FieldByName('GRUPTOV').AsString;
  RangeE:=RangeE.Next;

  RangeE.Value:=FieldByName('NAME').AsString;
  RangeE:=RangeE.Next;

  RangeE.Value:=FieldByName('ID_TOV').AsString;
  RangeE:=RangeE.Next;

  RangeE.Value:=FieldByName('EDIZM').AsString;
  RangeE:=RangeE.Next;

  RangeE.NumberFormat:='0,000';
  RangeE.Value:=FieldByName('NUMB').AsFloat;
  RangeE:=RangeE.Next;

  RangeE.NumberFormat:='0,000';
  RangeE.Value:=FieldByName('PRICE').AsFloat;
  RangeE:=RangeE.Next;

  RangeE.NumberFormat:='0,000';
  // RangeE.Value:=FieldByName('NUMB').AsFloat*FieldByName('PRICE').AsFloat;
  RangeE.FormulaR1C1 := '=RC[-2]*RC[-1]';

  inc(i);
  next;
 end;

 Last_RangeE:=RangeE;
 RangeE:=ExcelApplication1.Range[First_RangeE1.Cells, Last_RangeE.Cells];
  try
  RangeE.Borders[xlDiagonalDown].LineStyle := xlNone;
    RangeE.Borders[xlDiagonalUp].LineStyle := xlNone;
    With RangeE.Borders[xlEdgeLeft] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;

    With RangeE.Borders[xlEdgeTop] do
     begin
        LineStyle := xlContinuous ;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeBottom] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeRight]  do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;


     With RangeE.Borders[xlInsideVertical]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;

      With RangeE.Borders[xlInsideHorizontal]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;
      except
      ;
      end;
      Inc(i_row);
      RangeE:=ExcelApplication1.Range['F'+IntToStr(i_row),'F'+IntToStr(i_row)];
      RangeE.Font.Bold:=true;
      RangeE.Value:='Итого без НДС:';
      RangeE:=RangeE.Next;
      RangeE:=RangeE.Next;
      RangeE.Font.Bold:=true;
      RangeE.NumberFormat:='0,000';
      RangeE.FormulaR1C1:='=SUM(R[-'+IntToStr(DM1.QOrder_Tov.RecordCount)+']C:R[-1]C)';

      Inc(i_row);
      RangeE:=ExcelApplication1.Range['F'+IntToStr(i_row),'F'+IntToStr(i_row)];
      RangeE.Font.Bold:=true;
      RangeE.Value:='НДС:';
      RangeE:=RangeE.Next;
      RangeE:=RangeE.Next;
      RangeE.Font.Bold:=true;
      RangeE.NumberFormat:='0,000';
      RangeE.Value:=0.0;

      Inc(i_row);
      RangeE:=ExcelApplication1.Range['F'+IntToStr(i_row),'F'+IntToStr(i_row)];
      RangeE.Font.Bold:=true;
      RangeE.Value:='Всего с НДС:';
      RangeE:=RangeE.Next;
      RangeE:=RangeE.Next;
      RangeE.Font.Bold:=true;
      RangeE.NumberFormat:='0,000';
      RangeE.FormulaR1C1 := '=R[-2]C+R[-1]C';
   Close;

end; // with DM1.QOrder_Tov do

ExcelApplication1.DisplayAlerts[LOCALE_USER_DEFAULT]:= True;  //отключить предупреждения что такой файл уже есть
WorkBk.SaveAs(OrderFieldName ,xlNormal,
  '','',false, false,xlNoChange, xlUserResolution, False, False, 0, 0);
ExcelApplication1.DisplayAlerts[LOCALE_USER_DEFAULT]:= True;

ExcelApplication1.Visible[LOCALE_USER_DEFAULT]:=is_show;
if  not is_show then ExcelApplication1.Quit;
ExcelApplication1.Disconnect;
ExcelApplication1.Free;


end; // procedure OrderExcelPrint(ID_NAKLCAP:longint);




procedure OrderExcelPrint_1(ID_NAKLCAP:longint; is_show:boolean; v_ID_DOC_TYPE:longint);
var RangeE:Excel2000.ExcelRange;
Last_RangeE, First_RangeE, First_RangeE1:Excel2000.ExcelRange;
var i_row, i: integer;
WorkBk: _WorkBook;
WorkSheet: _WorkSheet;
ExcelApplication1: TExcelApplication;
name_file:string;
name_doc_print, name_D, name_K:string;
Sheet: OLEVariant;
begin
name_file:='order';
name_doc_print:='Заказ';
name_D := 'Заказчик';
name_K := 'Поставщик';

 if v_ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_TNP then
    begin
      name_file:='order';
      name_doc_print:='Заказ';
      name_D := 'Заказчик';
      name_K := 'Поставщик';
    end;

    if v_ID_DOC_TYPE=сID_DOC_TYPE_Prihod_TNP_Nakl then
     begin
        name_file:='prihod';
        name_doc_print:='Приход';
        name_D := 'Получатель';
        name_K := 'Поставщик';
     end;
     if v_ID_DOC_TYPE=сID_DOC_TYPE_Vozvrat_TNP then
     begin
        name_file:='vozvr';
        name_doc_print:='Возврат поставщику';
        name_D := 'Получатель';
        name_K := 'Грузоотправитель';
     end;

     if v_ID_DOC_TYPE=сID_DOC_TYPE_Rashod_Kolbas_realiz then
     begin
        name_file:='rashod';
        name_doc_print:='Накладная расходная';
        name_D := 'Получатель';
        name_K := 'Грузоотправитель';
     end;


name_file:=name_file+IntToStr(ID_NAKLCAP)+'.xls';
OrderFieldName:=  GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+name_file;


ExcelApplication1:= TExcelApplication.Create(F_main);
ExcelApplication1.ConnectKind := ckNewInstance;
ExcelApplication1.Connect;
ExcelApplication1.AutoQuit := false;
ExcelApplication1.Workbooks.Add(EmptyParam,LOCALE_USER_DEFAULT);
ExcelApplication1.Visible[LOCALE_USER_DEFAULT] := false;

i_row:=1;

RangeE:=ExcelApplication1.ActiveCell;
WorkBk := ExcelApplication1.Workbooks.Item[1];
WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;
RangeE:= Worksheet.Range['A1',Worksheet.Cells.Item[1,1]];



with DM1.QOrder_Cap do
begin
Close;
Parameters[0].Value := ID_NAKLCAP;
Open;
First;

i_row:=3;
Sheet:=Worksheet;
RangeE:= Worksheet.Range[sheet.Cells[i_row,1], sheet.Cells[i_row,1]];
RangeE.ColumnWidth:=2.71;

RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row,16]];
RangeE.MergeCells := True;
// RangeE.
// RangeE.Value:='Заказ № '+FieldByName('NN').AsString+' на '+ dateToStr(FieldByName('D').AsFloat);
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=14;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=name_doc_print+' №';

RangeE:= Worksheet.Range[sheet.Cells[i_row,17], sheet.Cells[i_row,20]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=14;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=FieldByName('NN').AsString;

RangeE:= Worksheet.Range[sheet.Cells[i_row,21], sheet.Cells[i_row,22]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=14;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=' от ';

RangeE:= Worksheet.Range[sheet.Cells[i_row,23], sheet.Cells[i_row,28]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=14;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=dateToStr(FieldByName('D').AsFloat);


RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row,38]];
RangeE.Borders[xlDiagonalDown].LineStyle := xlNone;
    RangeE.Borders[xlDiagonalUp].LineStyle := xlNone;
    RangeE.Borders[xlEdgeLeft].LineStyle := xlNone;
    RangeE.Borders[xlEdgeTop].LineStyle := xlNone;
    RangeE.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    RangeE.Borders[xlEdgeBottom].Weight := xlMedium;
    RangeE.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
    RangeE.Borders[xlEdgeRight].LineStyle := xlNone;


Inc(i_row);
RangeE:= Worksheet.Range[sheet.Cells[i_row,36], sheet.Cells[i_row,38]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:='Код';

Inc(i_row);
RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row,6]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Underline := xlUnderlineStyleSingle;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=name_D;

RangeE:= Worksheet.Range[sheet.Cells[i_row,7], sheet.Cells[i_row,35]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=FieldByName('CLI_D').AsString;

RangeE:= Worksheet.Range[sheet.Cells[i_row,36], sheet.Cells[i_row,38]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=IntToStr(FieldByName('ID_CLI_D').AsInteger);


Inc(i_row,2);
RangeE:= Worksheet.Range[sheet.Cells[i_row,36], sheet.Cells[i_row,38]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:='Код';

Inc(i_row);
RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row,6]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Underline := xlUnderlineStyleSingle;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=name_K;

RangeE:= Worksheet.Range[sheet.Cells[i_row,7], sheet.Cells[i_row,35]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=FieldByName('CLI_K').AsString;

RangeE:= Worksheet.Range[sheet.Cells[i_row,36], sheet.Cells[i_row,38]];
RangeE.MergeCells := True;
RangeE.ColumnWidth:=2.71;
RangeE.Font.Bold:=true;
RangeE.Font.Size:=9;
RangeE.HorizontalAlignment := xlLeft;
RangeE.Value:=IntToStr(FieldByName('ID_CLI_K').AsInteger);

// Close;
end;  // with DM1.QOrder_Cap do


with DM1.QOrder_Tov do
begin
Close;
Parameters[0].Value := ID_NAKLCAP;
Open;


Inc(i_row,3);

RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row+1,3]];
RangeE.MergeCells := True;
RangeE.Value:='№';

RangeE:= Worksheet.Range[sheet.Cells[i_row,4], sheet.Cells[i_row+1,8]];
RangeE.MergeCells := True;
RangeE.Value:='Группа товара';

RangeE:= Worksheet.Range[sheet.Cells[i_row,9], sheet.Cells[i_row+1,21]];
RangeE.MergeCells := True;
RangeE.Value:='Товар';

RangeE:= Worksheet.Range[sheet.Cells[i_row,22], sheet.Cells[i_row+1,24]];
RangeE.MergeCells := True;
RangeE.Value:='Код';

RangeE:= Worksheet.Range[sheet.Cells[i_row,25], sheet.Cells[i_row+1,29]];
RangeE.MergeCells := True;
RangeE.Value:='Кол-во';

RangeE:= Worksheet.Range[sheet.Cells[i_row,30], sheet.Cells[i_row+1,33]];
RangeE.MergeCells := True;
RangeE.Value:='Цена без НДС';

RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row+1,37]];
RangeE.MergeCells := True;
RangeE.Value:='Сумма без НДС';

RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row+1,37]];
With RangeE do
  begin
        Font.Bold:=True;
        Font.Size:=9;
        HorizontalAlignment := xlCenter;
        VerticalAlignment := xlCenter;
        WrapText := True;
        Orientation := 0;
        AddIndent := False;
        IndentLevel := 0;
        ShrinkToFit := False;
        ReadingOrder := xlContext;

  end;


 Inc(i_row);

 first;
 i:=1;
 while not eof do
 begin
  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,2], sheet.Cells[i_row,3]];
  RangeE.MergeCells := True;
  RangeE.NumberFormat:='0';
  RangeE.Value:=i;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,4], sheet.Cells[i_row,8]];
  RangeE.MergeCells := True;
  RangeE.Value:=FieldByName('GRUPTOV').AsString;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,9], sheet.Cells[i_row,21]];
  RangeE.MergeCells := True;
  RangeE.Value:=FieldByName('NAME').AsString;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,22], sheet.Cells[i_row,24]];
  RangeE.MergeCells := True;
  RangeE.Value:=FieldByName('ID_TOV').AsString;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,25], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.NumberFormat:='0,000';
  RangeE.Value:=FieldByName('NUMB').AsFloat;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,28], sheet.Cells[i_row,29]];
  RangeE.MergeCells := True;
  RangeE.Value:=FieldByName('EDIZM').AsString;

  RangeE:= Worksheet.Range[sheet.Cells[i_row,30], sheet.Cells[i_row,33]];
  RangeE.MergeCells := True;
  RangeE.NumberFormat:='0,00';
  RangeE.Value:=RoundTo(FieldByName('PRICE').AsFloat, -2);

  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.NumberFormat:='0,00';
  RangeE.FormulaR1C1 := '=RC[-9]*RC[-4]';


  inc(i);
  next;


 end; // while not eof do

 RangeE:= Worksheet.Range[sheet.Cells[11,2], sheet.Cells[i_row,37]];
 RangeE.Font.Size:=9;

  try
  RangeE.Borders[xlDiagonalDown].LineStyle := xlNone;
    RangeE.Borders[xlDiagonalUp].LineStyle := xlNone;
    With RangeE.Borders[xlEdgeLeft] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;

    With RangeE.Borders[xlEdgeTop] do
     begin
        LineStyle := xlContinuous ;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeBottom] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeRight]  do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;


     With RangeE.Borders[xlInsideVertical]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;

      With RangeE.Borders[xlInsideHorizontal]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;
      except
      ;
      end;


 if v_ID_DOC_TYPE<>сID_DOC_TYPE_Rashod_Kolbas_realiz then
 begin

  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='Итого без НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.FormulaR1C1:='=SUM(R[-'+IntToStr(DM1.QOrder_Tov.RecordCount)+']C:R[-1]C)';

Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.Value:=0.0;

Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='Всего с НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.FormulaR1C1 := '=R[-2]C+R[-1]C';


 end
 else  // if v_ID_DOC_TYPE<>сID_DOC_TYPE_Rashod_Kolbas_realiz then
 begin
  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='Итого без НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.FormulaR1C1:='=SUM(R[-'+IntToStr(DM1.QOrder_Tov.RecordCount)+']C:R[-1]C)';

  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='Скидка:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.Value:=DM1.QOrder_Cap.FieldByName('MINUS').AsFloat;


  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.Value:=DM1.QOrder_Cap.FieldByName('NDS').AsFloat;

  Inc(i_row);
  RangeE:= Worksheet.Range[sheet.Cells[i_row,19], sheet.Cells[i_row,27]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.HorizontalAlignment := xlRight;
  RangeE.Value:='Всего с НДС:';


  RangeE:= Worksheet.Range[sheet.Cells[i_row,34], sheet.Cells[i_row,37]];
  RangeE.MergeCells := True;
  RangeE.Font.Bold:=true;
  RangeE.Font.Size:=9;
  RangeE.NumberFormat:='0,00';
  RangeE.FormulaR1C1 := '=R[-3]C-R[-2]C+R[-1]C';


 end;


  Close;
end; // with DM1.QOrder_Tov do

DM1.QOrder_Cap.Close;


With WorkSheet.PageSetup  do
begin
        PrintTitleRows := '';
        PrintTitleColumns := '';

end;
    WorkSheet.PageSetup.PrintArea := '';
    With WorkSheet.PageSetup do
    begin
        LeftHeader := '';
        CenterHeader :='';
        RightHeader := '';
        LeftFooter := '';
        CenterFooter := '';
        RightFooter := '';
        LeftMargin := 0;
        RightMargin := 0;
        TopMargin := 0;
        BottomMargin :=0;
        HeaderMargin := 0;
        FooterMargin := 0;
        PrintHeadings := False;
        PrintGridlines := False;
        PrintComments := xlPrintNoComments;
        CenterHorizontally := False;
        CenterVertically := False;
        Orientation := xlPortrait;
        Draft := False;
        PaperSize := xlPaperA4;
        FirstPageNumber := xlAutomatic;
        Order := xlDownThenOver;
        BlackAndWhite := False;
        Zoom := False;
        FitToPagesWide := 1;
        FitToPagesTall := False;
       // PrintErrors := xlPrintErrorsDisplayed;
    end;



ExcelApplication1.DisplayAlerts[LOCALE_USER_DEFAULT]:= True;  //отключить предупреждения что такой файл уже есть
WorkBk.SaveAs(OrderFieldName ,xlNormal,
  '','',false, false,xlNoChange, xlUserResolution, False, False, 0, 0);
ExcelApplication1.DisplayAlerts[LOCALE_USER_DEFAULT]:= True;

ExcelApplication1.Visible[LOCALE_USER_DEFAULT]:=is_show;
if  not is_show then ExcelApplication1.Quit;
ExcelApplication1.Disconnect;
ExcelApplication1.Free;


end; // procedure OrderExcelPrint_1(ID_NAKLCAP:longint);




end.
