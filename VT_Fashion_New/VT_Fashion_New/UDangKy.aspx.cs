using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class UDangKy : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ten = txtTenDN.Text;
            string mk = txtMK.Text;
            string hoten = txtHT.Text;
            string email = txtEmail.Text;
            string sdt = txtSDT.Text;
            string diachi = txtDC.Text;

            int ktemail = (int)gd.ExcuteScalar("select count(*) from thanhvien where email = '" + email.Trim() + "'");
            if (ktemail == 1)
            {
                Response.Write("<script>alert('Email đã được dùng, Vui lòng nhập Email khác');</script>");
                return;
            }
            int ktsdt = (int)gd.ExcuteScalar("select count(*) from thanhvien where sdt = " + sdt + "");
            if (ktsdt == 1)
            {
                Response.Write("<script>alert('Số điện thoại đã được dùng, Vui lòng nhập Số điện thoại khác');</script>");
                return;
            }
            int kttk = (int)gd.ExcuteScalar("select count(*) from thanhvien where tendangnhap = '" + ten + "'");
            if (kttk == 1)
            {
                Response.Write("<script>alert('Tài khoản đã tồn tại, Vui lòng nhập tài khoản khác');</script>");
                return;
            }

            int kq = gd.xulydl("insert into thanhvien(tendangnhap,matkhau,hoten,email,sdt,diachi) " +
                    "values ('" + ten + "', '" + mk + "', N'" + hoten + "', '" + email + "', '" + sdt + "', N'" + diachi + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Đăng ký thành công');</script>");
                Response.Cookies["tendangnhap"].Value = ten;
                Server.Transfer("TrangChu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Đăng ký không thành công');</script>");
            }
        }
    }
}