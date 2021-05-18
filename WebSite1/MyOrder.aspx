<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .center {
            text-align:center
        }

    </style>
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div style="text-align:center; height: 22px;">
            <asp:Label ID="Label1" runat="server" Text="我的定单" Font-Size="Large"></asp:Label>
        </div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Groove" Height="520px" style="margin-left: 95px; margin-top: 48px" Width="1009px" CssClass="center">
            <asp:Panel ID="Panel2" runat="server" CssClass="center">
                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" TextMode="Date"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查询定单" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 2px" Text="所有定单" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
