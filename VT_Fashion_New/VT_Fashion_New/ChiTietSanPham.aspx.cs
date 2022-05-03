using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VT_Fashion_New
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        getData gd = new getData();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string q;


            if (Context.Items["masp"] == null)
                q = "select * from sanpham";
            else
            {
                string masp = Context.Items["masp"].ToString();

                //string giagiam1 = "select giagiam from sanpham where masp = '" + masp + "'";
                //string giaban1 = "select giaban from sanpham where masp = '" + masp + "'";
                //foreach (DataListItem item in DataList1.Items)
                //{
                //    int giagiam = Convert.ToInt32(((Label)item.FindControl("Label6")).Text);
                //    if (giagiam == 0)
                //        ((Label)item.FindControl("Label6")).Text = ((Label)item.FindControl("Label6")).Text;
                //}
                //foreach (DataRow dataRow in dt.Rows)
                //{
                //    if (dataRow["masp"].Equals(masp))
                //    {
                //        int giagiam = Convert.ToInt32(dataRow["giagiam"]);
                //        if (giagiam == 0)
                //        {
                //            return;
                //        }
                //    }
                //}


                //int ggg1 = int.Parse(giagiam1);
                //int gg1 = int.Parse(giaban1) - int.Parse(giagiam1);
                //int giagiam = (int)gd.ExcuteScalar("select giagiam from sanpham where masp = '" + masp + "'");
                //int giaban = (int)gd.ExcuteScalar("select giaban from sanpham where masp = '" + masp + "'");
                //int gg = giaban - giagiam;  DataList1.la



                q = "select * from sanpham where masp = '" + masp + "'";
                this.DataList1.DataSource = gd.laydata(q);
                this.DataList1.DataBind();
            }


            xldtl2();
        }
        protected void btnCtsp_Click(object sender, EventArgs e)
        {
            string masp = ((LinkButton)sender).CommandArgument;
            Context.Items["masp"] = masp;
            Server.Transfer("~/ChiTietSanPham.aspx");
        }
        protected void xldtl2()
        {
            string masp = Context.Items["masp"].ToString();
            string sql;
            sql = "select top 2 * from sanpham where masp not in (select masp from sanpham where masp = '" + masp + "')";
            DataList2.DataSource = gd.laydata(sql);
            DataList2.DataBind();
        }



        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void TaoGio()
        {
            dt = new DataTable();
            dt.Columns.Add("masp");
            dt.Columns.Add("tensp");
            dt.Columns.Add("soluong");
            dt.Columns.Add("dongia");
            dt.Columns.Add("giagiam");
            dt.Columns.Add("ThanhTien");
            dt.Columns.Add("hinhanh");
            Session["giohang"] = dt;
        }

        protected void btnThemVaoGio_Click(object sender, EventArgs e)
        {
            Button mua = (Button)sender;
            string masp = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
            int soluong;
            try
            {
                soluong = int.Parse(((TextBox)item.FindControl("txtSL")).Text);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Vui lòng nhập đúng số lượng');</script>");
                return;
            }
            int slkho = (int)gd.ExcuteScalar("select soluong from sanpham where masp = '" + masp + "'");
            if (soluong > slkho)
            {
                Response.Write("<script>alert('Sản phẩm  chỉ còn (" + slkho + ")');</script>");
                return;
            }
            string dongia = ((Label)item.FindControl("Label4")).Text;
            string giagiam = ((Label)item.FindControl("Label6")).Text;
            string tensp = ((Label)item.FindControl("Label1")).Text;
            dt = (DataTable)Session["giohang"];
            bool tim = false;
            if (dt == null) TaoGio();
            foreach (DataRow dataRow in dt.Rows)
            {
                if (dataRow["masp"].Equals(masp))
                {
                    int slgio = Convert.ToInt32(dataRow["soluong"]);
                    int slthem = Convert.ToInt32(soluong);
                    if (slgio + slthem > slkho)
                    {
                        Response.Write("<script>alert('Bạn chỉ được mua thêm (" + (slkho - slgio) + ")');</script>");
                        return;
                    }
                    dataRow["soluong"] = Convert.ToInt32(dataRow["soluong"])
                        + Convert.ToInt32(soluong);
                    tim = true; break;
                }
            }
            if (!tim)
            {
                DataRow dataRow = dt.NewRow();
                dataRow["masp"] = masp;
                dataRow["tensp"] = tensp;
                dataRow["soluong"] = soluong;
                dataRow["dongia"] = giagiam;
                //dataRow["thanhtien"] = soluong * soluong;
                dt.Rows.Add(dataRow);
            }
            if (Session["sluong"] != null)
            {
                int sl = (int)Session["sluong"];
                Session["sluong"] = ++sl;
            }
            Response.Write("<script type=\"text/javascript\">alert('Thêm vào giỏ hàng thành công, Tiếp tục mua hàng nào :D');location.href='SanPham.aspx'</script>");
            Session["giohang"] = dt;
        }

        protected void btnmua_Click(object sender, EventArgs e)
        {
            Button mua = (Button)sender;
            string masp = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
            int soluong;
            try
            {
                soluong = int.Parse(((TextBox)item.FindControl("txtSL")).Text);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Vui lòng nhập đúng số lượng');</script>");
                return;
            }
            int slkho = (int)gd.ExcuteScalar("select soluong from sanpham where masp = '" + masp + "'");
            if (soluong > slkho)
            {
                Response.Write("<script>alert('Sản phẩm  chỉ còn (" + slkho + ")');</script>");
                return;
            }
            string dongia = ((Label)item.FindControl("Label6")).Text;
            string tensp = ((Label)item.FindControl("Label1")).Text;
            dt = (DataTable)Session["giohang"];
            bool tim = false;
            if (dt == null) TaoGio();
            foreach (DataRow dataRow in dt.Rows)
            {
                if (dataRow["masp"].Equals(masp))
                {
                    int slgio = Convert.ToInt32(dataRow["soluong"]);
                    int slthem = Convert.ToInt32(soluong);
                    if (slgio + slthem > slkho)
                    {
                        Response.Write("<script>alert('Bạn chỉ được mua thêm (" + (slkho - slgio) + ")');</script>");
                        return;
                    }
                    dataRow["soluong"] = Convert.ToInt32(dataRow["soluong"])
                        + Convert.ToInt32(soluong);
                    tim = true; break;
                }
            }
            if (!tim)
            {
                DataRow dataRow = dt.NewRow();
                dataRow["masp"] = masp;
                dataRow["tensp"] = tensp;
                dataRow["soluong"] = soluong;
                dataRow["dongia"] = dongia;
                //dataRow["thanhtien"] = soluong * soluong;
                dt.Rows.Add(dataRow);

            }
            Session["giohang"] = dt;
            Server.Transfer("GioHang.aspx");
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            LinkButton mua = (LinkButton)sender;
            string masp = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;

            string dongia = ((Label)item.FindControl("Label2")).Text;
            string tensp = ((Label)item.FindControl("Label1")).Text;
            dt = (DataTable)Session["giohang"];
            bool tim = false;
            if (dt == null) TaoGio();
            foreach (DataRow dataRow in dt.Rows)
            {
                if (dataRow["masp"].Equals(masp))
                {
                    dataRow["soluong"] = Convert.ToInt32(dataRow["soluong"])
                        + 1;
                    tim = true; break;
                }
            }

            if (!tim)
            {
                DataRow dataRow = dt.NewRow();
                dataRow["masp"] = masp;
                dataRow["tensp"] = tensp;
                dataRow["soluong"] = 1;
                dataRow["dongia"] = dongia;
                dt.Rows.Add(dataRow);

            }
            Session["giohang"] = dt;
            if (Session["sluong"] != null)
            {
                DataTable dt = (DataTable)Session["giohang"];
                int sl = dt.Rows.Count;
                Session["sluong"] = sl;
            }
            Response.Write("<script language='JavaScript'> alert('Sản phẩm đã được thêm vào giỏ hàng !!'); </script>");
        }
        protected string BalanceCalc()
        {
            return Convert.ToInt32((Convert.ToDecimal(Eval("giaban")) - Convert.ToDecimal(Eval("giagiam")))).ToString();

        }
    }
}