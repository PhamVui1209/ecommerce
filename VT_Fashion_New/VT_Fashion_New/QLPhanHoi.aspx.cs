using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLPhanHoi : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GridView1.DataSource = gd.laydata("select mapm, a.madh, c.tendangnhap , noidung, ngaypm " +
                "from phanhoi a, donhang b, thanhvien c " +
                "where a.madh = b.madh and b.tendangnhap = c.tendangnhap order by 5 desc");
            GridView1.DataBind();
        }

        protected void btnTK_Click(object sender, EventArgs e)
        {
            string tt = txtTT.Text.Trim();
            string sql = "";
            if (tt != "")
            {
                sql = "select mapm, a.madh, c.tendangnhap , noidung, ngaypm " +
                "from phanhoi a, donhang b, thanhvien c " +
                "where a.madh = b.madh and b.tendangnhap = c.tendangnhap " +
                "and ( mapm = '"+tt+"' or a.madh = '"+tt+"' or c.tendangnhap = '"+tt+"' ) "+
                "order by 5 desc";
            }
            else
            {
                sql = "select mapm, a.madh, c.tendangnhap , noidung, ngaypm " +
                "from phanhoi a, donhang b, thanhvien c " +
                "where a.madh = b.madh and b.tendangnhap = c.tendangnhap order by 5 desc";
            }

            GridView1.DataSource = gd.laydata(sql);
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mapm = e.Values["mapm"].ToString();
            int kq = gd.capnhat("delete from phanhoi where mapm = '" + mapm + "'");
            if (kq > 0)
            {
                Response.Write("<script>alert('Xóa thành công');</script>");
                GridView1.DataSource = gd.laydata("select mapm, a.madh, c.tendangnhap , noidung, ngaypm " +
                "from phanhoi a, donhang b, thanhvien c " +
                "where a.madh = b.madh and b.tendangnhap = c.tendangnhap order by 5 desc");
                GridView1.DataBind();
            }
        }
    }
}