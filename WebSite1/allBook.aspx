<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allBook.aspx.cs" Inherits="allBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body  style="width: 1192px;text-align:center;background-image:url(./images/search_bg.png)" >
    <form id="form1" runat="server">
        <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right" Width="1192px" >
                <asp:Button ID="shopping" runat="server" OnClick="shopping_Click" Text="购物车" Visible="False" />
                <asp:HyperLink ID="User" runat="server" Text="Label"></asp:HyperLink>
                <asp:Button ID="btn_login" runat="server" Text="login" Visible="False" OnClick="btn_login_Click" />
                <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" Text="logout"  Visible="false"/>
            </asp:Panel>
        <div  style="width: 1188px;text-align:center">
            
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/allbook.png" OnClick="ImageButton1_Click" />
            <br />
            单击标题回到主页<br />
        </div>
        <asp:Image ID="Image1" runat="server" Width="1192px" ImageUrl="./images/fengexian.png" Height="16px"/>

        <asp:Panel ID="Panel5" runat="server" Height="607px" ScrollBars="Vertical" Width="1192px">
        </asp:Panel>

    </form>
</body>
</html>