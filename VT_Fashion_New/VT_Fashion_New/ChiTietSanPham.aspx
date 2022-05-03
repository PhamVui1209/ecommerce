<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="VT_Fashion_New.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="ChiTietSanPham.css" rel="stylesheet" />
    <style>
        .btnRight {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="trong"></div>
    <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <div class="container">
                <div class="imgsp">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("hinh") %>' />
                </div>
                <div class="infosp">
                    <table class="tb">
                        <tr>
                            <td colspan="2">
                                <h2>
                                    <asp:Label ID="Label1" Font-Size="50px" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                                </h2>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top: -50px;" colspan="2">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Size</h4>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("size") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Màu</h4>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("mau") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Giá gốc</h4>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("giaban","{0:0,0}") %>'></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Giảm còn</h4>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%# (Convert.ToDecimal(Eval("giagiam")) == 0) ? Eval("giaban","{0:0,0}") : Eval("giagiam","{0:0,0}") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Số lượng</h4>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSL"  runat="server" Text="1" Width="50" Height="20" AutoPostBack="False"></asp:TextBox>
<%--                                 <input id="txtSL"  style="width: 50px; height: 20px" type="number" id="Quantity" name="quantity" data-max="" data-name22="" value="1" min="1" class="quantity-selector">--%>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnThemVaoGio" CssClass="btnRight" runat="server" Text="Thêm vào giỏ hàng" CommandArgument='<%# Eval("masp") %>' OnClick="btnThemVaoGio_Click" />
                    <asp:Button ID="btnmua" CssClass="btnRight" runat="server" Text="Mua ngay" CommandArgument='<%# Eval("masp") %>' OnClick="btnmua_Click" />

                </div>
            </div>

        </ItemTemplate>
    </asp:DataList>

    <h1 class="td">Sản phẩm khác</h1>
    <asp:DataList ID="DataList2" class="dtl2" runat="server" RepeatColumns="1">
        <ItemTemplate>
            <div class="itemsp">
                <div class="image">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" + Eval("hinh") %>' />
                </div>
                <br />
                <div class="info">
                    <h3>
                        <asp:Label ID="Label1" Class="h3" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                    </h3>
                    <div class="subInfo">
                        <strong class="price">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("giaban", "{0:0,0}") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="<big>đ </big>"></asp:Label>
                        </strong>
                    </div>
                </div>
                <div class="overlay">
                    <asp:LinkButton ID="btnThem" runat="server" CommandArgument='<%# Eval("masp") %>' OnClick="btnThem_Click"><i class="fas fa-cart-plus" ></i></asp:LinkButton>
                    <asp:LinkButton ID="btnCtsp" runat="server" CommandArgument='<%# Eval("masp") %>' OnClick="btnCtsp_Click"><i class="fas fa-eye"></i></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
