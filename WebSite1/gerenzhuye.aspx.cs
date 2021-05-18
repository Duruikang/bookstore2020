using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class gerenzhuye : System.Web.UI.Page
{
    User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            user = findUser();
            UserName.Text = user.User_ID;
            Money.Text = user.User_Money+"元";
            if (user.User_Money == "") Money.Text = "0元";
            Telephone.Text = user.User_Telephone;
            Address.Text = user.User_Address;;
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
    public User findUser() {
        SqlConnection mycon = lianjie();
        string cmd = "select * from MyUser where User_ID='"+Session["uid"].ToString()+"'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        SqlDataReader data = mycmd.ExecuteReader();
        data.Read();
        User user = new User();
        user.User_ID = data["User_ID"].ToString().Trim();
        user.User_Money = data["User_Money"].ToString().Trim();
        user.User_Telephone = data["User_Telephone"].ToString().Trim();
        user.User_Address = data["User_Address"].ToString().Trim();
        mycon.Close();
        return user;
    }
    protected void Image1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./zhuye.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        user = findUser();
        SqlConnection mycon = lianjie();
        string cmd = "update MyUser set User_Telephone='" + Telephone.Text + "',User_Address='" + Address.Text + "' where User_ID='" + user.User_ID + "'";
        SqlCommand mycmd = new SqlCommand(cmd,mycon);
        if (mycmd.ExecuteNonQuery() == 1)
        {
            Response.Write("<script>alert('修改成功!')</script>");
        }
        else 
        {
            Response.Write("<script>alert('修改失败!')</script>");
        }
        mycon.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Params["last_url"].ToString());
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./changepwd.aspx?last_url=./gerenzhuye.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("./shopping.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MyOrder.aspx");
    }
}