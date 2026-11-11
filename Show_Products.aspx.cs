using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Database_Connectivity
{
    public partial class Show_Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        int uid;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;


        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void ShowProducts()
        {
            getCon();

            string companyId = Request.QueryString["cid"];

            if (string.IsNullOrEmpty(companyId))
            {
                da = new SqlDataAdapter(
                    "SELECT * FROM Add_Products_Tbl",
                    con
                );
            }
            else
            {
                da = new SqlDataAdapter(
                    "SELECT * FROM Add_Products_Tbl WHERE Prod_Comp_Id = " + companyId,
                    con
                );
            }

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds;
                DataList1.DataBind();

                lblEmpty.Visible = false;
            }
            else
            {
                lblEmpty.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowProducts();
            }
        }

        protected void DataList1_ItemCommand(
            object source,
            DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int pid = Convert.ToInt32(e.CommandArgument);

                ViewState["pid"] = pid;
                Response.Redirect("ViewDetails.aspx?pid=" + ViewState["pid"]);
                
            }

            if (e.CommandName == "cmd_cart")
            {
                int prdid = Convert.ToInt32(e.CommandArgument);
                ViewState["prdid"] = prdid;

               
                uid = Convert.ToInt32(Session["uid"]);

                getCon();

                int quentity = 1;

                cmd = new SqlCommand(
                    "INSERT INTO cart_tbl(Cart_User_Id, Cart_Prod_Id, Quentity, AddedDate) " +
                    "VALUES('" + uid + "','" + prdid + "','" + quentity + "',GETDATE())",
                    con
                );

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Shoe added to cart successfully')</script>");
            }
        }
    }
}