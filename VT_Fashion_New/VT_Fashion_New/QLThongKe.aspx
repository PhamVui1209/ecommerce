<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="QLThongKe.aspx.cs" Inherits="VT_Fashion_New.QLThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .bcwrap {
            margin: 0 auto;
            max-width: 720px;
        }

        .tabs {
            display: flex;
            position: relative;
        }

            .tabs .line {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 0;
                height: 6px;
                border-radius: 15px;
                background-color: #c23564;
                transition: all 0.2s ease;
            }

        .tab-item {
            min-width: 80px;
            padding: 16px 20px 11px 20px;
            font-size: 20px;
            text-align: center;
            color: #c23564;
            background-color: #fff;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom: 5px solid transparent;
            opacity: 0.6;
            cursor: pointer;
            transition: all 0.5s ease;
        }

        .tab-icon {
            font-size: 24px;
            width: 32px;
            position: relative;
            top: 2px;
        }

        .tab-item:hover {
            opacity: 1;
            background-color: rgba(194, 53, 100, 0.05);
            border-color: rgba(194, 53, 100, 0.1);
        }

        .tab-item.active {
            opacity: 1;
        }

        .tab-content {
            padding: 28px 0;
        }

        .tab-pane {
            color: #333;
            display: none;
        }

            .tab-pane.active {
                display: block;
            }

            .tab-pane h2 {
                font-size: 24px;
                margin-bottom: 8px;
            }

        #ContentPlaceHolder1_DataList1, tbody, tr, td {
            width: 100%;
        }

        .product-item {
            margin: 10px auto;
            width: 400px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

            .product-item .image {
                width: 200px;
                height: 150px;
                object-fit: cover;
            }

        .product-info {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        span {
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>BÁO CÁO - THỐNG KÊ</h1>
    <div class="bcwrap">
        <!-- Tab items -->
        <div class="tabs">
            <div class="tab-item active">
                <i class="tab-icon fas fa-code"></i>
                Số lượt truy cập
            </div>
            <div class="tab-item">
                <i class="tab-icon fas fa-cog"></i>
                Doanh thu
            </div>
            <div class="tab-item">
                <i class="tab-icon fas fa-plus-circle"></i>
                Sản phẩm bán chạy
            </div>
            <div class="line"></div>
        </div>

        <!-- Tab content -->
        <div class="tab-content">
            <div class="tab-pane active">
                <div>
                    <span>Số lượt truy cập:</span>
                    <asp:Label ID="lblSLTC" runat="server" Text="Label"></asp:Label>
                </div>
                <span>Online:</span>
                <asp:Label ID="lblOnline" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="tab-pane">
                <h2 style="font-size: 20px; color: deeppink;">Doang thu</h2>
                <span>Tháng: </span>
                <asp:TextBox ID="txtThang" runat="server"></asp:TextBox>
                <span>Năm: </span>
                <asp:TextBox ID="txtNam" runat="server"></asp:TextBox>
                <asp:Button CssClass="btnDT" ID="Button1" runat="server" Text="Tính" OnClick="Button1_Click" />
                <div>
                    <div>
                        <span>Doanh thu: </span>
                        <asp:Label ID="lblDT" runat="server" Text=""></asp:Label>
                    </div>
                    <span>Tiền lãi: </span>
                    <asp:Label ID="lblTL" runat="server" Text=""></asp:Label>
                </div>


            </div>
            <div class="tab-pane ">
                <h2>Sản phẩm bán chạy</h2>
                <div>
                    <span>Tháng: </span>
                    <asp:TextBox ID="txtThang1" runat="server"></asp:TextBox>
                    <span>Năm: </span>
                    <asp:TextBox ID="txtNam1" runat="server"></asp:TextBox>
                    <span>Top: </span>
                    <asp:TextBox ID="txtTop" runat="server"></asp:TextBox>
                    <asp:Button ID="btnTKSP" runat="server" Text="Thống kê" OnClick="btnTKSP_Click" />
                </div>
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <div class="product-item">
                            <asp:Image CssClass="image" ID="Image1" runat="server" ImageUrl='<%# "~/images/" +Eval("hinh") %>' />
                            <div class="product-info">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                                <span>Số lượng bán:
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("soluong") %>'></asp:Label>
                                </span>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <script>
        const $ = document.querySelector.bind(document)
        const $$ = document.querySelectorAll.bind(document)

        const tabs = $$('.tab-item')
        const panes = $$('.tab-pane')

        const tabActive = $('.tab-item.active')
        const line = $('.tabs .line')

        line.style.left = tabActive.offsetLeft + 'px'
        line.style.width = tabActive.offsetWidth + 'px'

        tabs.forEach((tab, index) => {
            const pane = panes[index]
            tab.onclick = function () {
                $('.tab-item.active').classList.remove('active')
                $('.tab-pane.active').classList.remove('active')

                line.style.left = this.offsetLeft + 'px'
                line.style.width = this.offsetWidth + 'px'

                this.classList.add('active')
                pane.classList.add('active')


            }

        });


    </script>
</asp:Content>
