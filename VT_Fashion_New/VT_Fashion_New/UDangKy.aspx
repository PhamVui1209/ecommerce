<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UDangKy.aspx.cs" Inherits="VT_Fashion_New.UDangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        .login {
            width: 100%;
            margin-top: 90px;
            background-image: url(./images/sb_1608724697_645.jpg);
            background-size: auto;
            background-position: center center;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: #333;
            opacity: 0.9;
            z-index: 1;
        }
        .contain {
            position: relative;
            width: 1100px;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            z-index: 2;
            display: flex;
            padding: 40px 0;
        }
        
        .logo, .form {
            flex: 1;
        }
        .logo_wrap {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0 100px;
            color: #fff;
        }
        .logo_title {
        }
        .logo_content {

        }
        .form_Wrap {
            width: 100%;
            background-color: #fff;
            padding: 30px 30px;
        }
        .form_title {
            text-align: center;
            font-size: 1.8rem;
        }
        .form_item {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 8px;
        }
        .item-name {
            font-size: 1.2rem;
            margin-bottom: 4px;
        }
        .item-control {
            width: 100%;
            display: block;
            padding: 4px 10px;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            border: 1px solid #ced4da;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <div class="overlay"></div>
        <div class="contain">
            <div class="logo">
                <div class="logo_wrap">
                    <h2 class="logo_title">Xin Chào Bạn!
                    </h2>
                    <p class="logo_content">
                        Đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ và hành động của mình là sứ mệnh, là triết lý, chiến lược... luôn cùng Yody tiến bước!
                    </p>
                </div>
            </div>
            <div class="form">
                <div class="form_Wrap">
                    <h2 class="form_title">ĐĂNG KÝ</h2>
                    <div class="form_item">
                        <label class="item-name" for="txtHT">Họ tên:</label>
                        <asp:TextBox class="item-control" ID="txtHT" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtHT" Display="Dynamic"
                            ErrorMessage="Vui lòng nhập họ tên"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtTenDN">Tên đăng nhập:</label>
                        <asp:TextBox class="item-control" ID="txtTenDN" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtTenDN" Display="Dynamic"
                            ErrorMessage="Vui lòng nhập tên đăng nhập"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtEmail">Email:</label>
                        <asp:TextBox class="item-control" ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtEmail" Display="Dynamic"
                            ErrorMessage="Vui lòng nhập Email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không đúng định dạng"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtSDT">SĐT:</label>
                        <asp:TextBox class="item-control" ID="txtSDT" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtSDT" Display="Dynamic"
                            ErrorMessage="Vui lòng nhập số điện thoại"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtSDT" Display="Dynamic" ErrorMessage="Số điện thoại không đúng"
                            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtDC">Địa chỉ</label>
                        <asp:TextBox class="item-control" ID="txtDC" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtDC" Display="Dynamic" ErrorMessage="Vui lòng nhập địa chỉ"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtMK">Mật khẩu</label>
                        <asp:TextBox class="item-control" ID="txtMK" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtMK" Display="Dynamic"
                            ErrorMessage="Vui lòng nhập mật khẩu"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtMK" Display="Dynamic"
                            ErrorMessage="Mật khẩu phải chứa ít nhất 8 ký tự, một số, một ký tự đặc biệt"
                            ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtMK2">Nhập lại mật khẩu</label>
                        <asp:TextBox class="item-control" ID="txtMK2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToCompare="txtMK" ControlToValidate="txtMK2"
                            Display="Dynamic" ErrorMessage="Mật khẩu không giống"></asp:CompareValidator>
                    </div>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UDangNhap.aspx">Bạn đã có tài khoản ?</asp:HyperLink>
                    <asp:Button ID="Button1" runat="server" Text="Đăng ký" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
