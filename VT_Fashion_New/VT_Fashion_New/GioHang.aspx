<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="VT_Fashion_New.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="TrangChu.js" type="text/javascript"></script>
    <script type="text/javascript"  language="javascript">
        function Func() {
            alert("hello!")
        }
    </script>
    <style>
        .trong {
            width: 100%;
            height: 100px;
        }

        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
        }

        .gv {
            margin-left: 400px;
            text-align: center;
        }

        .tt {
            margin-left: 925px;
            margin-top: 40px;
        }

        .btnRight {
            text-decoration: none;
            border-radius: 10px;
            margin-left: 20px;
            color: white;
            background-color: deeppink;
            width: 100px;
            height: 50px;
            padding: 10px 10px;
        }

        /*.textGH {
            font-weight: bold;
            font-size: 12px;
            width: 10px;
            height: 10px;
            margin-left: 1265px;
            margin-top: -1000px;
            background-color: yellow;
            color: var(--black);
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 50%;
            border-top-left-radius: 50%;
            border-top-right-radius: 50%;
        }*/
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="trong"></div>

    <asp:GridView ID="GridView1" runat="server" Class="gv" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <%--<asp:TemplateField HeaderText="Hình ảnh">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinhanh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" + Eval("hinh") %>' />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Tên sản phẩm" ItemStyle-Width="200" ItemStyle-Height="50">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tensp") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("tensp") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("masp") %>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng" HeaderStyle-Width="200">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("soluong") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtSL" runat="server" Text='<%# Bind("soluong") %>'></asp:TextBox>
                    <asp:Button ID="btnsua" runat="server" Text="Sửa" CommandName="btnsua" />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá" ItemStyle-Width="200">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("dongia","{0:0,0}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("dongia","{0:0,0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành tiền" HeaderStyle-Width="200">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTT" runat="server" Text='<%# Bind("thanhtien","{0:0,0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("thanhtien","{0:0,0}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnxoa" Style="text-decoration: none;" runat="server" Width="40" Height="20" ForeColor="Red">Xóa</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <div class="tt">
        <asp:Label ID="Label1" runat="server" Style="font-size: 20px; font-weight: bold;" Text="Tổng thành tiền: "></asp:Label>
        <asp:Label ID="lblTongTT" CssClass="lbltt" runat="server" Text=""></asp:Label>
        <asp:LinkButton ID="btnDatHang" CssClass="btnRight" runat="server" OnClick="btnDatHang_Click">Đặt hàng</asp:LinkButton>
    </div>
    <%--    <asp:Label Class="textGH" ID="lblGioHang" runat="server" Text="0" meta:resourcekey="lblGioHangResource1"></asp:Label>--%>
</asp:Content>
