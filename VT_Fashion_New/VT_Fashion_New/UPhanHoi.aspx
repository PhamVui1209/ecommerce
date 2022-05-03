<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UPhanHoi.aspx.cs" Inherits="VT_Fashion_New.UPhanHoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .title {
            margin-top: 100px;
        }
        .temp {
            visibility: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="title">PHAN HỔI</h1>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="txtPH" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btnPhanHoi" runat="server" Text="Gửi phản hồi" OnClick="btnPhanHoi_Click"/>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UDonHang.aspx">Hủy</asp:HyperLink>



    <%-- cái này đừng đụng vào --%>
    <asp:Label ID="temp" runat="server" Text="Label" CssClass="temp"></asp:Label>
</asp:Content>
