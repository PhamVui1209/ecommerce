<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UDonHang.aspx.cs" Inherits="VT_Fashion_New.UDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrap-dh {
            margin-top: 100px;
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            padding: 20px 40px;
        }
        tr:nth-child(2n) {
            background-color: #9AECDB;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap-dh">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>
                    <asp:Button CssClass="btnSwap" ID="btnSwap1" runat="server" Text="Xem đơn Hoàn thành" OnClick="btnSwap1_Click" />
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        DataKeyNames="madh"
                    >
                        <Columns>
                            <asp:TemplateField HeaderText="Mã ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("madh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngay ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ngaydh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("tentt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <asp:Button ID="btnSwap2" runat="server" Text="Xem đơn hiện tại" OnClick="btnSwap2_Click" />
                    <asp:GridView ID="GridView2" runat="server" 
                        AutoGenerateColumns="False" 
                        OnRowCommand="GridView2_RowCommand"
                        OnSelectedIndexChanged="GridView2_SelectedIndexChanged"
                        DataKeyNames="madh"
                    >
                        <Columns>
                            <asp:TemplateField HeaderText="Mã ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("madh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngay ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ngaydh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("tentt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button CommandName="btnPhanHoi" CommandArgument='<%# Eval("madh") %>' ID="Button1" runat="server" Text="Phản hồi" CssClass="btnPH" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:View>
        </asp:MultiView>

        <div class="info-view">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="tensp" HeaderText="Tên SP" SortExpression="tensp" />
                    <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
