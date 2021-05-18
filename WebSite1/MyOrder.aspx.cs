using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class MyOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            suoyoudingdan();
        }
        
    }
    void suoyoudingdan() {
        SqlConnection mycon = lianjie();
        string cmd = "select * from MyOrder where User_ID='" + Session["uid"] + "'";
        SqlCommand mycmd = new SqlCommand(cmd, mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        while (data.Read())
        {
            HyperLink hy = new HyperLink();
            hy.Target = "_blank";
            hy.Text = "订单号：" + data["Order_ID"].ToString().Trim() + "  下单时间：" + data["date"].ToString().Trim();
            hy.NavigateUrl = "./Order_Details.aspx?order_id=" + data["Order_ID"].ToString().Trim();
            Panel1.Controls.Add(hy);
            HtmlGenericControl hgc = new HtmlGenericControl("br");
            Panel1.Controls.Add(hgc);
        }
        mycon.Close();

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "select * from MyOrder where User_ID='" + Session["uid"] + "'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        string date = TextBox1.Text;   
        while (data.Read()) 
        {
            if (data["date"].ToString().IndexOf(date) != -1) {
                HyperLink hy = new HyperLink();
                hy.Target = "_blank";
                hy.Text = "订单号：" + data["Order_ID"].ToString().Trim() + "  下单时间：" + data["date"].ToString().Trim();
                hy.NavigateUrl = "./Order_Details.aspx?order_id=" + data["Order_ID"].ToString().Trim();
                Panel1.Controls.Add(hy);
                HtmlGenericControl hgc = new HtmlGenericControl("br");
                Panel1.Controls.Add(hgc);
            }
        }
        mycon.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = null;
        suoyoudingdan();
    }
}