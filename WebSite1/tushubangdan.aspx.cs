using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class tushubangdan : System.Web.UI.Page
{
    Book[] a = new Book[10];//图书榜单只有十本书
    HyperLink []hy = new HyperLink[10];
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
            User.NavigateUrl = "./gerenzhuye.aspx?last_url=./tushubangdan.aspx";
            btn_logout.Visible = true;
            shopping.Visible = true;
        }
        SqlConnection mycon = lianjie();
        string cmd = "select * from Book,List where Book.Book_ID = List.Book_ID order by List.List_ID ASC";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        int i = 0;
        while (data.Read()) {
            Image ima = new Image();
            ima.ImageUrl = "./bookpic/"+data["Book_ID"].ToString().Trim()+".jpg";ima.Width = 50;ima.Height = 60;

            hy[i] = new HyperLink();
            hy[i].Text = (i+1).ToString()+":"+data["Book_Name"].ToString();
            hy[i].NavigateUrl ="./book.aspx"+"?id="+data["Book_ID"].ToString();
            hy[i].Width = 1192;
            hy[i].Target = "_blank";
            this.Controls.Add(ima);
            this.Controls.Add(hy[i]);
            HtmlGenericControl hgc = new HtmlGenericControl("br");
            this.Controls.Add(hgc);
            i++;
        }
        Image im = new Image();im.ImageUrl = "./images/fengexian.png";im.Width = 1192;
        this.Controls.Add(im);
        Image im2 = new Image(); im2.ImageUrl = "./images/banquan.png"; im2.Width = 1192;
        this.Controls.Add(im2);
        data.Close();
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./zhuye.aspx");
    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(Request.Url.ToString());//页面刷新一次
    }

   protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("./login.aspx?last_url=./tushubangdan.aspx");
    }

    protected void shopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("./shopping.aspx");
    }
}