using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class UPhanHoi : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string madh = Context.Items["madonhang"].ToString();
            Label1.Text = "Đơn hàng: " + madh;
            temp.Text = madh;
        }

        protected void btnPhanHoi_Click(object sender, EventArgs e)
        {
            string nd = txtPH.Text.Trim();
            string madh = temp.Text.Trim();
            string sql = "insert into phanhoi(madh, noidung) values ('" + madh + "', N'" + nd + "')";
            int kq = gd.xulydl(sql);
            if(kq > 0)
            {
                Response.Write("<script>alert('Đã gửi phản hồi');</script>");
                Server.Transfer("UDonHang.aspx");
            } else
            {
                Response.Write("<script>alert('Gửi thất bại');</script>");
                Server.Transfer("UDonHang.aspx");
            }
        }
    }
}