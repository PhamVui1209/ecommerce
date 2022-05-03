using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace VT_Fashion_New
{
    public partial class GioHang : System.Web.UI.Page
    {
        getData gd = new getData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            this.docDL();
        }
        private void docDL()
        {
            DataTable dt = (DataTable)Session["giohang"];
            if (dt != null)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                double tong = 0, thanhtienn;



                /*int sl = GridView1.Rows.Count;
                Session["sluong"] = sl;*/
                //this.lblGioHang.Text = Convert.ToString(sl);

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    GridViewRow row = GridView1.Rows[i];
                    string dongia = ((Label)row.FindControl("Label3")).Text;
                    double soluong = int.Parse(((TextBox)row.FindControl("txtSL")).Text);
                    thanhtienn = soluong * Convert.ToDouble(dongia);
                    ((Label)row.FindControl("lblTT")).Text = Convert.ToString(thanhtienn);

                }
                
                //Cach 1. Tinh tong thanh tien tu dataTable
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    double thanhtien = Convert.ToDouble(dt.Rows[i]["soluong"])
                        * Convert.ToDouble(dt.Rows[i]["dongia"]);
                    tong = tong + thanhtien;
                }
                this.lblTongTT.Text = tong + "<big>đ </big> ";
            }
            else this.lblTongTT.Text = "Giỏ hàng trống";

        }



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataTable dt = (DataTable)Session["giohang"];
            //Kích Button Sửa
            if (e.CommandName == "btnsua")
            {
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).Parent.Parent;
                string masp = ((Button)e.CommandSource).CommandArgument;
                //string mahang = ((HiddenField)row.FindControl("HiddenField1")).Value;
                int soluong;
                try
                {
                    soluong = int.Parse(((TextBox)row.FindControl("txtSL")).Text);
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Vui lòng nhập đúng số lượng');</script>");
                    return;
                }
                string ma = ((Label)row.FindControl("Label6")).Text;

                int slkho = (int)gd.ExcuteScalar("select soluong from sanpham where masp = '" + ma + "'");
                if (soluong > slkho)
                {
                    Response.Write("<script>alert('Sản phẩm  chỉ còn (" + slkho + ")');</script>");
                    return;
                }
                dt.Rows[row.DataItemIndex]["soluong"] = soluong.ToString();
                Session["giohang"] = dt;
            }
            else
            { //Kich Button Xoa
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).Parent.Parent;
                string masp = ((LinkButton)e.CommandSource).CommandArgument;
                //string mahang = ((HiddenField)row.FindControl("HiddenField1")).Value;

                dt.Rows[row.DataItemIndex].Delete();
                Session["giohang"] = dt;
            }
            this.docDL();
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            //if (Request.Cookies["tendangnhap"] == null) Server.Transfer("Login.aspx");
            if (Request.Cookies["tendangnhap"] == null)
            {
                Response.Write("<script>alert('Bạn cần đăng nhập để mua hàng');</script>");
                //ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>executeBefore();</script>", false);
                Server.Transfer("UDangNhap.aspx");
            }
            else
            {
                DataTable dt = (DataTable)Session["giohang"];
                if (dt == null)
                {
                    Response.Write("<script>alert('Giỏ hàng trống');</script>");
                    return;
                }
                Server.Transfer("DonHang.aspx");
            }
        }

    }
}