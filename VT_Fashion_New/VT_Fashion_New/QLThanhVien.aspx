<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLThanhVien.aspx.cs" Inherits="VT_Fashion_New.QLThanhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            width: 90%;
            max-width: 90%;
            margin: auto;
        }
        tr:nth-child(2n) {
            background-color: #9AECDB;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>QUẢN LÝ THÀNH VIÊN</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="Tên đăng nhập">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tendangnhap") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mật khẩu">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("matkhau") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Họ tên">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("hoten") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SĐT">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("sdt") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("diachi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
