using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
public partial class kunpengfaxian : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = lianjie();
        string cmd = "select *from Book where Book_Name like '%" + TextBox1.Text + "%'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        if (data.HasRows == false) {
            Label l = new Label();
            l.Text ="未找到任何图书";
            jieguo.Controls.Add(l);
        }
        while (data.Read()) {
            HyperLink hy = new HyperLink();
            hy.NavigateUrl="./book.aspx?id="+data[0].ToString()+"";
            hy.Text = data[1].ToString();
            jieguo.Controls.Add(hy);
            HtmlGenericControl hgc = new HtmlGenericControl("br");
            jieguo.Controls.Add(hgc);
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

    protected void Image1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./zhuye.aspx");
    }
}