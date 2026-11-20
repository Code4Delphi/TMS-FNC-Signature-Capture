# Componente de Captura de Assinaturas - TMS FNC Signature Capture

Projeto de exemplo em Delphi demonstrando o uso do **TTMSFNCSignatureCapture**, componente multiplataforma do TMS FNC UI Pack para capturar assinaturas com mouse ou toque, personalizar o traço e salvar, carregar ou exportar assinaturas como imagem. Inclui um link para o vídeo de demonstração do projeto.

## 🏷️ Cupom de desconto
- Use este cupom exclusivo e tenha 30% de desconto em qualquer produto da TMS:
```
2026Code4Delphi30
```

## Links úteis
|[TMS FNC UI Pack](https://www.tmssoftware.com/site/tmsfncuipack.asp)|[Documentação](https://doc.tmssoftware.com/fnc/uipack/signaturecapture/guides/signaturecapture-guide.html)|
|--|--|

## Vídeos de demonstração
- Em breve

## Projeto de exemplo

Abra `SignatureCaptureDemo.dproj` no Delphi 12 ou superior, com o **TMS FNC Core** e o **TMS FNC UI Pack** instalados e configurados no Library Path. O exemplo utiliza VCL e possui configurações para Win32 e Win64. Todos os textos da aplicação e nomes de componentes estão em inglês.

- Desenhe na área **Draw your signature** com o mouse ou toque.
- Ajuste **Pen color** e **Pen width** para os próximos traços; os traços existentes preservam sua aparência.
- Altere **Hint text**, **Hint position** e **Show built-in clear icon** para personalizar a área de captura.
- Use **Save signature** e **Load signature** para persistir os pontos no formato nativo `.sig`.
- Use **Update preview** para atualizar a imagem e **Export PNG** para salvar uma imagem PNG real, sem o texto de orientação e o ícone de limpeza.
- Use **Store in memory**, **Clear** e **Restore** para demonstrar `SaveToStream` e `LoadFromStream` com `TMemoryStream`. A cópia em memória existe apenas durante a execução.

O formulário e todos os componentes estão em `Src/SignatureCapture.Main.dfm`, disponíveis no designer. Os eventos estão em `Src/SignatureCapture.Main.pas`. A exportação usa `SaveToImageStream` e converte a imagem com `TPngImage`, pois versões VCL do componente podem retornar BMP. A imagem utiliza as dimensões atuais da área de captura; ao carregar um `.sig`, os pontos mantêm suas coordenadas originais.

Para compilar no **RAD Studio Command Prompt**:

```bat
msbuild SignatureCaptureDemo.dproj /t:Build /p:Config=Debug /p:Platform=Win32
```

O executável será gerado em `Bin/Win32/Debug/SignatureCaptureDemo.exe`.

<br>

## Multiplataforma
<img width="524" height="124" alt="VCL-FMX-Web-FNC" src="https://github.com/user-attachments/assets/17b23899-0e26-4901-810e-f9a03e38deae" />

## Screenshots

<img width="981" height="714" alt="image" src="https://github.com/user-attachments/assets/102ff2f2-2f90-419f-8e73-3bc902cd9e0a" />

<br>
<br>


<img width="356" height="166" alt="image" src="https://github.com/user-attachments/assets/0e5f25b2-c55e-4189-b7aa-fe8a6a25f37f" />


## 📞 Contatos
[![Course](https://img.shields.io/badge/Course-Delphi-F00?logo=delphi)](https://code4delphi.github.io/ia-devs-delphi-lazarus/)
[![Telegram](https://img.shields.io/badge/Telegram-Join-blue?logo=telegram)](https://t.me/Code4Delphi)
[![YouTube](https://img.shields.io/badge/YouTube-Join-red?logo=youtube&logoColor=red)](https://www.youtube.com/@code4delphi)
[![Instagram](https://img.shields.io/badge/Intagram-Follow-red?logo=instagram&logoColor=pink)](https://www.instagram.com/code4delphi/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://www.linkedin.com/in/cesar-cardoso-dev)
[![Blog](https://img.shields.io/badge/Blog-Code4Delphi-F00?logo=delphi)](https://code4delphi.com.br/blog/)
[![E-mail](https://img.shields.io/badge/E--mail-Send-yellowgreen?logo=maildotru&logoColor=yellowgreen)](mailto:contato@code4delphi.com.br)


