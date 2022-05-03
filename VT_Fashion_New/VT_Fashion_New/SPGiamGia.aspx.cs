﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace VT_Fashion_New
{
    public partial class SPGiamGia : System.Web.UI.Page
    {
        getData gd = new getData();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string sql;
            sql = "select * from sanpham where giagiam > "+0;
            DataList1.DataSource = gd.laydata(sql);
            DataList1.DataBind();
        }
        protected void btnCtsp_Click(object sender, EventArgs e)
        {
            string masp = ((LinkButton)sender).CommandArgument;
            Context.Items["masp"] = masp;
            Server.Transfer("~/ChiTietSanPham.aspx");
        }

        private void TaoGio()
        {
            dt = new DataTable();
            dt.Columns.Add("masp");
            dt.Columns.Add("tensp");
            dt.Columns.Add("soluong");
            dt.Columns.Add("dongia");
            dt.Columns.Add("ThanhTien");
            dt.Columns.Add("hinhanh");
            Session["giohang"] = dt;
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            LinkButton mua = (LinkButton)sender;
            string masp = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;

            string dongia = ((Label)item.FindControl("Label3")).Text;
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
            Response.Write("<script type=\"text/javascript\">alert('Thêm vào giỏ hàng thành công');location.href='SPGiamGia.aspx'</script>");
        }
        protected string BalanceCalc()
        {
            return Convert.ToInt32((Convert.ToDecimal(Eval("giaban")) - Convert.ToDecimal(Eval("giagiam")))).ToString();

        }
    }
}