using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class Order_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        SqlConnection mycon = lianjie();
        string cmd = "select * from Order_Details where Order_ID='"+Request.Params["order_id"]+"'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        while (data.Read()) {
            HyperLink hy = new HyperLink();
            hy.Target = "_blank";
            hy.NavigateUrl = "./book.aspx?id="+data["Book_ID"].ToString();
            hy.Text = "图书编号：" + data["Book_ID"].ToString() + " 书名：" + data["Book_Name"]+" 价格："+data["Book_Price"];
            Panel7.Controls.Add(hy);
            HtmlGenericControl hgc = new HtmlGenericControl("br");
            Panel7.Controls.Add(hgc);
        }
        cmd = "select * from MyOrder where Order_ID=" + Request.Params["order_id"];
        SqlConnection mycon2 = lianjie();
        SqlCommand mycmd2 = new SqlCommand(cmd,mycon2);
        SqlDataReader data2 = mycmd2.ExecuteReader();
        data2.Read();
        SqlConnection mycon3 = lianjie();
        string cmd2 = "select *from MyUser where User_ID='" + data2["User_ID"].ToString() + "'";
        SqlCommand mycmd3 = new SqlCommand(cmd2, mycon3);
        SqlDataReader data3 = mycmd3.ExecuteReader();
        data3.Read();
        User.Text = data2["User_ID"].ToString();
        Order_ID.Text = data2["Order_ID"].ToString();
        date.Text = data2["date"].ToString();
        address.Text = data3["User_Address"].ToString();
        telephone.Text = data3["User_Telephone"].ToString();
        mycon.Close();
        mycon2.Close();
        mycon3.Close();
    }
    public SqlConnection lianjie()
    {
        SqlConnection mycon = new SqlConnection();
        //string mystr = @"Data Source = DESKTOP-QIU326E;Initial Catalog = bookstore;User ID = sa;Password = 105703145";
        string mystr = @"Data Source = DESKTOP-QIU326E;Initial Catalog = bookstore;Integrated Security = true";
        mycon.ConnectionString = mystr;
        mycon.Open();
        return mycon;
    }
}