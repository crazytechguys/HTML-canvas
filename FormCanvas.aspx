<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCanvas.aspx.cs" Inherits="HTML_Canvas.FormCanvas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canvas de HTML5 com ASP.NET</title>
    <script src="http://code.jquery.com/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="jquery.jqscribble.js" type="text/javascript"></script>
    <script src="jqscribble.extrabrushes.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
   
		<canvas id="ctgCanvas" style="border: 1px solid red;"></canvas>
        <input id="btn" type="button" value="Salvar" />
        
        
        <script type="text/javascript">
            //Função que captura o click do botão e aciona o salvamento
            $("#btn").click(function () {

                // Pega os dados da Imagem gerada no canvas
                var desenho = document.getElementById("ctgCanvas").toDataURL("image/png");
                desenho = desenho.replace('data:image/png;base64,', '');

                //Enviando Assincronamente para o método de salvar, o método deve ser de Serviço
                $.ajax(
                    {
                        type: 'POST',
                        url: 'FormCanvas.aspx/Salvar',
                        data: '{ "Desenho" : "' + desenho + '" }',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (msg) {
                            alert("Imagen Salva!");
                        }
                    });
            });
		    
            //Inicializa o Plugin para o Canvas
		    $(document).ready(function () {
		        $("#ctgCanvas").jqScribble();
		    });
		</script>
			
    </form>
</body>
</html>
