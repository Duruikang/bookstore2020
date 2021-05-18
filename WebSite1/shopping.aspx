<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopping.aspx.cs" Inherits="shopping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        
    </title>
    <style>
        .center {
            text-align:center;
        }
        .right {
            text-align:right;
        }
        .backcolor {
            background-color:rgba(0, 0, 0,0.1);
        }
    </style>
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div  style="width: 1249px;text-align:center;">
            <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right" Width="1199px" >
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="返回主页" />
                <asp:HyperLink ID="User" runat="server" Text="Label"></asp:HyperLink>
                <asp:Button ID="btn_login" runat="server" Text="login" Visible="False" OnClick="btn_login_Click" />
                <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" Text="logout" Visible="False" />
            </asp:Panel>
        </div>
        <asp:Panel ID="Panel5" runat="server" CssClass="center">
            <asp:Label ID="Label1" runat="server" Text="请您先登录"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="Panel6" runat="server" Height="417px" ScrollBars="Vertical" style="margin-top: 19px; margin-left: 41px;" CssClass="center" BorderStyle="Solid" Width="1141px">
            <asp:Panel ID="Panel8" runat="server" Height="413px" style="margin-left: 70px" Width="1014px"  CssClass="backcolor" >
                <asp:CheckBoxList ID="dingdan" runat="server" Height="45px" Width="1009px">
                </asp:CheckBoxList>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel7" runat="server" CssClass="right" Width="1184px">
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="生成定单" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Text="删除选中项" OnClick="Button6_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="清空购物车" Width="155px" />
        </asp:Panel>
    </form>
</body>
</html>
