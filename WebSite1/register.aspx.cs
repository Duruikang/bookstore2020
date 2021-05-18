using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "select *from MyUser where User_ID= '"+ UserName.Text+"'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        string s = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5").ToLower();//密码使用MD5加密
        string cmd2 = "insert into MyUser values('"+UserName.Text+"','"+s+"',null,null,null)";
        SqlDataReader data = mycmd.ExecuteReader();
        if (data.HasRows)
        {
            Response.Write("<script>alert('用户已存在!')</script>");
        }
        else 
        {
            data.Close();
            SqlCommand mycmd2 = new SqlCommand(cmd2, mycon);
            if (mycmd2.ExecuteNonQuery() == 1)
            {
                Response.Redirect("./register_success.aspx");
            }
            else {
                Response.Write("<script>alert('注册失败!')</script>");

            }
        
        }
        mycon.Close();
        
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
}