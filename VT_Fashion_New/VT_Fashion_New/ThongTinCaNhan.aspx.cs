using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class ThongTinCaNhan : System.Web.UI.Page
    {
        string ten = "";
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null) return;
            ten = Request.Cookies["tendangnhap"].Value;
            lblTen.Text = ten;
            string sql = "select * from thanhvien where tendangnhap = '" + ten + "'";
            DataList1.DataSource = gd.laydata(sql);
            DataList1.DataBind();
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            int count = DataList1.Items.Count;
            for (int i = 0; i < count; i++)
            {
                Label lbl = DataList1.Items[i].FindControl("lblHoTen") as Label;
                if (lbl != null) txtHoTenn.Text = lbl.Text;
                lbl = DataList1.Items[i].FindControl("lblEmail") as Label;
                if (lbl != null) txtEmailn.Text = lbl.Text;
                lbl = DataList1.Items[i].FindControl("lblSDT") as Label;
                if (lbl != null) txtSDTn.Text = lbl.Text;
                lbl = DataList1.Items[i].FindControl("lblDiaChi") as Label;
                if (lbl != null) txtDiaChin.Text = lbl.Text;
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            int ktemail = (int)gd.ExcuteScalar("select count(*) from thanhvien where email = '" + txtEmailn.Text.Trim() + "' and tendangnhap != '" + ten + "'");
            if (ktemail == 1)
            {
                Response.Write("<script>alert('Email đã được dùng, Vui lòng nhập Email khác');</script>");
                return;
            }
            int ktsdt = (int)gd.ExcuteScalar("select count(*) from thanhvien where sdt = " + txtSDTn.Text + " and tendangnhap != '" + ten + "'");
            if (ktsdt == 1)
            {
                Response.Write("<script>alert('Số điện thoại đã được dùng, Vui lòng nhập Số điện thoại khác');</script>");
                return;
            }
            int kq = gd.capnhat("update thanhvien set hoten= N'" + txtHoTenn.Text + "'," +
                "email='" + txtEmailn.Text + "', sdt = '" + txtSDTn.Text + "'," +
                "diachi = N'" + txtDiaChin.Text + "' where tendangnhap='" + ten + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                string sql = "select * from thanhvien where tendangnhap = '" + ten + "'";
                DataList1.DataSource = gd.laydata(sql);
                DataList1.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void btnSuaMK_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnLuuMK_Click(object sender, EventArgs e)
        {
            int kq = gd.capnhat("update thanhvien set matkhau = '" + txtmkm.Text + "' where tendangnhap = '" + ten + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công (" + ten + "," + txtmkm.Text + ")');</script>");
                txtmkm.Text = "";
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công (" + ten + "," + txtmkm.Text + ") ');</script>");
            }
        }

        protected void btnHuyMK_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}