<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ThongTinCaNhan.aspx.cs" Inherits="VT_Fashion_New.ThongTinCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Birthstone&family=Libre+Franklin:wght@300&display=swap');

        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
        }

        .trong {
            width: 100%;
            height: 100px;
        }

        h2 {
            text-transform: capitalize;
            margin-bottom: 20px;
            font-family: 'Libre Franklin', sans-serif;
            font-size: 30px;
            font-weight: bold;
            color: deeppink;
        }

        .ctn {
            margin-left: 500px;
        }

        .mtv {
            margin-left: 80px;
            font-size: 20px;
        }

            .mtv .button {
                width: 130px;
                height: 30px;
                background-color: deeppink;
                color: white;
                border-radius: 10px;
                border: 1px solid deeppink;
            }

                .mtv .button:hover {
                    background-color: #48E0E4;
                    color: black;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="trong"></div>
    <div class="ctn">
        <h2>Thông Tin Cá Nhân Của
        <asp:Label ID="lblTen" runat="server" Text=""></asp:Label></h2>
        <div class="mtv">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1">
                        <ItemTemplate>
                            <table>
                                <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Tên đăng nhập:</td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                        <asp:Label ID="lblTenDN" runat="server" Text='<%# Eval("tendangnhap") %>'></asp:Label></td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Họ tên: </td>
                                    <td></td>
                                    <td>
                                        <asp:Label ID="lblHoTen" runat="server" Text='<%# Eval("hoten") %>'></asp:Label></td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Email: </td>
                                    <td></td>
                                    <td>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label></td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Số điện thoại:</td>
                                    <td></td>
                                    <td>
                                        <asp:Label ID="lblSDT" runat="server" Text='<%# Eval("sdt") %>'></asp:Label></td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="font-weight: bold;">Địa chỉ:</td>
                                    <td></td>
                                    <td>
                                        <asp:Label ID="lblDiaChi" runat="server" Text='<%# Eval("diachi") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Button CssClass="button" ID="btnSua" runat="server" Text="Chỉnh sửa thông tin" OnClick="btnSua_Click" />
                    <asp:Button CssClass="button" ID="btnSuaMK" runat="server" Text="Thay đổi mật khẩu" OnClick="btnSuaMK_Click" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table>
                        <tr style="height: 50px;">
                            <td style="font-weight: bold;">Họ tên</td>
                            <td>
                                <asp:TextBox ID="txtHoTenn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="txtHoTenn" Display="Dynamic" ErrorMessage="Vui lòng nhập họ tên"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr style="height: 50px;">
                            <td style="font-weight: bold;">Email</td>
                            <td>
                                <asp:TextBox ID="txtEmailn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtEmailn" Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập Email"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="txtEmailn" Display="Dynamic" ErrorMessage="Email không đúng định dạng"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="font-weight: bold;">Số điện thoại</td>
                            <td>
                                <asp:TextBox ID="txtSDTn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtSDTn" Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập số điện thoại"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtSDTn" Display="Dynamic" ErrorMessage="Số điện thoại không đúng"
                                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="font-weight: bold;">Địa chỉ</td>
                            <td>
                                <asp:TextBox ID="txtDiaChin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtDiaChin" Display="Dynamic" ErrorMessage="Vui lòng nhập địa chỉ"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button CssClass="button" ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" />
                    <asp:Button CssClass="button" ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" CausesValidation="false" />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Mật khẩu mới:"></asp:Label>
                    <asp:TextBox ID="txtmkm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtmkm" Display="Dynamic"
                        ErrorMessage="Vui lòng nhập mật khẩu">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtmkm" Display="Dynamic"
                        ErrorMessage="Mật khẩu phải chứa ít nhất 8 ký tự, một số, một ký tự đặc biệt"
                        ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$">#</asp:RegularExpressionValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Lỗi" ShowMessageBox="true" ShowSummary="false" />
                    <asp:Button CssClass="button" ID="btnLuuMK" runat="server" Text="Lưu" OnClick="btnLuuMK_Click" />
                    <asp:Button CssClass="button" ID="btnHuyMK" runat="server" Text="Hủy" OnClick="btnHuyMK_Click" CausesValidation="false" />
                </asp:View>
            </asp:MultiView>
        </div>

    </div>

</asp:Content>
