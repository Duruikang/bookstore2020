<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kunpengfaxian.aspx.cs" Inherits="kunpengfaxian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   
    <style>
        .a{
            vertical-align:middle;
            margin-left:10px;
        }
    </style>
</head>
<body style="height: 433px;background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server" defaultbutton="Button1">
        <div style="text-align:center">
            <asp:ImageButton ID="Image1" runat="server" ImageUrl="./images/search.png" OnClick="Image1_Click" />
            <asp:Panel ID="Panel1" runat="server" Height="523px" Style="margin-top: 90px" BorderStyle="Outset">
                <asp:Label ID="Label2" runat="server" Text="请输入图书名字："></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="501px" CssClass="a" Font-Size="Large"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="search" CssClass="a" Height="41px" Width="126px" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="搜索结果"></asp:Label>
                <asp:Panel ID="jieguo" runat="server" BorderStyle="Inset" Height="411px" ScrollBars="Auto" Style="margin-top: 37px">
                </asp:Panel>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
