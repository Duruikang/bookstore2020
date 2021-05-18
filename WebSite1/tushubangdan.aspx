<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tushubangdan.aspx.cs" Inherits="tushubangdan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body align="center" style="width: 1192px;background-image:url(./images/search_bg.png)" >
    <form id="form1" runat="server">
        <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right" Width="1192px" >
                <asp:Button ID="shopping" runat="server" OnClick="shopping_Click" Text="购物车" Visible="False" />
                <asp:HyperLink ID="User" runat="server" Text="Label"></asp:HyperLink>
                <asp:Button ID="btn_login" runat="server" Text="login" Visible="False" OnClick="btn_login_Click" />
                <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" Text="logout"  Visible="false"/>
            </asp:Panel>
        <div align="center" style="width: 1188px">
            
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="./images/bangdan.png" OnClick="ImageButton1_Click" />
            <br />
            单击标题回到主页<br />
        </div>
        <asp:Image ID="Image1" runat="server" Width="1192px" ImageUrl="./images/fengexian.png" Height="16px"/>

    </form>
</body>
</html>