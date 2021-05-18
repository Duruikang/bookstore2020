<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 922px">
    <form id="form1" runat="server">
        <div  align="center" style="height: 826px; background-image:url(./images/login_bg.jpg)">
            <asp:Panel ID="Panel1" runat="server" Height="778px" Width="734px">
                <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl="./images/title.png" Width="723px" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="账号不允许为空"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="UserName" ErrorMessage="账号必须仅由数字和字母组成且必须有数字和字母，长度为3-10位" ValidationExpression="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,10}$"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Text="密码："></asp:Label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="密码不允许为空"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Password" ErrorMessage="密码必须仅由数字和字母组成且必须有数字和字母，长度为3-10位" ValidationExpression="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,10}$"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                <asp:TextBox ID="Password2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password2" ErrorMessage="密码不允许为空"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="Password2" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
