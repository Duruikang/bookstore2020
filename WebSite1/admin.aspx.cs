using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin : System.Web.UI.Page
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
    protected void DetailsView1_ModeChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView2_ModeChanged(object sender, EventArgs e)
    {
        GridView3.DataBind();
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/bookpic/")+FileUpload1.PostedFile.FileName;
        if (FileUpload1.HasFile) {
            FileUpload1.SaveAs(path);
        
        }
    }

    protected void DetailsView1_ItemCreated(object sender, EventArgs e)
    {
        Response.Write("DetailsView触发！！");
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Response.Write("GridView触发！！");
    }
}