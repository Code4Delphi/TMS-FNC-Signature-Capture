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
  VCL.TMSFNCSignatureCapture, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCCustomControl;

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
    btnPreview: TButton;
    btnExport: TButton;
    gBoxPreview: TGroupBox;
    imgPreview: TImage;
    gBoxMemory: TGroupBox;
    lbMemoryHelp: TLabel;
    lbMemoryStatus: TLabel;
    btnStoreMemory: TButton;
    btnRestoreMemory: TButton;
    statusBar: TStatusBar;
    dlgSaveSignature: TSaveDialog;
    dlgOpenSignature: TOpenDialog;
    dlgExportImage: TSaveDialog;
    pnBody: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SettingsChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnStoreMemoryClick(Sender: TObject);
    procedure btnRestoreMemoryClick(Sender: TObject);
  private
    FSignatureStream: TMemoryStream;
    procedure RequireSignature;
    procedure UpdatePreview;
    procedure SyncLoadedSettings;
    procedure SetStatus(const AMessage: string);
    function CreateSignatureImage: TPngImage;
  end;

var
  SignatureCaptureForm: TSignatureCaptureForm;

implementation

{$R *.dfm}

procedure TSignatureCaptureForm.FormCreate(Sender: TObject);
begin
  FSignatureStream := TMemoryStream.Create;
  Self.SettingsChange(nil);
  Self.SetStatus('Ready. Draw your signature with a mouse or touch.');
end;

procedure TSignatureCaptureForm.FormDestroy(Sender: TObject);
begin
  FSignatureStream.Free;
end;

procedure TSignatureCaptureForm.SettingsChange(Sender: TObject);
begin
  SignatureCapture.Pen.Color := TTMSFNCGraphicsColor(ColorToRGB(cBoxPenColor.Selected));
  SignatureCapture.Pen.Width := string(cBoxPenWidth.Text).ToInteger;
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

procedure TSignatureCaptureForm.RequireSignature;
begin
  if SignatureCapture.Empty then
    raise Exception.Create('Please draw a signature first.');
end;

procedure TSignatureCaptureForm.SetStatus(const AMessage: string);
begin
  statusBar.SimpleText := AMessage;
end;

procedure TSignatureCaptureForm.btnClearClick(Sender: TObject);
begin
  SignatureCapture.Empty := True;
  SignatureCapture.Invalidate;
  imgPreview.Picture.Assign(nil);
  Self.SetStatus('Signature cleared. The memory copy is still available.');
end;

procedure TSignatureCaptureForm.btnSaveClick(Sender: TObject);
begin
  Self.RequireSignature;
  if not dlgSaveSignature.Execute then
    Exit;

  SignatureCapture.SaveToFile(dlgSaveSignature.FileName);
  Self.SetStatus('Signature saved: ' + dlgSaveSignature.FileName);
end;

procedure TSignatureCaptureForm.btnLoadClick(Sender: TObject);
begin
  if not dlgOpenSignature.Execute then
    Exit;

  SignatureCapture.LoadFromFile(dlgOpenSignature.FileName);
  Self.SyncLoadedSettings;
  Self.UpdatePreview;
  Self.SetStatus('Signature loaded: ' + dlgOpenSignature.FileName);
end;

procedure TSignatureCaptureForm.SyncLoadedSettings;
begin
  // The native signature format also restores the hint text and font.
  edtHintText.Text := SignatureCapture.Text;
  SignatureCapture.Invalidate;
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

procedure TSignatureCaptureForm.UpdatePreview;
begin
  var LImage := Self.CreateSignatureImage;
  try
    imgPreview.Picture.Assign(LImage);
  finally
    LImage.Free;
  end;
end;

procedure TSignatureCaptureForm.btnPreviewClick(Sender: TObject);
begin
  Self.RequireSignature;
  Self.UpdatePreview;
  Self.SetStatus('Image preview updated. The hint and clear icon are excluded.');
end;

procedure TSignatureCaptureForm.btnExportClick(Sender: TObject);
begin
  Self.RequireSignature;
  if not dlgExportImage.Execute then
    Exit;

  var LImage := Self.CreateSignatureImage;
  try
    LImage.SaveToFile(dlgExportImage.FileName);
    imgPreview.Picture.Assign(LImage);
  finally
    LImage.Free;
  end;
  Self.SetStatus('PNG image exported: ' + dlgExportImage.FileName);
end;

procedure TSignatureCaptureForm.btnStoreMemoryClick(Sender: TObject);
begin
  Self.RequireSignature;
  FSignatureStream.Clear;
  SignatureCapture.SaveToStream(FSignatureStream);
  FSignatureStream.Position := 0;
  btnRestoreMemory.Enabled := True;
  lbMemoryStatus.Caption := Format('Stored in memory: %d bytes', [FSignatureStream.Size]);
  Self.SetStatus('Memory copy stored. Clear the signature, then click Restore.');
end;

procedure TSignatureCaptureForm.btnRestoreMemoryClick(Sender: TObject);
begin
  if FSignatureStream.Size = 0 then
    Exit;

  FSignatureStream.Position := 0;
  SignatureCapture.LoadFromStream(FSignatureStream);
  Self.SyncLoadedSettings;
  Self.UpdatePreview;
  Self.SetStatus('Signature restored from the memory stream.');
end;

end.
