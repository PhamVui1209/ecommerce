using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VT_Fashion_New
{
    public partial class QLDonHang : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                this.GridView1.DataSource = gd.laydata("select * from dbo.DH " +
                    "where matt != 0 and matt != 4 order by 7 desc");
                this.GridView1.DataBind();

            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.GridView1.DataSource = gd.laydata("select * from dbo.DH where matt != 0 and matt != 4 order by 7 desc ");
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
                    DropDownList drop = (DropDownList)e.Row.FindControl("DropDownList1");
                    drop.DataSource = gd.laydata("select * from trangthai where matt != 1");
                    drop.DataValueField = "matt";
                    drop.DataTextField = "tentt";
                    drop.DataBind();
                }

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.GridView1.DataSource = gd.laydata("select * from dbo.DH where matt != 0 and matt != 4 order by 7 desc");
            this.GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            DropDownList drop = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
            string s = drop.SelectedItem.Value;
            if (int.Parse(s) == 0)
            {
                gd.capnhat("update sanpham " +
                    " set soluong = soluong + (select ctdonhang.soluong from ctdonhang where ctdonhang.madh = " + id + " and sanpham.masp = ctdonhang.masp)" +
                    " where masp in (select masp from ctdonhang where madh = " + id + ")");
            }
            int kq = gd.capnhat("update donhang set matt = " + s + " where madh = '" + id + "'");

            if (kq > 0)
            {
                Response.Write("<script>alert('Cập nhập thành công');</script>");
                GridView1.DataSource = gd.laydata("select * from dbo.DH  where matt != 0 and matt != 4 order by 7 desc ");
                GridView1.EditIndex = -1;
                GridView1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Cập nhập thất bại');</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string madh = GridView1.SelectedDataKey.Value.ToString();
            /*GridViewRow SelectedRow = GridView1.SelectedRow;
            Label lblName = (Label)SelectedRow.FindControl("Label2");
            string tendn = lblName.Text;

            Response.Write("<script>alert('abc: " + tendn + "');</script>");*/

            Label1.Text = "ĐON HÀNG: " + madh;
            string sql = "select tensp, a.soluong " +
                "from ctdonhang a, sanpham b " +
                "where a.masp = b.masp and madh = " + madh;
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string madh = GridView2.SelectedDataKey.Value.ToString();
            Label1.Text = "ĐON HÀNG: " + madh;
            string sql = "select tensp, a.soluong " +
                "from ctdonhang a, sanpham b " +
                "where a.masp = b.masp and madh = " + madh;
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }

        public void clearCTDH()
        {
            Label1.Text = "";
            string sql = "";
            GridView3.DataSource = gd.laydata(sql);
            GridView3.DataBind();
        }

        protected void btnSwap1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            GridView2.DataSource = gd.laydata("select * from dbo.DH where matt = 0 or matt = 4 order by 7 desc");
            GridView2.DataBind();
            clearCTDH();
        }

        protected void btnSwap2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            clearCTDH();
        }
    }
}