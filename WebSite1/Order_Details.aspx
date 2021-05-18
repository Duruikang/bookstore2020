<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order_Details.aspx.cs" Inherits="Order_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .color {
            background-color:rgba(0,0,0,0.1)
        }

    </style>
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div style="text-align:center">
            
            <asp:Label ID="Label1" runat="server" Text="定单详情"></asp:Label>
            
        </div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Inset" Height="680px" style="margin-left: 63px" Width="1014px"  CssClass="color">
            <asp:Panel ID="Panel2" runat="server" Height="661px" style="margin-left: 33px" Width="945px" BorderStyle="Outset">
                <asp:Panel ID="Panel3" runat="server" BorderStyle="Inset" Height="323px" Width="463px">
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BorderStyle="Inset">
                        <asp:Label ID="Label4" runat="server" Text="定单号："></asp:Label>
                        <asp:Label ID="Order_ID" runat="server"></asp:Label>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel5" runat="server" BorderStyle="Inset">
                        <asp:Label ID="Label2" runat="server" Text="下单用户："></asp:Label>
                        <asp:Label ID="User" runat="server"></asp:Label>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel6" runat="server" BorderStyle="Inset">
                        下单时间：<asp:Label ID="date" runat="server"></asp:Label>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel8" runat="server" style="margin-top: 0px" BorderStyle="Inset">
                        配送地址：<asp:Label ID="address" runat="server"></asp:Label>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel9" runat="server" BorderStyle="Inset">
                        <asp:Label ID="Label6" runat="server" Text="联系电话："></asp:Label>
                        <asp:Label ID="telephone" runat="server"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="Panel7" runat="server" BorderStyle="Inset" Height="341px" HorizontalAlign="Center" ScrollBars="Auto" style="margin-left: 3px; margin-top: 101px" Width="921px">
                    </asp:Panel>
                    <br />
                    <br />
                    </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
