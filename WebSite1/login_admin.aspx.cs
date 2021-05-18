using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class login_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void btn_login_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "select* from Admin where Admin_ID ='" + UserName.Text + "'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        if (data.HasRows == false)
        {
            Response.Write("<script>alert('用户不存在!')</script>");
        }
        else
        {
            data.Read();
            string s = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5").ToLower();//密码使用MD5加密
            if (data[1].ToString().Trim() == s)//nchar数据取出是带空格的，使用Trim去除
            {
                Response.Redirect("./admin.aspx");

            }
            else
            {
                Response.Write(s);
                Response.Write(data[1].ToString());
                //Response.Write("<script>alert('密码错误!')</script>");
            }
        }
        mycon.Close();
    }

}