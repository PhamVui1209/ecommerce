using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLThongKe : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            lblSLTC.Text = Application["SoLuotTruyCap"].ToString();
            lblOnline.Text = Application["SLOnline"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtNam.Text == "")
            {
                Response.Write("<script>alert('Bạn phải nhập năm');</script>");
                return;
            }
            string sql = "";
            string sql1 = "";
            if (txtThang.Text == "")
            {
                sql = "select sum(thanhtien) from dbo.DT where nam = " + txtNam.Text;
                sql1 = "select sum(thanhtien) from dbo.TL where nam = " + txtNam.Text;
            }
            else
            {
                sql = "select sum(thanhtien) from dbo.DT where thang = " + txtThang.Text + " and nam = " + txtNam.Text;
                sql1 = "select sum(thanhtien) from dbo.TL where thang = " + txtThang.Text + " and nam = " + txtNam.Text;
            }

            DataTable dt = gd.laydata(sql);
            lblDT.Text = dt.Rows[0][0].ToString();

            DataTable tl = gd.laydata(sql1);
            lblTL.Text = tl.Rows[0][0].ToString();
        }

        protected void btnTKSP_Click(object sender, EventArgs e)
        {
            if (txtNam1.Text == "")
            {
                Response.Write("<script>alert('Bạn phải nhập năm');</script>");
                return;
            }
            string sql = "";
            string top = "";
            if (txtTop.Text != "") top = "top " + txtTop.Text;
            if (txtThang1.Text == "")
            {
                sql = "select " + top + " b.masp, tensp , hinh, sum(a.soluong) as soluong " +
               "from ctdonhang a, sanpham b, donhang c " +
               "where a.masp = b.masp and c.madh = a.madh and year(c.ngaydh) = " + txtNam1.Text + " and c.matt = 4 " +
               "group by b.masp, tensp, hinh " +
               "order by 3 desc ";
            }
            else
            {
                sql = "select " + top + " b.masp, tensp , hinh, sum(a.soluong) as soluong " +
               "from ctdonhang a, sanpham b, donhang c " +
               "where a.masp = b.masp and c.madh = a.madh and month(c.ngaydh) = " + txtThang1.Text + " and year(c.ngaydh) = " + txtNam1.Text + " and c.matt = 4 " +
               "group by b.masp, tensp, hinh " +
               "order by 3 desc ";
            }
            //GridView1.DataSource = kn.laydata(sql);
            //GridView1.DataBind();

            DataList1.DataSource = gd.laydata(sql);
            DataList1.DataBind();
        }
    }
}