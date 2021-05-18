<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuye.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 219px; width: 1248px;background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right" Width="1246px">
                <asp:Button ID="shopping" runat="server" OnClick="shopping_Click" Text="购物车" Visible="False" />
                <asp:HyperLink ID="User" runat="server" Text="Label"></asp:HyperLink>
                <asp:Button ID="btn_login" runat="server" Text="login" Visible="False" OnClick="btn_login_Click" />
                <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" Text="logout" Visible="false" />
            </asp:Panel>
            <asp:Image ID="Image1" runat="server" Height="110px" Width="1246px" ImageUrl="./images/title.png" />

        </div>
        <asp:Menu ID="Menu1" runat="server" Width="1246px" Orientation="Horizontal" RenderingMode="Table">
            <Items>
                <asp:MenuItem Text="书店主页" Value="书店主页" NavigateUrl="./zhuye.aspx"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="./allBook.aspx" Text="所有图书" Value="所有图书"></asp:MenuItem>
                <asp:MenuItem Text="图书榜单" Value="图书榜单" NavigateUrl="./tushubangdan.aspx"></asp:MenuItem>
                <asp:MenuItem Text="鲲鹏发现" Value="鲲鹏发现" NavigateUrl="./kunpengfaxian.aspx"></asp:MenuItem>
                <asp:MenuItem Text="用户登录" Value="用户登录" NavigateUrl="./login.aspx?last_url=./zhuye.aspx" ></asp:MenuItem>
                <asp:MenuItem Text="用户注册" Value="用户注册" NavigateUrl="./register.aspx"></asp:MenuItem>             
            </Items>
        </asp:Menu>
    </form>
</body>
</html>
