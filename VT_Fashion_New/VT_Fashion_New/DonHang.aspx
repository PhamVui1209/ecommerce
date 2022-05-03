<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="VT_Fashion_New.DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
        }

        .trong {
            width: 100px;
            height: 100px;
        }

        .container {
            margin-left: 600px;
        }

        .dtl {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .gv {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="trong"></div>

    <div class="container">
        <h2 style="margin-left: -50px; color: deeppink;">THÔNG TIN ĐƠN HÀNG</h2>
        <div class="dtl">
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>Họ tên: </td>
                            <td>
                                <asp:Label ID="lblHoTen" runat="server" Text='<%# Eval("hoten") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td>
                                <asp:Label ID="lblSDT" runat="server" Text='<%# Eval("sdt") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <td>
                                <asp:Label ID="lblDiaChi" runat="server" Text='<%# Eval("diachi") %>'></asp:Label></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="gv">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Tên sản phẩm" SortExpression="tensp">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tensp") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("tensp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng" SortExpression="soluong">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("soluong") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("soluong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="margin-top: 20px; display:block;">
                <asp:Label ID="lblTongTT" runat="server" Text=""></asp:Label>
                <asp:Button style="display:block; margin-top: 10px; width: 80px; height: 30px; background-color: deeppink; color: white; border-radius: 10px;" ID="btndathang"  runat="server" Text="Đặt hàng" OnClick="btndathang_Click" BorderColor="#FF3399" />
            </div>
        </div>
    </div>

</asp:Content>
