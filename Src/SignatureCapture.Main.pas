unit SignatureCapture.Main;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Imaging.pngimage,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCSignatureCapture,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCCustomControl;

type
  TSignatureCaptureForm = class(TForm)
    pnHeader: TPanel;
    lbTitle: TLabel;
    lbSubtitle: TLabel;
    gBoxSettings: TGroupBox;
    lbPenColor: TLabel;
    cBoxPenColor: TColorBox;
    lbPenWidth: TLabel;
    cBoxPenWidth: TComboBox;
    lbHintText: TLabel;
    edtHintText: TEdit;
    lbHintPosition: TLabel;
    cBoxHintPosition: TComboBox;
    ckShowClearIcon: TCheckBox;
    gBoxCapture: TGroupBox;
    SignatureCapture: TTMSFNCSignatureCapture;
    pnActions: TPanel;
    btnClear: TButton;
    btnSave: TButton;
    btnLoad: TButton;
    btnUpdatePreview: TButton;
    btnExportImage: TButton;
    gBoxPreview: TGroupBox;
    imgPreview: TImage;
    statusBar: TStatusBar;
    SaveDialogSig: TSaveDialog;
    OpenDialogSig: TOpenDialog;
    SaveDialogImg: TSaveDialog;
    pnBody: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnUpdatePreviewClick(Sender: TObject);
    procedure btnExportImageClick(Sender: TObject);
    procedure cBoxPenColorChange(Sender: TObject);
  private
    procedure SettingsChange;
    procedure UpdatePreview;
    function CreateSignatureImage: TPngImage;
  public
  end;

var
  SignatureCaptureForm: TSignatureCaptureForm;

implementation

{$R *.dfm}

procedure TSignatureCaptureForm.FormCreate(Sender: TObject);
begin
  Self.SettingsChange;
end;

procedure TSignatureCaptureForm.cBoxPenColorChange(Sender: TObject);
begin
  Self.SettingsChange;
end;

procedure TSignatureCaptureForm.SettingsChange;
begin
  SignatureCapture.Pen.Color := TTMSFNCGraphicsColor(ColorToRGB(cBoxPenColor.Selected));
  SignatureCapture.Pen.Width := StrToIntDef(cBoxPenWidth.Text, 2);
  SignatureCapture.Text := Trim(edtHintText.Text);

  case cBoxHintPosition.ItemIndex of
    0: SignatureCapture.TextPosition.Position := tpBottomCenter;
    1: SignatureCapture.TextPosition.Position := tpTopCenter;
    2: SignatureCapture.TextPosition.Position := tpNone;
  end;

  if ckShowClearIcon.Checked then
    SignatureCapture.ClearSig.Position := TTMSFNCSignatureCaptureClearSignPosition.cpBottomRight
  else
    SignatureCapture.ClearSig.Position := TTMSFNCSignatureCaptureClearSignPosition.cpNone;

  SignatureCapture.Invalidate;
end;

procedure TSignatureCaptureForm.btnClearClick(Sender: TObject);
begin
  SignatureCapture.Empty := True;
  //requests that the component be redesigned / solicita que o componente seja redesenhado
  SignatureCapture.Invalidate;
  imgPreview.Picture.Assign(nil);
end;

procedure TSignatureCaptureForm.btnSaveClick(Sender: TObject);
begin
  if SignatureCapture.Empty then
    raise Exception.Create('Please draw a signature first.');

  if not SaveDialogSig.Execute then
    Exit;

  SignatureCapture.SaveToFile(SaveDialogSig.FileName);
end;

procedure TSignatureCaptureForm.btnLoadClick(Sender: TObject);
begin
  if not OpenDialogSig.Execute then
    Exit;

  SignatureCapture.LoadFromFile(OpenDialogSig.FileName);
  SignatureCapture.Invalidate;
  Self.UpdatePreview;
end;

procedure TSignatureCaptureForm.btnUpdatePreviewClick(Sender: TObject);
begin
  if SignatureCapture.Empty then
    raise Exception.Create('Please draw a signature first.');

  Self.UpdatePreview;
end;

procedure TSignatureCaptureForm.UpdatePreview;
begin
  var LImage := Self.CreateSignatureImage;
  try
    imgPreview.Picture.Assign(LImage);
  finally
    LImage.Free;
  end;
end;

procedure TSignatureCaptureForm.btnExportImageClick(Sender: TObject);
begin
  if SignatureCapture.Empty then
    raise Exception.Create('Please draw a signature first.');

  if not SaveDialogImg.Execute then
    Exit;

  SignatureCapture.SaveToImageFile(SaveDialogImg.FileName);
end;

function TSignatureCaptureForm.CreateSignatureImage: TPngImage;
begin
  var LStream := TMemoryStream.Create;
  try
    SignatureCapture.SaveToImageStream(LStream);
    LStream.Position := 0;
    var LPicture := TPicture.Create;
    try
      // VCL versions may export a BMP regardless of the destination extension.
      // Decode the actual image, then explicitly encode it as PNG.
      LPicture.LoadFromStream(LStream);
      Result := TPngImage.Create;
      try
        Result.Assign(LPicture.Graphic);
      except
        Result.Free;
        raise;
      end;
    finally
      LPicture.Free;
    end;
  finally
    LStream.Free;
  end;
end;

end.
