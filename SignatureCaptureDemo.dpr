program SignatureCaptureDemo;

uses
  Vcl.Forms,
  SignatureCapture.Main in 'Src\SignatureCapture.Main.pas' {SignatureCaptureForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMS FNC Signature Capture Demo';
  Application.CreateForm(TSignatureCaptureForm, SignatureCaptureForm);
  Application.Run;
end.
