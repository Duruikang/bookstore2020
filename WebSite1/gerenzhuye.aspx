<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gerenzhuye.aspx.cs" Inherits="gerenzhuye" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
         .a{
             padding-left:50px;
             text-align:left;
             background-color:rgba(0, 0, 0,0.1);
            margin-top: 149px;
        }
    </style>
   
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="Image1" runat="server" ImageUrl="./images/profile.png" OnClick="Image1_Click" />
        </div>
        <div  align="center" style="height: 826px" >
            <asp:Panel ID="Panel1" runat="server" Height="778px" Width="834px" BorderStyle="Ridge" Wrap="False">
                
                <asp:Panel ID="Panel2" runat="server" CssClass="a" Height="473px">
                    <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="用  户  名："></asp:Label>
                <asp:TextBox ID="UserName" runat="server" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改密码" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="我的定单" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="购物车" />
                    <br />
                    <br />
                    <asp:Label ID="yue" runat="server" Text="账户余额："></asp:Label>
                    <asp:Label ID="Money" runat="server" style="margin-left: 0px" Width="64px"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="电话号码："></asp:Label>
                    <asp:TextBox ID="Telephone" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Telephone" ErrorMessage="手机号格式错误" ValidationExpression="(\(\d{3}\)|\d{3})?\d{8}"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="配送地址："></asp:Label>
                    <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认更改" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="取消修改" />
                </asp:Panel>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
