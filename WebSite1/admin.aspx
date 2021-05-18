<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .center {
            text-align:center;
            margin-top: 61px;
        }
    </style>
</head>
<body style="background-image:url('images/search_bg.png'); text-align:center; margin-left:50px">
    <form id="form1" runat="server" style="text-align:center">
        <div style="text-align:center; width: 1162px;">
            <asp:Label ID="Label1" runat="server" Text="后台管理"></asp:Label>
        </div>
        
        <asp:Panel ID="Panel1" runat="server"  CssClass="center" BorderStyle="Inset" Width="1158px">
            <asp:Label ID="Label2" runat="server" Text="用户管理"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" OnRowCreated="GridView1_RowCreated" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="bookstore_user" Width="1156px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" ReadOnly="True" SortExpression="User_ID" />
                    <asp:BoundField DataField="User_Money" HeaderText="User_Money" SortExpression="User_Money" />
                    <asp:BoundField DataField="User_Telephone" HeaderText="User_Telephone" SortExpression="User_Telephone" />
                    <asp:BoundField DataField="User_Address" HeaderText="User_Address" SortExpression="User_Address" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
        <asp:SqlDataSource ID="bookstore_user" runat="server" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [MyUser] WHERE [User_ID] = @original_User_ID AND (([User_Money] = @original_User_Money) OR ([User_Money] IS NULL AND @original_User_Money IS NULL)) AND (([User_Telephone] = @original_User_Telephone) OR ([User_Telephone] IS NULL AND @original_User_Telephone IS NULL)) AND (([User_Address] = @original_User_Address) OR ([User_Address] IS NULL AND @original_User_Address IS NULL))" InsertCommand="INSERT INTO [MyUser] ([User_ID], [User_Money], [User_Telephone], [User_Address]) VALUES (@User_ID, @User_Money, @User_Telephone, @User_Address)" SelectCommand="SELECT [User_ID], [User_Money], [User_Telephone], [User_Address] FROM [MyUser]" UpdateCommand="UPDATE [MyUser] SET [User_Money] = @User_Money, [User_Telephone] = @User_Telephone, [User_Address] = @User_Address WHERE [User_ID] = @original_User_ID AND (([User_Money] = @original_User_Money) OR ([User_Money] IS NULL AND @original_User_Money IS NULL)) AND (([User_Telephone] = @original_User_Telephone) OR ([User_Telephone] IS NULL AND @original_User_Telephone IS NULL)) AND (([User_Address] = @original_User_Address) OR ([User_Address] IS NULL AND @original_User_Address IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_User_ID" Type="String" />
                <asp:Parameter Name="original_User_Money" Type="Decimal" />
                <asp:Parameter Name="original_User_Telephone" Type="String" />
                <asp:Parameter Name="original_User_Address" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_ID" Type="String" />
                <asp:Parameter Name="User_Money" Type="Decimal" />
                <asp:Parameter Name="User_Telephone" Type="String" />
                <asp:Parameter Name="User_Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Money" Type="Decimal" />
                <asp:Parameter Name="User_Telephone" Type="String" />
                <asp:Parameter Name="User_Address" Type="String" />
                <asp:Parameter Name="original_User_ID" Type="String" />
                <asp:Parameter Name="original_User_Money" Type="Decimal" />
                <asp:Parameter Name="original_User_Telephone" Type="String" />
                <asp:Parameter Name="original_User_Address" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" OnItemCreated="DetailsView1_ItemCreated" AutoGenerateRows="False" DataKeyNames="User_ID" DataSourceID="user_datails" OnModeChanged="DetailsView1_ModeChanged" Height="50px" Width="1153px" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="User_Money" HeaderText="User_Money" SortExpression="User_Money" />
                    <asp:BoundField DataField="User_Telephone" HeaderText="User_Telephone" SortExpression="User_Telephone" />
                    <asp:BoundField DataField="User_Address" HeaderText="User_Address" SortExpression="User_Address" />
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" ReadOnly="True" SortExpression="User_ID" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="user_datails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [MyUser] WHERE [User_ID] = @original_User_ID AND (([User_Money] = @original_User_Money) OR ([User_Money] IS NULL AND @original_User_Money IS NULL)) AND (([User_Telephone] = @original_User_Telephone) OR ([User_Telephone] IS NULL AND @original_User_Telephone IS NULL)) AND (([User_Address] = @original_User_Address) OR ([User_Address] IS NULL AND @original_User_Address IS NULL))" InsertCommand="INSERT INTO [MyUser] ([User_Money], [User_Telephone], [User_Address], [User_ID]) VALUES (@User_Money, @User_Telephone, @User_Address, @User_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [User_Money], [User_Telephone], [User_Address], [User_ID] FROM [MyUser] WHERE ([User_ID] = @User_ID)" UpdateCommand="UPDATE [MyUser] SET [User_Money] = @User_Money, [User_Telephone] = @User_Telephone, [User_Address] = @User_Address WHERE [User_ID] = @original_User_ID AND (([User_Money] = @original_User_Money) OR ([User_Money] IS NULL AND @original_User_Money IS NULL)) AND (([User_Telephone] = @original_User_Telephone) OR ([User_Telephone] IS NULL AND @original_User_Telephone IS NULL)) AND (([User_Address] = @original_User_Address) OR ([User_Address] IS NULL AND @original_User_Address IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_User_Money" Type="Decimal" />
                    <asp:Parameter Name="original_User_Telephone" Type="String" />
                    <asp:Parameter Name="original_User_Address" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="User_Money" Type="Decimal" />
                    <asp:Parameter Name="User_Telephone" Type="String" />
                    <asp:Parameter Name="User_Address" Type="String" />
                    <asp:Parameter Name="User_ID" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="User_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="User_Money" Type="Decimal" />
                    <asp:Parameter Name="User_Telephone" Type="String" />
                    <asp:Parameter Name="User_Address" Type="String" />
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_User_Money" Type="Decimal" />
                    <asp:Parameter Name="original_User_Telephone" Type="String" />
                    <asp:Parameter Name="original_User_Address" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Inset" Width="1160px">
            <asp:Label ID="Label3" runat="server" Text="定单管理"></asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Order_ID" DataSourceID="bookstore_dingdan"  Width="1155px" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" />
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" ReadOnly="True" SortExpression="User_ID" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:HyperLinkField DataNavigateUrlFields="Order_ID" DataNavigateUrlFormatString="Order_Details.aspx?order_id={0}" HeaderText="订单详情" Target="_blank" Text="点击查看" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="bookstore_dingdan" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [MyOrder] WHERE [Order_ID] = @original_Order_ID AND [User_ID] = @original_User_ID AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) delete from Order_Details where Order_ID=@original_Order_ID" InsertCommand="INSERT INTO [MyOrder] ([User_ID], [date]) VALUES (@User_ID, @date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Order_ID], [User_ID], [date] FROM [MyOrder]" UpdateCommand="UPDATE [MyOrder] SET [date] = @date WHERE [Order_ID] = @original_Order_ID AND [User_ID] = @original_User_ID AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Order_ID" Type="Int32" />
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_date" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="User_ID" Type="String" />
                    <asp:Parameter Name="date" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="date" Type="String" />
                    <asp:Parameter Name="original_Order_ID" Type="Int32" />
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_date" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Height="537px" Width="1167px">
            <asp:Label ID="Label4" runat="server" Text="图书管理"></asp:Label>
            <br />
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Book_ID" DataSourceID="bookstore_book" PageSize="5" Width="1163px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Book_ID" HeaderText="Book_ID" SortExpression="Book_ID" ReadOnly="True" />
                    <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name" />
                    <asp:BoundField DataField="Book_Author" HeaderText="Book_Author" SortExpression="Book_Author" />
                    <asp:BoundField DataField="Book_CommentID" HeaderText="Book_CommentID" SortExpression="Book_CommentID" />
                    <asp:BoundField DataField="Book_Introduce" HeaderText="Book_Introduce" SortExpression="Book_Introduce" />
                    <asp:BoundField DataField="Book_Price" HeaderText="Book_Price" SortExpression="Book_Price" />
                    <asp:BoundField DataField="Book_Category" HeaderText="Book_Category" SortExpression="Book_Category" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="bookstore_book" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [Book] WHERE [Book_ID] = @original_Book_ID AND (([Book_Name] = @original_Book_Name) OR ([Book_Name] IS NULL AND @original_Book_Name IS NULL)) AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND [Book_CommentID] = @original_Book_CommentID AND (([Book_Introduce] = @original_Book_Introduce) OR ([Book_Introduce] IS NULL AND @original_Book_Introduce IS NULL)) AND [Book_Price] = @original_Book_Price AND (([Book_Category] = @original_Book_Category) OR ([Book_Category] IS NULL AND @original_Book_Category IS NULL))" InsertCommand="INSERT INTO [Book] ([Book_ID], [Book_Name], [Book_Author], [Book_CommentID], [Book_Introduce], [Book_Price], [Book_Category]) VALUES (@Book_ID, @Book_Name, @Book_Author, @Book_CommentID, @Book_Introduce, @Book_Price, @Book_Category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [Book_Name] = @Book_Name, [Book_Author] = @Book_Author, [Book_CommentID] = @Book_CommentID, [Book_Introduce] = @Book_Introduce, [Book_Price] = @Book_Price, [Book_Category] = @Book_Category WHERE [Book_ID] = @original_Book_ID AND (([Book_Name] = @original_Book_Name) OR ([Book_Name] IS NULL AND @original_Book_Name IS NULL)) AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND [Book_CommentID] = @original_Book_CommentID AND (([Book_Introduce] = @original_Book_Introduce) OR ([Book_Introduce] IS NULL AND @original_Book_Introduce IS NULL)) AND [Book_Price] = @original_Book_Price AND (([Book_Category] = @original_Book_Category) OR ([Book_Category] IS NULL AND @original_Book_Category IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                    <asp:Parameter Name="original_Book_Name" Type="String" />
                    <asp:Parameter Name="original_Book_Author" Type="String" />
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Book_Introduce" Type="String" />
                    <asp:Parameter Name="original_Book_Price" Type="String" />
                    <asp:Parameter Name="original_Book_Category" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Book_ID" Type="String" />
                    <asp:Parameter Name="Book_Name" Type="String" />
                    <asp:Parameter Name="Book_Author" Type="String" />
                    <asp:Parameter Name="Book_CommentID" Type="String" />
                    <asp:Parameter Name="Book_Introduce" Type="String" />
                    <asp:Parameter Name="Book_Price" Type="String" />
                    <asp:Parameter Name="Book_Category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Book_Name" Type="String" />
                    <asp:Parameter Name="Book_Author" Type="String" />
                    <asp:Parameter Name="Book_CommentID" Type="String" />
                    <asp:Parameter Name="Book_Introduce" Type="String" />
                    <asp:Parameter Name="Book_Price" Type="String" />
                    <asp:Parameter Name="Book_Category" Type="String" />
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                    <asp:Parameter Name="original_Book_Name" Type="String" />
                    <asp:Parameter Name="original_Book_Author" Type="String" />
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Book_Introduce" Type="String" />
                    <asp:Parameter Name="original_Book_Price" Type="String" />
                    <asp:Parameter Name="original_Book_Category" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:DetailsView ID="DetailsView2" runat="server" OnModeChanged="DetailsView2_ModeChanged" AutoGenerateRows="False" DataKeyNames="Book_ID" DataSourceID="book_details" Height="50px" Width="1161px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top: 9px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Book_ID" HeaderText="Book_ID" ReadOnly="True" SortExpression="Book_ID" />
                    <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name" />
                    <asp:BoundField DataField="Book_Author" HeaderText="Book_Author" SortExpression="Book_Author" />
                    <asp:BoundField DataField="Book_CommentID" HeaderText="Book_CommentID" SortExpression="Book_CommentID" />
                    <asp:BoundField DataField="Book_Introduce" HeaderText="Book_Introduce" SortExpression="Book_Introduce" />
                    <asp:BoundField DataField="Book_Price" HeaderText="Book_Price" SortExpression="Book_Price" />
                    <asp:BoundField DataField="Book_Category" HeaderText="Book_Category" SortExpression="Book_Category" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="book_details" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [Book] WHERE [Book_ID] = @original_Book_ID AND (([Book_Name] = @original_Book_Name) OR ([Book_Name] IS NULL AND @original_Book_Name IS NULL)) AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND [Book_CommentID] = @original_Book_CommentID AND (([Book_Introduce] = @original_Book_Introduce) OR ([Book_Introduce] IS NULL AND @original_Book_Introduce IS NULL)) AND [Book_Price] = @original_Book_Price AND (([Book_Category] = @original_Book_Category) OR ([Book_Category] IS NULL AND @original_Book_Category IS NULL))" InsertCommand="INSERT INTO [Book] ([Book_ID], [Book_Name], [Book_Author], [Book_CommentID], [Book_Introduce], [Book_Price], [Book_Category]) VALUES (@Book_ID, @Book_Name, @Book_Author, @Book_CommentID, @Book_Introduce, @Book_Price, @Book_Category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Book] WHERE ([Book_ID] = @Book_ID)" UpdateCommand="UPDATE [Book] SET [Book_Name] = @Book_Name, [Book_Author] = @Book_Author, [Book_CommentID] = @Book_CommentID, [Book_Introduce] = @Book_Introduce, [Book_Price] = @Book_Price, [Book_Category] = @Book_Category WHERE [Book_ID] = @original_Book_ID AND (([Book_Name] = @original_Book_Name) OR ([Book_Name] IS NULL AND @original_Book_Name IS NULL)) AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND [Book_CommentID] = @original_Book_CommentID AND (([Book_Introduce] = @original_Book_Introduce) OR ([Book_Introduce] IS NULL AND @original_Book_Introduce IS NULL)) AND [Book_Price] = @original_Book_Price AND (([Book_Category] = @original_Book_Category) OR ([Book_Category] IS NULL AND @original_Book_Category IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                    <asp:Parameter Name="original_Book_Name" Type="String" />
                    <asp:Parameter Name="original_Book_Author" Type="String" />
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Book_Introduce" Type="String" />
                    <asp:Parameter Name="original_Book_Price" Type="String" />
                    <asp:Parameter Name="original_Book_Category" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Book_ID" Type="String" />
                    <asp:Parameter Name="Book_Name" Type="String" />
                    <asp:Parameter Name="Book_Author" Type="String" />
                    <asp:Parameter Name="Book_CommentID" Type="String" />
                    <asp:Parameter Name="Book_Introduce" Type="String" />
                    <asp:Parameter Name="Book_Price" Type="String" />
                    <asp:Parameter Name="Book_Category" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView3" Name="Book_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Book_Name" Type="String" />
                    <asp:Parameter Name="Book_Author" Type="String" />
                    <asp:Parameter Name="Book_CommentID" Type="String" />
                    <asp:Parameter Name="Book_Introduce" Type="String" />
                    <asp:Parameter Name="Book_Price" Type="String" />
                    <asp:Parameter Name="Book_Category" Type="String" />
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                    <asp:Parameter Name="original_Book_Name" Type="String" />
                    <asp:Parameter Name="original_Book_Author" Type="String" />
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Book_Introduce" Type="String" />
                    <asp:Parameter Name="original_Book_Price" Type="String" />
                    <asp:Parameter Name="original_Book_Category" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server" Height="304px" style="margin-top: 35px" Width="1166px">
            <asp:Label ID="Label5" runat="server" Text="用户评论"></asp:Label>
            <br />
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Book_CommentID,Comment_User_ID,times" DataSourceID="bookstore_comment" Height="143px" PageSize="5" Width="1160px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="Book_CommentID" HeaderText="Book_CommentID" ReadOnly="True" SortExpression="Book_CommentID" />
                    <asp:BoundField DataField="Comment_User_ID" HeaderText="Comment_User_ID" ReadOnly="True" SortExpression="Comment_User_ID" />
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" >
                    <HeaderStyle Width="220px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="times" HeaderText="times" ReadOnly="True" SortExpression="times" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="bookstore_comment" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [Comment] WHERE [Book_CommentID] = @original_Book_CommentID AND [Comment_User_ID] = @original_Comment_User_ID AND [times] = @original_times AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))" InsertCommand="INSERT INTO [Comment] ([Book_CommentID], [Comment_User_ID], [Comments], [times]) VALUES (@Book_CommentID, @Comment_User_ID, @Comments, @times)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Comment]" UpdateCommand="UPDATE [Comment] SET [Comments] = @Comments WHERE [Book_CommentID] = @original_Book_CommentID AND [Comment_User_ID] = @original_Comment_User_ID AND [times] = @original_times AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Comment_User_ID" Type="String" />
                    <asp:Parameter Name="original_times" Type="String" />
                    <asp:Parameter Name="original_Comments" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Book_CommentID" Type="String" />
                    <asp:Parameter Name="Comment_User_ID" Type="String" />
                    <asp:Parameter Name="Comments" Type="String" />
                    <asp:Parameter Name="times" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Comments" Type="String" />
                    <asp:Parameter Name="original_Book_CommentID" Type="String" />
                    <asp:Parameter Name="original_Comment_User_ID" Type="String" />
                    <asp:Parameter Name="original_times" Type="String" />
                    <asp:Parameter Name="original_Comments" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label6" runat="server" Text="榜单管理"></asp:Label>
            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="List_ID" DataSourceID="list" ForeColor="#333333" GridLines="None" Width="1160px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="List_ID" HeaderText="List_ID" ReadOnly="True" SortExpression="List_ID" />
                    <asp:BoundField DataField="Book_ID" HeaderText="Book_ID" SortExpression="Book_ID" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="list" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bookstoreConnectionString %>" DeleteCommand="DELETE FROM [List] WHERE [List_ID] = @original_List_ID AND [Book_ID] = @original_Book_ID" InsertCommand="INSERT INTO [List] ([List_ID], [Book_ID]) VALUES (@List_ID, @Book_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [List]" UpdateCommand="UPDATE [List] SET [Book_ID] = @Book_ID WHERE [List_ID] = @original_List_ID AND [Book_ID] = @original_Book_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_List_ID" Type="String" />
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="List_ID" Type="String" />
                    <asp:Parameter Name="Book_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Book_ID" Type="String" />
                    <asp:Parameter Name="original_List_ID" Type="String" />
                    <asp:Parameter Name="original_Book_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </form>
</body>
</html>
