<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div  style="width: 1249px;text-align:center;">
            &nbsp;<asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right" Width="1247px" >
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="返回主页" />
                <asp:Button ID="shopping" runat="server" OnClick="shopping_Click" Text="购物车" Visible="False" />
                <asp:HyperLink ID="User" runat="server" Text="Label"></asp:HyperLink>
                <asp:Button ID="btn_login" runat="server" Text="login" Visible="False" OnClick="btn_login_Click" />
                <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" Text="logout" Visible="False" />
            </asp:Panel>
            <asp:Label ID="shuming" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:Panel ID="Panel1" runat="server" Height="353px" Width="1249px" HorizontalAlign="Center">
            
            <div style="float:left">
                <asp:Image ID="Image1" runat="server" Height="318px" Width="270px" style="margin-left: 69px" />
            </div>
            <div style="float:left; height: 216px; width: 876px;">
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
                <br />
                <br />
                图书编号：<asp:Label ID="bianhao" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                作者：<asp:Label ID="zuozhe" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="定价："></asp:Label>
                <asp:Label ID="dingjia" runat="server" Text="Label"></asp:Label>
                <br />
            </div>
            
            <asp:Button ID="addshopping" runat="server" OnClick="Button4_Click" Text="加入购物车" Visible="False" Height="46px" style="margin-top: 51px" Width="173px" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="532px" Width="1247px" HorizontalAlign="Center" style="margin-top: 6px">
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <br />
            <asp:Label ID="jian" runat="server" Text="简介"></asp:Label>
            <br />
            <asp:Label ID="jianjie" runat="server" BorderStyle="Inset" Height="193px" style="margin-top: 17px" Text="Label" Width="1247px"></asp:Label>
            <asp:Panel ID="pinglunqu" runat="server" Height="229px" style="margin-top: 0px" Width="1237px" ScrollBars="Auto">
                <asp:Label ID="Label6" runat="server" Text="评论区"></asp:Label>
            </asp:Panel>
        </asp:Panel>
        <asp:Label ID="Label7" runat="server" Text="添加你的评论："></asp:Label>
        <asp:TextBox ID="wodepinglun" runat="server" Height="178px" TextMode="MultiLine" Width="1237px"></asp:TextBox>
        <asp:Panel ID="Panel3" runat="server" Width="1237px" HorizontalAlign="Right" >
            <asp:Button ID="Button2" runat="server" Text="发送" OnClick="Button2_Click" />
            <asp:Label ID="Label8" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="清空" />
        </asp:Panel>
    </form>
</body>
</html>
