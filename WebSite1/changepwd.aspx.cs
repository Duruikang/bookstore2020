using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class changepwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    public SqlConnection lianjie()
    {
        SqlConnection mycon = new SqlConnection();
        //string mystr = @"Data Source = DESKTOP-QIU326E;Initial Catalog = student;User ID = sa;Password = 105703145";
        string mystr = @"Data Source = DESKTOP-QIU326E;Initial Catalog = bookstore;Integrated Security = true";
        mycon.ConnectionString = mystr;
        mycon.Open();
        return mycon;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Password.Text =="") {
            Response.Write("<script>alert('密码不能为空!')</script>");
            return;
        }
        string  s = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5").ToLower();//密码使用MD5加密
        SqlConnection mycon = lianjie();
        string cmd = "update MyUser set User_Pwd='" + s + "' where User_ID='" + Session["uid"].ToString() + "'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        if (mycmd.ExecuteNonQuery() == 1)
        {
            Response.Write("<script>alert('修改成功!')</script>");
            Session.Abandon();
            Response.Redirect("./zhuye.aspx");
        }
        else
        {
            Response.Write("<script>alert('修改失败!')</script>");
        }
        mycon.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./gerenzhuye.aspx");
    }
}