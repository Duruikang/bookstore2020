using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["remember"]!= null&&!IsPostBack)//回发时会刷新页面，即重新执行Pageload因此需要条件判断是否二次执行pageload；
        {
                UserName.Text = Request.Cookies["remember"]["UserName"];
                TextBox linshi = new TextBox();
                linshi.Text = Request.Cookies["remember"]["Password"];
                linshi.Visible = false;
                this.Password.Attributes.Add("value", linshi.Text);//这样才能给textmode为password里自动填入
                Remember.Checked = true;
        }
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
        string cmd = "select* from MyUser where User_ID ='" + UserName.Text + "'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        if (data.HasRows == false)
        {
            Response.Write("<script>alert('用户不存在!')</script>");
        }
        else
        { 
            data.Read();
            string s;
            if (Password.Text.Length != 32)
            {
                s = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5").ToLower();//密码使用MD5加密
            }
            else 
            {
                s = Password.Text;
            }

            if (data[1].ToString().Trim() == s)//nchar数据取出是带空格的，使用Trim去除
            {
                if (Remember.Checked == true)
                {
                    HttpCookie mycookie = new HttpCookie("remember");
                    mycookie.Values["UserName"] = UserName.Text;
                    mycookie.Values["Password"] = s;
                    mycookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(mycookie);
                }
                else {
                    Response.Cookies["remember"].Expires = DateTime.Now.AddDays(-1);

                }
                Session.Add("uid", data[0]);
                Session.Timeout = 5;//5分钟后登录信息失效
                if (Request.Params["last_url"] == null) Response.Redirect("./zhuye.aspx");
                Response.Redirect(Request.Params["last_url"].ToString());

            }
            else 
            {
                Response.Write("<script>alert('密码错误!')</script>");
            }
        }
        mycon.Close();
    }

}