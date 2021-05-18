<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepwd.aspx.cs" Inherits="changepwd" %>

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
             margin-left:350px;
        }
    </style>
   
</head>
<body style="background-image:url(./images/search_bg.png)">
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="Image1" runat="server" ImageUrl="./images/profile.png" />
        </div>
        <div  style="height: 826px; text-align:center; vertical-align: middle;" >
            <asp:Panel ID="Panel1" runat="server" Height="778px" Width="1192px" BorderStyle="Ridge">
                
                <asp:Panel ID="Panel2" runat="server" CssClass="a" Height="473px" Width="500px">
                    <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="我的密码："></asp:Label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Password" ErrorMessage="密码必须仅由数字和字母组成且必须有数字和字母，长度为3-10位" ValidationExpression="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,10}$"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                <asp:TextBox ID="Password2" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="Password2" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认更改" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="取消更改" OnClick="Button2_Click" />
                </asp:Panel>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
