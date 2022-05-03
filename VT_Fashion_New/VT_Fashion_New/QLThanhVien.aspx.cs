using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLThanhVien : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Gán chuỗi kết nối cho dataSoure của Control(GridView2)       
                GridView1.DataSource = gd.laydata("SELECT * FROM thanhvien");
                GridView1.DataBind();//load dữ liêu lên đối tượng      
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string tendangnhap = e.Values["tendangnhap"].ToString();
            int kq = gd.capnhat("delete from thanhvien where tendangnhap = '" + tendangnhap + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao         
            {
                Response.Write("<script>alert('Xóa thành công');</script>");
                GridView1.DataSource = gd.laydata("SELECT * FROM thanhvien");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Xóa Thất Bại!');</script>");
            }
        }
    }
}