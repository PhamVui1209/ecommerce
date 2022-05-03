<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UDangNhap.aspx.cs" Inherits="VT_Fashion_New.UDangNhap" %>
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
                    <h2 class="form_title">Đăng nhập</h2>
                    <div class="form_item">
                        <label class="item-name" for="txtTenDN">Tên đăng nhập:</label>
                        <asp:TextBox class="item-control" ID="txtTenDN" runat="server"></asp:TextBox>
                    </div>
                    <div class="form_item">
                        <label class="item-name" for="txtMK">Mật khẩu</label>
                        <asp:TextBox class="item-control" ID="txtMK" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form_item">
                        <asp:Label ID="lblTB" runat="server" Text=""></asp:Label>
                    </div>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UDangKy.aspx">Bạn chưa có tài khoản ?</asp:HyperLink>
                    <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
