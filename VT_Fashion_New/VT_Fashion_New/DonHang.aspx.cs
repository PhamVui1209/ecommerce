using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace VT_Fashion_New
{
    public partial class DonHang : System.Web.UI.Page
    {
        string ten = "";
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Request.Cookies["tendangnhap"] == null)
            {
                Response.Write("<script>alert('ERR');</script>");
                return;
            }
            ten = Request.Cookies["tendangnhap"].Value;
            string sql = "select * from thanhvien where tendangnhap = '" + ten + "'";
            DataList1.DataSource = gd.laydata(sql);
            DataList1.DataBind();
            this.docDL();
        }
        private void docDL()
        {
            DataTable dt = (DataTable)Session["giohang"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
            double tong = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                double thanhtien = Convert.ToDouble(dt.Rows[i]["soluong"])
                    * Convert.ToDouble(dt.Rows[i]["dongia"]);
                tong = tong + thanhtien;
            }
            this.lblTongTT.Text = "Tổng thành tiền: " + tong + " đồng";
        }
        protected void btndathang_Click(object sender, EventArgs e)
        {
            string ten = Request.Cookies["tendangnhap"].Value;
            int kt = (int)gd.xulydl("insert into donhang(tendangnhap) values('" + ten + "')");
            if (kt <= 0)
            {
                Response.Write("<script>alert('ERR');</script>");
                return;
            }
            int madh = (int)gd.ExcuteScalar("select top 1 madh from donhang where tendangnhap = '" + ten + "' order by 1 desc");

            DataTable dt = (DataTable)Session["giohang"];
            foreach (DataRow row in dt.Rows)
            {
                string masp = row["masp"].ToString();
                string soluong = row["soluong"].ToString();
                string dongia = row["dongia"].ToString();

                int kq = gd.xulydl("insert into ctdonhang values ('" + madh + "', '" + masp + "', '" + soluong + "', '"+ dongia + "')");
                if (kq < 1)
                {
                    Response.Write("<script>alert('Mua thất bại');</script>");
                    return;
                }
                gd.capnhat("update sanpham set soluong = soluong - " + soluong + " where masp = '" + masp + "'");
            }
            Response.Write("<script>alert('Mua thàng công');</script>");
            Session.Remove("giohang");
            Server.Transfer("TrangChu.aspx");
        }
    }
}