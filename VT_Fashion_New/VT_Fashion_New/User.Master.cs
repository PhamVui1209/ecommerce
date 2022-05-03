using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace VT_Fashion_New
{
    public partial class User : System.Web.UI.MasterPage
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["sluong"] == null)
            {
                Session["sluong"] = 0;
            }

            if(Session["sluong"] != null)
                this.lblGioHang.Text = Convert.ToString(Session["sluong"]);

            string sql = "select * from loaisp";
            this.DataList1.DataSource = gd.laydata(sql);
            this.DataList1.DataBind();
            xlviewdn();
            xlviewdn();
        }
        protected void xlviewdn()
        {
            if (Request.Cookies["tendangnhap"] == null)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }

        /*protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string ten = this.Login1.UserName;
            string matkhau = this.Login1.Password;
            string sqlq = "select * from thanhvien where tendangnhap = '" + ten + "' and matkhau = '" + matkhau + "'";
            DataTable table = new DataTable();
            table = gd.laydata(sqlq);
            if (table.Rows.Count != 0)
            {
                Response.Cookies["tendangnhap"].Value = ten;
                Server.Transfer("GioHang.aspx");
            }
            else this.Login1.FailureText = "Tên đăng nhập hoặc mật khẩu không đúng!";
        }*/

        protected void txtTim_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            string tk = txtTim.Text.Trim();
            Context.Items["tk"] = tk;
            Server.Transfer("SanPham.aspx");
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
         protected void btnloaisp_Click(object sender, EventArgs e)
        {
            string maloai = ((LinkButton)sender).CommandArgument;
            Context.Items["maloai"] = maloai;
            Server.Transfer("LoaiSanPham.aspx");
        }
    }
}