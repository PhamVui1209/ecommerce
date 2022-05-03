<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLDonHang.aspx.cs" Inherits="VT_Fashion_New.QLDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        tr:nth-child(2n) {
            background-color: #9AECDB;
        }
        .wrap-dh {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            padding: 20px 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>QUẢN LÝ ĐƠN HÀNG</h1>
    <div class="wrap-dh">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>
                    <asp:Button CssClass="btnSwap" ID="btnSwap1" runat="server" Text="Xem đơn Hoàn thành/ Hủy" OnClick="btnSwap1_Click" />
                    <asp:GridView CssClass="gv1" ID="GridView1" runat="server"
                        AutoGenerateColumns="False"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDataBound="GridView1_RowDataBound"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating"
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        DataKeyNames="madh">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("madh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tên ĐN">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("tendangnhap") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Họ Tên">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("hoten") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SĐT">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("sdt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Địa Chỉ">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("diachi") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày ĐH">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ngaydh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("tentt") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <asp:Button CssClass="btnSwap" ID="btnSwap2" runat="server" Text="Xử lý đơn hàng" OnClick="btnSwap2_Click" />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="madh"
                        OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã ĐH">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("madh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tên ĐN">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("tendangnhap") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Họ Tên">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SĐT">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("sdt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Địa chỉ">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("diachi") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày ĐH">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("ngaydh") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("tentt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
