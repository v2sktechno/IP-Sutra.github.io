<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="IP_Sutra.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  	<%--<link rel="stylesheet" href="css/style.css"/>--%>
    
  	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ََIP Sutra</title>
    <link rel="stylesheet" href="style.css"/>
		<link href="loginpagenew/style.css" rel="stylesheet" />
 <%--   <link href="style.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />--%>
  </head>
<body>
    <form id="form1" class="box" runat="server">
     <%--<h1>I P<br />Sutra</h1>--%>
        <span >
            <img style="width:220px;height:70px;border-radius:5px;" src="loginpagenew/InoberryLogo_Small.png"/>
        </span>
        
  <%--<input type="text" name="" placeholder="Username"/>
  <input type="password" name="" placeholder="Password"/>
  <input type="submit" name="" value="Login">--%>
        <label id="lblmsg" runat="server"></label>
        <asp:TextBox ID="txt_email" runat="server" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
        <asp:Button ID="btn_signin" runat="server" Text="Login" OnClick="btn_signin_Click" />
    </form>
</body>
</html>

