<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLLoaiSP.aspx.cs" Inherits="VT_Fashion_New.QLLoaiSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            width: 50%;
            max-width: 90%;
            margin: auto;
        }

        .text-center {
            display: block;
            text-align: center;
            width: 100%;
        }

        input[type=text] {
            width: 100%;
            max-width: 100%
        }
        tr:nth-child(2n) {
            background-color: #9AECDB;
        }

        .wrapper {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            align-items: center;
            justify-content: center;
            display: none;
        }

            .wrapper.active {
                display: flex;
            }

        .bc {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .create-form {
            position: absolute;
            z-index: 1;
            background-color: #fff;
            padding: 24px 16px;
            width: 400px;
            height: 600px;
        }

        h3 {
            text-align: center;
            margin-bottom: 28px;
            font-size: 20px;
        }

        .form-label {
            display: block;
            font-size: 20px;
        }

        .form-group {
            width: 100%;
        }

        .form-control {
            width: 100%;
            font-size: 16px;
            padding: 4px 10px;
            border-radius: 4px;
            outline: none;
            border: 1px solid rgba(0, 0, 0, 0.5);
        }

        .create-btn {
            cursor: pointer;
            background-color: brown;
            color: #fff;
            width: 100px;
            padding: 6px;
            text-align: center;
            margin: 20px auto;
        }

        .form-group:last-child {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-btn {
            padding: 0 8px;
            background-color: brown;
            color: #fff;
            border: none;
            outline: none;
            height: 40px;
            font-size: 16px;
            margin-top: 10px;
            margin-right: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

            .form-btn:first-child {
                margin-left: auto;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>QUẢN LÝ LOẠI SẢN PHẨM</h1>
    <div class="create-btn">Thêm mới</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Mã loại">
                <EditItemTemplate>
                    <asp:TextBox  ID="TextBox1" runat="server" Text='<%# Bind("maloai") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("maloai") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên loại">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tenloai") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("tenloai") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mota") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("mota") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <div class="wrapper">
        <div class="bc"></div>
        <div class="create-form">
            <h3>THÊM SẢN PHẨM</h3>
            <div class="form-group">
                <label for="" class="form-label">Mã loại</label>
                <asp:TextBox ID="txtML" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="" class="form-label">Tên loại</label>
                <asp:TextBox ID="txtTL" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="" class="form-label">Mô tả</label>
                <asp:TextBox ID="txtMT" runat="server" class="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button CssClass="form-btn" ID="btnTM" runat="server" Text="Thêm mới" OnClick="btnTM_Click" />
                <asp:Button ID="btnHuy" CssClass="form-btn" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </div>
        </div>
    </div>
    <script>
        let createBtn = document.querySelector('.create-btn')
        let wrapper = document.querySelector('.wrapper')
        let cancelBTN = document.querySelector('#cancel-btn')
        createBtn.onclick = () => {
            wrapper.classList.add('active')
        }
        cancelBTN.onclick = () => {
            wrapper.classList.remove('active')
        }

    </script>
</asp:Content>
