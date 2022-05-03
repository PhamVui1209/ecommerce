<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LoaiSanPham.aspx.cs" Inherits="VT_Fashion_New.LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="TrangChu1.css" rel="stylesheet" />
    <link href="SanPham.css" rel="stylesheet" />
    <style>
        .box {
            /*margin-top: 200px;*/
        }

        .trong {
            width: 100%;
            height: 150px
        }

        .box .info .name .price .gg {
            color: #666;
            font-size: 1rem;
            text-decoration: line-through;
        }
        .box .info .name p {
            margin-bottom: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="trong"></div>
    <asp:DataList ID="DataList1" Class="dtlsp1" runat="server" RepeatColumns="3">
        <ItemTemplate>
            <div class="box">
                <div class="hover">
                    <asp:LinkButton ID="btnThem" runat="server" class="fas fa-cart-plus heart" CommandArgument='<%# Eval("masp") %>' OnClick="btnThem_Click"></asp:LinkButton>
                    <asp:LinkButton ID="btnCtsp" runat="server" class="fas fa-eye cart" CommandArgument='<%# Eval("masp") %>' OnClick="btnCtsp_Click"></asp:LinkButton>
                </div>
                <div class="image">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" + Eval("hinh") %>' />
                </div>
                <div class="info">
                    <div class="name">
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                        </h3>
                        <p>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                        </p>
                        <strong class="price">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("giaban", "{0:0,0}") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="<big>đ </big>"></asp:Label>
                        </strong>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:Label ID="lblTrong" runat="server" Text=""></asp:Label>
</asp:Content>
