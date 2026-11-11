using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Database_Connectivity
{
    public partial class Add_To_Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        int uid;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            uid = Convert.ToInt32(Session["uid"]);

            if (!IsPostBack)
            {
                Label5.Text = "Welcome, " + Session["admin"].ToString();

                fillCartDataList();
            }
        }

        void fillCartDataList()
        {
            getCon();

            string query =
                "SELECT c.Cart_Id, p.Prod_Id, p.Prod_Img, p.Prod_Name, " +
                "p.Prod_Price, c.Quentity " +
                "FROM Add_Products_Tbl p " +
                "INNER JOIN Cart_Tbl c ON p.Prod_Id = c.Cart_Prod_Id " +
                "WHERE c.Cart_User_Id = '" + uid + "'";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }

        protected void GridView1_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowEditing(
            object sender,
            GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            fillCartDataList();

            decimal total = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                decimal prize = Convert.ToDecimal(row["Prod_Price"]);

                int quentity = Convert.ToInt32(row["Quentity"]);

                total += prize * quentity;
            }
            grand_total.Text = "Rs. : " + total.ToString();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prdid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];

            DropDownList ddlqty = (DropDownList)row.FindControl("DropDownList1");

            int qty = Convert.ToInt32(ddlqty.SelectedValue);

            getCon();
            cmd = new SqlCommand(
                "UPDATE Cart_Tbl SET Quentity = '"+qty+"' WHERE Cart_Prod_Id ='"+prdid+"' AND Cart_User_Id = '"+uid+"'",
                con);

            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            fillCartDataList();
        }
    }
}