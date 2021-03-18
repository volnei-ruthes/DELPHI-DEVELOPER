// Full Unit code.
 // -----------------------------------------------------------
 // You must store this code in a unit called Unit1 with a form
 // called Form1 that has an OnCreate event called FormCreate.
 
 unit Unit1;

 interface
 
 uses
   Printers,   // Unit containing the Printer command
   SysUtils, Graphics, Windows,
   Forms, Dialogs, Classes, Controls, StdCtrls;
 
 type
   TForm1 = class(TForm)
     procedure FormCreate(Sender: TObject);
   end;
 
 var
   Form1: TForm1;
 
 implementation
 {$R *.dfm} // Include form definitions
 
 // A subroutine used to display a print-cancel dialog
 procedure CancelDialog;
 begin
   // Display the cancel print dialog
   Dialogs.MessageDlg('Press cancel to abort printing',mtCustom,[mbCancel],0);
 
   // Now that the user has pressed cancel, we abort the printing
   if Printer.Printing then
   begin
     Printer.Abort;
     ShowMessage('Printing aborted');
   end;
 
   // End this thread
   endThread(0);
 end;
 
 // The main form On Create routine - our main program
 procedure TForm1.FormCreate(Sender: TObject);
 const
   TOTAL_PAGES = 4;      // How many pages to print
 var
   printDialog    : TPrintDialog;
   cancelThreadId : Integer;
   threadId       : LongWord;
   page, startPage, endPage : Integer;
 
 begin
   // Create a printer selection dialog
   printDialog := TPrintDialog.Create(Form1);
 
   // Set up print dialog options
   printDialog.MinPage := 1;               // First allowed page number
   printDialog.MaxPage := TOTAL_PAGES;     // Highest allowed page number
   printDialog.ToPage  := TOTAL_PAGES;     // 1 to ToPage page range allowed
   printDialog.Options := [poPageNums];    // Allow page range selection
 
   // if the user has selected a printer (or default), then print!
   if printDialog.Execute then
   begin
     // Start a cancel print dilaog as a separate thread!
     cancelThreadId := beginThread(nil,
                                   0,
                                   Addr(CancelDialog),
                                   nil,
                                   0,
                                   threadId);
 
     // Use the Printer function to get access to the global TPrinter object.
     // Set to landscape orientation
     Printer.Orientation := poLandscape;
 
     // Set the printjob title - as it it appears in the print job manager
     Printer.Title := 'Test print for Delphi';
 
     // Set the number of copies to print each page
     // This is crude - it doies not take Collation into account
     Printer.Copies := printDialog.Copies;
 
     // Start printing
     Printer.BeginDoc;
 
     // Has the user selected a page range?
     if printDialog.PrintRange = prPageNums then
     begin
       startPage := printDialog.FromPage;
       endPage   := printDialog.ToPage;
     end
     else // All pages
     begin
       startPage := 1;
       endPage   := TOTAL_PAGES;
     end;
 
     // Set up the start page number
     page := startPage;
 
     // Keep printing whilst all OK
     while (not Printer.Aborted) and Printer.Printing do
     begin
       // Show a message saying we are starting a page
       ShowMessagePos('Starting to print page '+IntToStr(page),300,300);
 
       // Set up a medium sized font
       Printer.Canvas.Font.Size   := 10;
 
       // Allow Windows to keep processing messages
       Application.ProcessMessages;
 
       // Write out the page number
       Printer.Canvas.Font.Color := clBlue;
       Printer.Canvas.TextOut(40,  20, 'Page number = '+IntToStr(page));
 
       // Underline this page number
       Printer.Canvas.MoveTo(40,80);
       Printer.Canvas.LineTo(Printer.PageWidth-20,80);
 
       // Write out the page size
       Printer.Canvas.Font.Color := clRed;
       Printer.Canvas.TextOut(40, 100, 'Page  width = '+
                              IntToStr(Printer.PageWidth));
       Printer.Canvas.TextOut(40, 180, 'Page height = '+
                              IntToStr(Printer.PageHeight));
 
       // Increment the page number
       Inc(page);
 
       // Now start a new page - if not the last
       if (page <= endPage) and (not Printer.Aborted)
       then Printer.NewPage;
     end;
 
     // Finish printing
     Printer.EndDoc;
   end;
 end;
 
 end.
{
procedure TForm1.Button1Click(Sender: TObject);
const
   TOTAL_PAGES = 4;      // How many pages to print
 var
   printDialog    : TPrintDialog;
   page, startPage, endPage : Integer;
 begin

   //1. Usando a caixa de diálogo da impressora
   {Aqui, criamos um objeto de diálogo de impressão, configuramos algumas opções e, em seguida, o exibimos. O método Execute retorna true
   se o usuário clicar em OK em vez de cancelar. Em seguida, imprimimos o documento. O usuário pode selecionar, por meio dessas opções,
   se deseja imprimir todas as 4 páginas ou um intervalo dessas páginas, conforme visto em uma parte da caixa de diálogo mostrada abaixo:}

   // Create a printer selection dialog
  { printDialog := TPrintDialog.Create(Form1);
 
   // Set up print dialog options
   printDialog.MinPage := 1;               // First allowed page number
   printDialog.MaxPage := TOTAL_PAGES;     // Highest allowed page number
   printDialog.ToPage  := TOTAL_PAGES;     // 1 to ToPage page range allowed
   printDialog.Options := [poPageNums];    // Allow page range selection


   //2. Começando a imprimir
   {O objeto Impressora está permanentemente disponível para o seu código (você deve usar a unidade Impressoras para obter acesso aos seus
    métodos e campos). Com esse objetivo, a impressão ocorre de maneira ordenada.}

   // if the user has selected a printer (or default), then print!
 {  if printDialog.Execute then
   begin
      //... Your print statements
      //O seguinte snippet de código define algumas novas variáveis: var  page, startPage, endPage : Integer;
      //E agora definimos essas variáveis ??na caixa de diálogo de impressão:
      // Has the user selected a page range?
       if printDialog.PrintRange = prPageNums then
       begin
         startPage := printDialog.FromPage;
         endPage   := printDialog.ToPage;
       end
       else // All pages
       begin
         startPage := 1;
         endPage   := TOTAL_PAGES;
       end;
       // Set up the start page number
       page := startPage;
       //O valor prPageNums é um valor TPrintRange e é um dos valores que PrintRange pode ter. Se definido, significa que o usuário
       // selecionou um intervalo de páginas. Os FromPage e ToPage valores irá então ser definido para os valores especificados pelo
       //utilizador.



     // Use the Printer function to get access to the global TPrinter object.
     // Set to landscape orientation
     Printer.Orientation := poLandscape;

     // Set the printjob title - as it it appears in the print job manager
     Printer.Title := 'Test print for Delphi';

     // Set the number of copies to print each page
     // This is crude - it doies not take Collation into account
     Printer.Copies := printDialog.Copies;

     // Start printing
     Printer.BeginDoc;
     {Isso inicia um trabalho de impressão, com um layout de página em paisagem, um título e o número de cópias especificado pelo usuário.
      Observe que estamos ignorando o agrupamento - sempre imprimimos todas as cópias da página 1 antes da página 2, etc.}

  {   while (not Printer.Aborted) and Printer.Printing do
     begin
       // Show a message saying we are starting a page
       ShowMessagePos('Starting to print page '+IntToStr(page),300,300);
       // Set up a medium sized font
       Printer.Canvas.Font.Size   := 10;
       // Allow Windows to keep processing messages
       Application.ProcessMessages;
       // Write out the page number
       Printer.Canvas.Font.Color := clBlue;
       Printer.Canvas.TextOut(40,  20, 'Page number = '+IntToStr(page));
       // Underline this page number
       Printer.Canvas.MoveTo(40,80);
       Printer.Canvas.LineTo(Printer.PageWidth-20,80);
       // Write out the page size
       Printer.Canvas.Font.Color := clRed;
       Printer.Canvas.TextOut(40, 100, 'Page  width = '+ IntToStr(Printer.PageWidth));
       Printer.Canvas.TextOut(40, 180, 'Page height = '+ IntToStr(Printer.PageHeight));
       // Increment the page number
       Inc(page);
       // Now start a new page - if not the last
       if (page <= endPage) and (not Printer.Aborted) then Printer.NewPage;
     end;

      // Finish printing
      Printer.EndDoc;
   end;

   //
end;

end.
