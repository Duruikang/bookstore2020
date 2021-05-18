using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            User.Text = "您还未登录，点此登录：";
            btn_login.Visible = true;
        }
        else
        {
            User.Text = "欢迎您！用户:" + Session["uid"].ToString();
            User.NavigateUrl = "./gerenzhuye.aspx?last_url=./zhuye.aspx";
            btn_logout.Visible = true;
            shopping.Visible = true;
            if (Menu1.Items[4].Value == "用户登录") Menu1.Items.RemoveAt(4);

        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("./login.aspx?last_url=./zhuye.aspx");//若使用url作为参数名会与默认的参数冲突
    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(Request.Url.ToString());//页面刷新一次
    }

    protected void shopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("./shopping.aspx");
    }
}