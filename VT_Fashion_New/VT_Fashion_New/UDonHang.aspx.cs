using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class UDonHang : System.Web.UI.Page
    {
        getData gd = new getData();
        string tendn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.Cookies["tendangnhap"] == null) return;
                tendn = Request.Cookies["tendangnhap"].Value;

                this.GridView1.DataSource = gd.laydata("select madh, ngaydh,a.matt, tentt " +
                    "from donhang a, trangthai b where a.matt = b.matt and tendangnhap = '"+ tendn + "' " +
                    "and a.matt != 4 order by 2 desc");
                this.GridView1.DataBind();
            }
        }

        public void clearCTDH()
        {
            Label1.Text = "";
            string sql = "";
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }

        protected void btnSwap1_Click(object sender, EventArgs e)
        {
            tendn = Request.Cookies["tendangnhap"].Value;
            this.GridView2.DataSource = gd.laydata("select madh, ngaydh,a.matt, tentt " +
                    "from donhang a, trangthai b where a.matt = b.matt and tendangnhap = '" + tendn + "' " +
                    "and a.matt = 4 order by 2 desc");
            this.GridView2.DataBind();
            MultiView1.ActiveViewIndex = 1;
            clearCTDH();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string madh = GridView1.SelectedDataKey.Value.ToString();
            /*GridViewRow SelectedRow = GridView1.SelectedRow;
            Label lblName = (Label)SelectedRow.FindControl("Label2");
            string tendn = lblName.Text;

            Response.Write("<script>alert('abc: " + tendn + "');</script>");*/

            Label1.Text = "ĐON HÀNG: " + madh;
            string sql = "select tensp, a.soluong " +
                "from ctdonhang a, sanpham b " +
                "where a.masp = b.masp and madh = " + madh;
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }

        protected void btnSwap2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            clearCTDH();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnPhanHoi")
            {
                string madh = e.CommandArgument.ToString();
                Context.Items["madonhang"] = madh;
                Server.Transfer("~/UPhanHoi.aspx");
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string madh = GridView2.SelectedDataKey.Value.ToString();
            Label1.Text = "ĐON HÀNG: " + madh;
            string sql = "select tensp, a.soluong " +
                "from ctdonhang a, sanpham b " +
                "where a.masp = b.masp and madh = " + madh;
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }
    }
}