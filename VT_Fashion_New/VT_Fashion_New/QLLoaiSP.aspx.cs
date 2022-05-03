using System;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLLoaiSP : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                //Gán chuỗi kết nối cho dataSoure của Control(GridView1)       
                GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
                GridView1.DataBind();//load dữ liêu lên đối tượng            
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết      
            GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maloai = e.Values["maloai"].ToString();
            int kq = gd.capnhat("delete from loaisp where maloai= '" + maloai + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao    
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Xóa Thất Bại!');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string maloai = e.NewValues["maloai"].ToString();
            string tenloai = e.NewValues["tenloai"].ToString();
            string mota = e.NewValues["mota"].ToString();
            int kq = gd.capnhat("update loaisp set maloai= '" + maloai + "', tenloai= N'" + tenloai + "', mota= N'" + mota + "' where maloai='" + maloai + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao       
            {
                Response.Write("<script>alert('Cập nhật thành công');</script>");
                GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật Thất Bại!');</script>");
            }
        }

        public void clearForm()
        {
            txtML.Text = "";
            txtMT.Text = "";
            txtTL.Text = "";
        }

        protected void btnTM_Click(object sender, EventArgs e)
        {

            String maloai = txtML.Text,
                tenloai = txtTL.Text,
                mota = txtMT.Text;
            int kq = gd.xulydl("insert into loaisp values ('" + maloai + "', N'" + tenloai + "', N'" + mota + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao       
            {
                Response.Write("<script>alert('Thêm Thành Công');</script>");
                GridView1.DataSource = gd.laydata("SELECT * FROM loaisp");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Thêm Thất Bại');</script>");
            }
            clearForm();
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            clearForm();
        }
    }
}