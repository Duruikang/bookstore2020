<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body  style="background-image:url(./images/login_bg.jpg);height: 118px">
    <form id="form1" runat="server">
        <div align="center">
            <asp:Image ID="Image1" runat="server" ImageUrl="./images/title.png" Height="115px" />
        </div>
        <div align="center">
            
            <asp:Panel ID="Panel1" runat="server" Height="200px" Width="1123px">
                <asp:Label ID="Label1" runat="server" Text="登录"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text="用户名"></asp:Label>
                ：<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="UserName" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="密码:" Width="63px"></asp:Label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="pwd" runat="server" ControlToValidate="Password" ErrorMessage="请您输入密码"></asp:RequiredFieldValidator>
                <br />
                <asp:CheckBox ID="Remember" runat="server" Text="记住我" Checked="false" />
                &nbsp;
                <asp:HyperLink ID="IsAdmin" runat="server" Target="_blank" Text="我是管理员" NavigateUrl="./login_admin.aspx"></asp:HyperLink>
                <br />
                <br />
                <asp:Panel ID="Panel2" runat="server" >
                    <asp:Button ID="btn_login" runat="server" Text="登录" OnClick="btn_login_Click" />
                    <asp:Label ID="Label4" runat="server" Width="50px"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./register.aspx">注册</asp:HyperLink>
                </asp:Panel>
            </asp:Panel>
            
        </div>
    </form>
</body>
</html>
