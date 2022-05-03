using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLSanPham : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
                GridView1.DataBind();
                DropDownList1.DataSource = gd.laydata("select * from loaisp");
                DropDownList1.DataValueField = "maloai";
                DropDownList1.DataTextField = "tenloai";
                DropDownList1.DataBind();
            }

            
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết        
            GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string masp = e.Values["masp"].ToString();
            int kq = gd.capnhat("delete from sanpham where masp = '" + masp + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao         
            {
                Response.Write("<script>alert('Xóa thành công');</script>");
                GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
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

            this.GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
            this.GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string masp = e.NewValues["masp"].ToString();
            string tensp = e.NewValues["tensp"].ToString();
            /*string maloai = e.NewValues["maloai"].ToString();*/
            DropDownList drop = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList3");
            string maloai = drop.SelectedItem.Value;

            string size = e.NewValues["size"].ToString();
            string mau = e.NewValues["mau"].ToString();
            string soluong = e.NewValues["soluong"].ToString();
            string gianhap = e.NewValues["gianhap"].ToString();
            string giaban = e.NewValues["giaban"].ToString();
            string giagiam = e.NewValues["giagiam"].ToString();
            string mota = e.NewValues["mota"].ToString();

            /*string hinh = e.NewValues["hinh"].ToString();*/

            FileUpload file = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload2");

            string fileName = "",
                filePath = "";
            int kq;
            if (file.HasFile)
            {
                fileName = file.FileName;
                filePath = MapPath("images/" + fileName);
                file.SaveAs(filePath);
                /*imageCreate.ImageUrl = fileName;*/
                kq = gd.capnhat("update sanpham set tensp= N'" + tensp + "', maloai='" + maloai + "'," +
                "size = '" + size + "', mau = N'" + mau + "', soluong = '" + soluong + "', gianhap = '" + gianhap + "'," +
                "giagiam = '" + giagiam + "', mota = N'" + mota + "', " +
                "giaban = '" + giaban + "', hinh = '" + fileName + "' where masp='" + masp + "'");
            } else
            {
                kq = gd.capnhat("update sanpham set tensp= N'" + tensp + "', maloai='" + maloai + "'," +
                "size = '" + size + "', mau = N'" + mau + "', soluong = '" + soluong + "', gianhap = '" + gianhap + "'," +
                "giagiam = '" + giagiam + "', mota = N'" + mota + "', " +
                "giaban = '" + giaban + "' where masp='" + masp + "'");
            }

            //string trangthai = e.NewValues["trangthai"].ToString();
            
            if (kq > 0)//neu cap nhat duoc thi hien thong bao       
            {
                Response.Write("<script>alert('Cập nhật thành công');</script>");
                GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật Thất Bại');</script>");
            }
        }

        public void clearForm()
        {
            txtMSP.Text = "";
            txtTSP.Text = "";
            DropDownList1.SelectedIndex = 0;
            txtS.Text = "";
            txtM.Text = "";
            txtSL.Text = "";
            txtGN.Text = "";
            txtGB.Text = "";
            txtMT.Text = "";
            txtGG.Text = "";
        }

        protected void btnTM_Click(object sender, EventArgs e)
        {
            string masp = txtMSP.Text,
                tensp = txtTSP.Text,
                /*maloai = txtML.Text,*/
                maloai = DropDownList1.SelectedItem.Value,
                size = txtS.Text,
                mau = txtM.Text,
                soluong = txtSL.Text,
                gianhap = txtGN.Text,
                giaban = txtGB.Text,
                giagiam = txtGG.Text,
                mota = txtMT.Text;

            string fileName="",
                filePath="";

            if (FileUpload1.HasFile)
            {
                fileName =  FileUpload1.FileName;
                filePath = MapPath("images/"+fileName);
                FileUpload1.SaveAs(filePath);
                /*imageCreate.ImageUrl = fileName;*/
            }

            int kq = gd.xulydl("insert into sanpham values ('" + masp + "', N'" + tensp + "', '" + maloai + "', '" + size + "', N'" + mau + "', '" + soluong + "', '" + gianhap + "', '" + giaban + "', '" + fileName + "', '" + 1 + "', N'" + mota + "', '" + giagiam + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao        
            {
                Response.Write("<script>alert('Thêm thành công');</script>");
                GridView1.DataSource = gd.laydata("select masp, tensp, tenloai, size, mau, soluong, gianhap, giaban, giagiam, a.mota, hinh " +
                    "from sanpham a, loaisp b " +
                    "where a.maloai = b.maloai");
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

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // this part is select the data from database
                    //DataRowView rowView = (DataRowView)e.Row.DataItem;
                    //int s =Convert.ToInt32( rowView["id"].ToString());
                    //DropDownList drop = (DropDownList)e.Row.FindControl("DropDownList1");
                    //string sql = "select * from test1";                 
                    //drop.DataSource = SqlHelper.ExecuteDataTable(sql);
                    //drop.DataValueField = "Id";
                    //drop.DataTextField = "Project";                                   
                    //drop.DataBind();


                    //This part is directly gerneate the ddl's item
                    DropDownList drop = (DropDownList)e.Row.FindControl("DropDownList3");
                    drop.DataSource = gd.laydata("select * from loaisp");
                    drop.DataValueField = "maloai";
                    drop.DataTextField = "tenloai";
                    drop.DataBind();
                }

            }
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*string maloai = DropDownList1.SelectedItem.Value;
            Response.Write("<script>alert('" + maloai + "');</script>");*/
        }
    }
}