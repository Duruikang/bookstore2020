using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class shopping : System.Web.UI.Page
{
    Book books = new Book();
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
            User.NavigateUrl = "./gerenzhuye.aspx?last_url=./book.aspx?id=" + Request.Params["id"];
            btn_logout.Visible = true;
            Label1.Text = "用户" + Session["uid"] + "的购物车";
            findShopping();
        }
    }

    /*void findShopping() {
        SqlConnection mycon = lianjie();
        string cmd = "select *from Shopping where User_ID='"+Session["uid"].ToString()+"'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data= mycmd.ExecuteReader();
        while (data.Read()) {
            Panel p = new Panel();  
            HyperLink hy = new HyperLink();
            hy.Text = data["Book_Name"].ToString();
            hy.NavigateUrl= "./book.aspx" + "?id=" + data["Book_ID"].ToString();
            CheckBox cb = new CheckBox();
            cb.ID = data["Book_ID"].ToString();
            p.Controls.Add(cb);
            p.Controls.Add(hy);
            Panel6.Controls.Add(p);
            HtmlGenericControl hgc = new HtmlGenericControl("br");
            Panel6.Controls.Add(hgc);
        }
        mycon.Close();
    }*/
    void findShopping()
    {
        SqlConnection mycon = lianjie();
        string cmd = "select *from Shopping where User_ID='" + Session["uid"].ToString() + "'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        while (data.Read())
        {
            ListItem li = new ListItem();
            li.Text= data["Book_ID"]+": "+data["Book_Name"].ToString();
            li.Value = data["Shopping_ID"].ToString() ;
            dingdan.Items.Add(li);
        }
        mycon.Close();
    }
    bool isNull() {
        SqlConnection mycon = lianjie();
        string cmd = "select *from Shopping where User_ID='" + Session["uid"].ToString() + "'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        bool flag = data.HasRows;
        mycon.Close();
        return flag;
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

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("./login.aspx?last_url=./shopping.aspx" );
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

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (!isNull()) {
            Response.Write("<script>alert('购物车为空!')</script>");
            return;
        }
        SqlConnection mycon = lianjie();
        string cmd = "insert into MyOrder values('"+Session["uid"]+"','"+ DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")+"') ";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        mycmd.ExecuteNonQuery();
        cmd = "select max(Order_ID)as order_id from MyOrder ";
        mycmd.CommandText = cmd;
        SqlDataReader data = mycmd.ExecuteReader();
        data.Read();
        int order_id = int.Parse(data["order_id"].ToString());//获得orderid
        data.Close();
        mycon.Close();
        //
        SqlConnection mycon2 = lianjie();
        string cmd2 = "select *from Shopping where User_ID='" + Session["uid"].ToString() + "'";
        SqlCommand mycmd2 = new SqlCommand(cmd2, mycon2);
        SqlDataReader data2 = mycmd2.ExecuteReader();
        SqlCommand mycmd3 = new SqlCommand();
        SqlConnection mycon3 = lianjie();
        while (data2.Read()) { 
            string cmd3="insert into Order_Details values("+order_id.ToString()+",'"+data2["Book_ID"]+"','"+data2["Book_Name"]+"','"+data2["Book_Price"]+"')";
            mycmd3.CommandText = cmd3;
            mycmd3.Connection = mycon3;
            mycmd3.ExecuteNonQuery();
        }
        mycon3.Close();
        mycon2.Close();
        SqlConnection mycon4 = lianjie();
        string cmd4 = "delete from Shopping where User_ID='"+Session["uid"].ToString()+"'";
        SqlCommand mycmd4 = new SqlCommand(cmd4, mycon4);
        mycmd4.ExecuteNonQuery();
        mycon4.Close();
        Response.Write("<script>alert('定单生成成功!');window.location.href ='./zhuye.aspx'</script>");//定单生成后跳到订单详情页
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "delete from Shopping where User_ID ='"+ Session["uid"]+"'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        dingdan.Items.Clear();
        if (mycmd.ExecuteNonQuery() != 0)
        {
            Response.Write("<script>alert('清空成功!')</script>");
        }
        else {
            Response.Write("<script>alert('清空失败!')</script>");
        }
        mycon.Close();
    }


    protected void Button6_Click(object sender, EventArgs e)
    {   

        SqlConnection mycon = lianjie();
        string cmd;
        SqlCommand mycmd = new SqlCommand();
        for (int i = dingdan.Items.Count-1; i >= 0; i--) {
            if (dingdan.Items[i].Selected == true)
            {
                cmd="delete from Shopping where Shopping_ID="+dingdan.Items[i].Value;
                mycmd.CommandText = cmd;
                mycmd.Connection = mycon;
                mycmd.ExecuteNonQuery();

            }        
        }
        Response.Redirect(Request.Url.ToString());
        mycon.Close();
    }
}