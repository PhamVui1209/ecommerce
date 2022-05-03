using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class UDangNhap : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ten = txtTenDN.Text;
            string matkhau = txtMK.Text;
            string sqlq = "select * from thanhvien where tendangnhap = '" + ten + "' and matkhau = '" + matkhau + "'";
            DataTable table = new DataTable();
            table = gd.laydata(sqlq);
            if (table.Rows.Count != 0)
            {
                Response.Cookies["tendangnhap"].Value = ten;
                Server.Transfer("TrangChu.aspx");
            }
            else lblTB.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
        }
    }
}