<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="VT_Fashion_New.QLSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .image-product {
            width: 100px;
            height: 100px;
            object-fit: contain;
        }

        .imageCreate {
            width: 100px;
            height: 100px;
            object-fit: contain;
        }
            
        input[type=text] {
            width: 100%;
            max-width: 100%
        }

        .text-box {
            max-width: 100%;
        }

        table {
            width: 90%;
            max-width: 90%;
            margin: auto;
        }

        label {
            text-transform: capitalize;
        }

        input {
            max-width: 100%
        }

        tr:nth-child(2n) {
            background-color: #9AECDB;
        }

        td span {
            width: 100%;
            max-width: 100%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        td:nth-child(11) {
            width: 100px;
        }

        td:last-child {
            width: 55px;
            max-width: 55px;

        } 

        td:nth-child(1), td:nth-child(2) {
            width: 110px;
        }

            td:nth-child(1) input, td:nth-child(2) input {
                width: 100%;
            }

        td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6), td:nth-child(7), td:nth-child(8), td:nth-child(9) {
            width: 80px;
        }

            td:nth-child(3) input, td:nth-child(4) input, td:nth-child(5) input, td:nth-child(6) input,
            td:nth-child(7) input, td:nth-child(8) input, td:nth-child(9) input{
                width: 80px;
            }

        select, select option {
            text-transform: capitalize;
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

        .col {
            width: 33.33%;
            float: left;
            padding-right: 4px;
        }

            .col:last-child {
                padding-right: 0px;
            }

                .col:last-child::after {
                    content: "";
                    clear: both;
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

        .cpt-text {
            text-transform: capitalize;
        }
        .ellipsis {
            white-space: nowrap;
            text-overflow: ellipsis;
            width: 110px;
            display: block;
            border-bottom: 0px;
            overflow: hidden;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Quản lý sản phẩm</h1>
    <div class="create-btn">Thêm mới</div>
    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowDeleting="GridView1_RowDeleting"
        OnRowEditing="GridView1_RowEditing"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowDataBound="GridView1_RowDataBound1">
        <Columns>
            <asp:TemplateField HeaderText="Mã sản phẩm">
                <EditItemTemplate>
                    <asp:TextBox CssClass="text-box" ID="TextBox1" runat="server" Text='<%# Bind("masp") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("masp") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên sản phẫm">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tensp") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label CssClass="ellipsis" ID="Label2" runat="server" Text='<%# Bind("tensp") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loại sp">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="true" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label CssClass="cpt-text" ID="Label3" runat="server" Text='<%# Eval("tenloai") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("size") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Màu">
                <EditItemTemplate>
                    <asp:TextBox ID="tbm" runat="server" Text='<%# Bind("mau") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbmau" runat="server" Text='<%# Bind("mau") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("soluong") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("soluong") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá nhập">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("gianhap","{0:0}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("gianhap","{0:0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá bán">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("giaban","{0:0}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("giaban","{0:0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá giảm">
                <EditItemTemplate>
                    <asp:TextBox ID="gg" runat="server" Text='<%# Bind("giagiam","{0:0}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="gg" runat="server" Text='<%# Bind("giagiam","{0:0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả">
                <EditItemTemplate>
                    <asp:TextBox ID="mt" runat="server" TextMode="MultiLine" Text='<%# Bind("mota") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="mt" runat="server" Text='<%# Bind("mota") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                    <asp:Label ID="Label20" runat="server" Text='<%#"Ảnh cũ: " + Eval("hinh") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image CssClass="image-product" ID="Image5" runat="server" ImageUrl='<%# "~/images/"+Eval("hinh") %>' />
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
                <label for="" class="form-label">Mã sản phẩm</label>
                <asp:TextBox ID="txtMSP" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="" class="form-label">Tên sản phẩm</label>
                <asp:TextBox ID="txtTSP" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="" class="form-label">Loại sản phẩm</label>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group">
                <div class="col">
                    <label for="" class="form-label">Size</label>
                    <asp:TextBox ID="txtS" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="" class="form-label">Màu</label>
                    <asp:TextBox ID="txtM" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="" class="form-label">Số lượng</label>
                    <asp:TextBox ID="txtSL" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col">
                    <label for="" class="form-label">Giá nhập</label>
                    <asp:TextBox ID="txtGN" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="" class="form-label">Giá bán</label>
                    <asp:TextBox ID="txtGB" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="" class="form-label">Gia giảm</label>
                    <asp:TextBox ID="txtGG" runat="server" class="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="form-group">
                <label for="" class="form-label">Mô tả</label>
                <asp:TextBox ID="txtMT" TextMode="MultiLine" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="" class="form-label">Hình</label>
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="showpreview(this);" />

                <asp:Image CssClass="imageCreate" ID="imageCreate" runat="server" />
            </div>
            <div class="form-group">
                <asp:Button CssClass="form-btn" ID="btnTM" runat="server" Text="Thêm mới" OnClick="btnTM_Click" />
                <asp:Button ID="btnHuy" CssClass="form-btn btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </div>
        </div>
    </div>

    <script>
        let createBtn = document.querySelector('.create-btn')
        let wrapper = document.querySelector('.wrapper')
        let cancelBTN = document.querySelector('.btnHuy')
        createBtn.onclick = () => {
            wrapper.classList.add('active')
        }
        cancelBTN.onclick = () => {
            wrapper.classList.remove('active')
        }

        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('.imageCreate').css('visibility', 'visible');
                    $('.imageCreate').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }
    </script>
</asp:Content>
