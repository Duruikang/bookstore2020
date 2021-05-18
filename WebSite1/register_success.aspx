<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register_success.aspx.cs" Inherits="register_success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 72px">
    <form id="form1" runat="server">
        <div align="center">
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./login.aspx">注册成功，前往登录！！</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
