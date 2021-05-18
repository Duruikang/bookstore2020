using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class book : System.Web.UI.Page
{ 
    Book books = new Book();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            User.Text = "您还未登录，点此登录：";
            btn_login.Visible = true;
            wodepinglun.ReadOnly = true;
        }
        else {
            User.Text = "欢迎您！用户:" + Session["uid"].ToString();
            User.NavigateUrl = "./gerenzhuye.aspx?last_url=./book.aspx?id=" + Request.Params["id"];
            btn_logout.Visible = true;
            shopping.Visible = true;
            addshopping.Visible = true;
        }
        books = findBook();
        shuming.Text = books.Name;
        Image1.ImageUrl = "./bookpic/" + books.ID.Trim() + ".jpg";
        jianjie.Text = books.Introduce;
        zuozhe.Text = books.Author;
        bianhao.Text = books.ID;
        dingjia.Text = books.Price;
        pinglun();
    }
    public void pinglun() {
        string bookid = Request.Params["id"];
        SqlConnection mycon = lianjie();
        string cmd = "select Comment_User_ID,Comments,times from Comment,Book where Book_ID ='" + bookid + "'and Book.Book_CommentID=Comment.Book_CommentID";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        while (data.Read()) {
            string comment = data[1] + "<br/>------------" + data[0] + " " + data[2];
            Label l1 = new Label();
            l1.Text = comment;
            l1.Width = 1237;
            l1.BorderStyle = BorderStyle.Inset;
            pinglunqu.Controls.Add(l1);
        }
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
    public Book findBook() {
        string bookid = Request.Params["id"];
        SqlConnection mycon = lianjie();
        string cmd = "select * from Book where Book_ID ='"+bookid +"'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        if (data.HasRows == false)
        {
            shuming.Text = "未找到该图书！！";
            mycon.Close();
            return null;
        }
        else {
            data.Read();
            books.ID = data[0].ToString();
            books.Name = data[1].ToString();
            books.Author = data[2].ToString();
            books.CommentID = data[3].ToString();
            books.Introduce = data[4].ToString();
            books.Price = data[5].ToString();
            data.Close();
            mycon.Close();
            return books;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        wodepinglun.Text = null;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (btn_login.Visible == true) {
            wodepinglun.Text = "您需要先登录才可以评论！";
        }
        else {
            string bookid = Request.Params["id"];
            SqlConnection mycon = lianjie();
            string cmd = "insert into Comment values('"+bookid+"','"+Session["uid"].ToString()+"','"+wodepinglun.Text+"','"+DateTime.Now.ToString()+"')";
            SqlCommand mycmd = new SqlCommand(cmd, mycon);
            if (mycmd.ExecuteNonQuery() != 1)
            {
                wodepinglun.Text = wodepinglun.Text + "评论失败！！";

            }
            else { 
                Response.Redirect(Request.Url.ToString());
                wodepinglun.Text = "评论成功！！";
            
            }
           
        }
        
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("./login.aspx?last_url=./book.aspx?id="+Request.Params["id"]);
    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(Request.Url.ToString());//页面刷新一次
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("./zhuye.aspx");
    }

    protected void shopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("./shopping.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "insert into Shopping values('"+Session["uid"]+"','"+ Request.Params["id"] + "','"+books.Name+"','"+books.Price+"')";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        if (mycmd.ExecuteNonQuery() == 1)
        {
            Response.Write("<script>alert('加入购物车成功!')</script>");
        }
        else {
            Response.Write("<script>alert('加入购物车失败!')</script>");
        }
        mycon.Close();
    }
}