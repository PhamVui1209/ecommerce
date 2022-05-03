using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VT_Fashion_New
{
    public partial class TrangChu : System.Web.UI.Page
    {
        getData gd = new getData();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string sql, sql1, sql2;
            sql2 = "select top 6 b.masp, tensp , hinh, sum(a.soluong) as soluong, b.giaban " +
              "from ctdonhang a, sanpham b, donhang c " +
              "where a.masp = b.masp and c.madh = a.madh and c.matt = 4 " +
              "group by b.masp, tensp, hinh, giaban " +
              "order by 3 desc ";
            sql = "select top 6 * from sanpham";
            DataList1.DataSource = gd.laydata(sql2);
            DataList1.DataBind();

            sql1 = "select top 3 mapm, a.madh, c.tendangnhap , noidung, ngaypm " +
                "from phanhoi a, donhang b, thanhvien c " +
                "where a.madh = b.madh and b.tendangnhap = c.tendangnhap " +
                "order by 5 desc";
            DataList2.DataSource = gd.laydata(sql1);
            DataList2.DataBind();
        }
        protected void btnCtsp_Click(object sender, EventArgs e)
        {
            string masp = ((LinkButton)sender).CommandArgument;
            Context.Items["masp"] = masp;
            Server.Transfer("~/ChiTietSanPham.aspx");
        }

        private void TaoGio()
        {
            dt = new DataTable();
            dt.Columns.Add("masp");
            dt.Columns.Add("tensp");
            dt.Columns.Add("soluong");
            dt.Columns.Add("dongia");
            dt.Columns.Add("ThanhTien");
            dt.Columns.Add("hinhanh");
            Session["giohang"] = dt;
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            LinkButton mua = (LinkButton)sender;
            string masp = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
            /*int soluong = 1;*/

            string dongia = ((Label)item.FindControl("Label2")).Text;
            string tensp = ((Label)item.FindControl("Label1")).Text;
            dt = (DataTable)Session["giohang"];
            bool tim = false;
            if (dt == null) TaoGio();
            foreach (DataRow dataRow in dt.Rows)
            {
                if (dataRow["masp"].Equals(masp))
                {
                    dataRow["soluong"] = Convert.ToInt32(dataRow["soluong"])
                        + 1;
                    tim = true; break;
                }
            }

            if (!tim)
            {
                DataRow dataRow = dt.NewRow();
                dataRow["masp"] = masp;
                dataRow["tensp"] = tensp;
                dataRow["soluong"] = 1;
                dataRow["dongia"] = dongia;
                dt.Rows.Add(dataRow);

            }
            Session["giohang"] = dt;
            if (Session["sluong"] != null)
            {
                DataTable dt = (DataTable)Session["giohang"];
                int sl = dt.Rows.Count;
                Session["sluong"] = sl;
            }
            Response.Write("<script type=\"text/javascript\">alert('Thêm vào giỏ hàng thành công');location.href='SanPham.aspx'</script>");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("SPGiamGia.aspx");
        }

    }
}