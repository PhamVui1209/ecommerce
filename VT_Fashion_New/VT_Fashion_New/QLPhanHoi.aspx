<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLPhanHoi.aspx.cs" Inherits="VT_Fashion_New.QLPhanHoi" %>
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
    <h1>QUẢN LÝ PHẢN HỒI</h1>
    <span>Nhập thông tin cần tìm</span>
    <asp:TextBox ID="txtTT" runat="server"></asp:TextBox>
    <asp:Button ID="btnTK" runat="server" Text="Tìm kiếm" OnClick="btnTK_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="mapm" HeaderText="Mã phản hồi" SortExpression="mapm" />
            <asp:BoundField DataField="madh" HeaderText="Mã đơn hàng" SortExpression="madh" />
            <asp:BoundField DataField="tendangnhap" HeaderText="Tên đăng nhập" SortExpression="tendangnhap" />
            <asp:BoundField DataField="noidung" HeaderText="Nội dung" SortExpression="noidung" />
            <asp:BoundField DataField="ngaypm" HeaderText="Ngày phản hồi" SortExpression="ngaypm" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
