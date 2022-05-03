using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VT_Fashion_New
{
    public class getData : System.Web.UI.Page
    {
        SqlConnection conn;
        private void laykn()
        {
            string path = Page.Server.MapPath("App_data");
            path += "\\QLBH.mdf";
            conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = " + path + "; Integrated Security = True");
            conn.Open();
        }
        private void dongkn()
        {
            if (conn.State == ConnectionState.Open) conn.Close();
        }
        public DataTable laydata(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                laykn();
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                da.Fill(dt);
            }
            catch (Exception)
            {
                dt = null;

            }
            finally
            {
                dongkn();
            }
            return dt;
        }
        public int capnhat(string sql)
        {
            int kq = 0;
            try
            {
                laykn();
                SqlCommand cmd = new SqlCommand(sql, conn);
                kq = cmd.ExecuteNonQuery();
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                dongkn();
            }
            return kq;
        }
        public int xulydl(string sql)
        {
            int kq = 0;
            try
            {
                laykn();
                SqlCommand cmd = new SqlCommand(sql, conn);
                kq = cmd.ExecuteNonQuery();//thuc thi cau len khong can truy van
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                dongkn();
            }
            return kq;
        }

        public object ExcuteScalar(string sql)
        {
            object oj = null;
            try
            {
                laykn();
                SqlCommand cmd = new SqlCommand(sql, conn);
                oj = cmd.ExecuteScalar();//thuc thi cau len khong can truy van
            }
            catch
            {
                oj = null;
            }
            finally
            {
                dongkn();
            }
            return oj;
        }

        public int doanhthu(string thang, string nam)
        {
            laykn();
            SqlCommand cmd = new SqlCommand("DT", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@thang", SqlDbType.Int).Value = thang;
            cmd.Parameters.AddWithValue("@nam", SqlDbType.Int).Value = nam;
            int kq = (int)cmd.ExecuteScalar();
            dongkn();
            return kq;
        }
    }
}