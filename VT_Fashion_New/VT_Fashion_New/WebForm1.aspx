<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="VT_Fashion_New.WebForm1" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="style1.css" rel="stylesheet" />
    <script src="JavaScript.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/a92271f67e.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div class="menu">
            <div class="logo">
                <div class="test">
                    <div class="vt">
                        <h3>Vt</h3>
                    </div>
                    <div class="fashion">
                        <h3>fashion</h3>
                    </div>
                </div>
            </div>
            <div class="mn">
                <div class="khoi">
                    <div class="trenlon">
                        <a href="#home" class="tren active">trang chủ</a>
                    </div>
                </div>
                <div class="khoi">
                    <div class="trenlon">
                        <a href="#arrival" class="tren">sản phẩm<i class="fas fa-sort-down"></i></a>
                    </div>
                    <div class="duoi">
                        <a href="#all">
                            Tất cả sản phẩm
                        </a>
                        <a href="#ao">
                            Áo
                        </a>
                        <a href="#quan">
                            Quần
                        </a>
                        <a href="#phukien">
                            Trang sức & Phụ kiện
                        </a>
                        <a href="#bag">
                            Túi xách & Balo
                        </a>
                    </div>
                </div>
                <div class="khoi">
                    <div class="trenlon">
                        <a href="#" class="tren">liên hệ</a>
                    </div>
                </div>
                <div class="khoi">
                    <div class="trenlon">
                        <a href="#" class="tren">tin tức & sự kiện</a>
                    </div>
                </div>
            </div>
            <div class="icon">
                <div class="giohang">
                    <a href="#">
                        <i class="fas fa-cart-plus"></i>
                    </a>
                    <asp:Label Class="textGH" ID="lblGioHang" runat="server" Text="3" meta:resourcekey="lblGioHangResource1"></asp:Label>
                </div>
                <div class="khoi s">
                    <div class="trenlon">
                        <a href="#"><i class="fas fa-search"></i></a>
                    </div>
                    <div class="duoi">
                        <asp:TextBox CssClass="input" ID="txtTim" runat="server" OnTextChanged="TextBox1_TextChanged" placeholder="Tìm kiếm..." style="left: 10px; top: 20px" meta:resourcekey="txtTimResource1"></asp:TextBox>
                        <asp:LinkButton Class="buttonTim" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" meta:resourcekey="LinkButton1Resource1"><i class="fas tk fa-search" ></i></asp:LinkButton>
                    </div>
                </div>
                <div class="khoi u">
                    <div class="trenlon">
                        <a href="#">
                            <i class="fas fa-user"></i>
                        </a>
                    </div>
                    <div class="duoi">
                         <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <a href="DangNhap.aspx">Đăng Nhập</a>
                                <a href="DangKi.aspx">Đăng Kí</a>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <a href="ThongTinCaNhan.aspx">Thông Tin Cá Nhân</a>
                                <a href="DangXuat.aspx">Đăng Xuất</a>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
            </div>
        </div>
        </header>
        <section class="home" id="home">

        <div class="home-slider owl-carousel">
        
            <div class="item">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/home_img1.jpg" meta:resourcekey="Image1Resource1"/>
                <div class="content">
                    <h3>heavy discounts</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a href="#"><button class="btn">discover</button></a>
                </div>
            </div>
        
            <div class="item">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/home_img2.jpg" meta:resourcekey="Image2Resource1"/>
                <div class="content">
                    <h3>latest gadgets</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a href="#"><button class="btn">discover</button></a>
                </div>
            </div>
        
            <div class="item">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/home_img3.jpg" meta:resourcekey="Image3Resource1"/>
                <div class="content">
                    <h3>trending shoes</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a href="#"><button class="btn">discover</button></a>
                </div>
            </div>
        
            <div class="item">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/home_img8.jpg" meta:resourcekey="Image4Resource1"/>
            </div>
        
        </div>
        
        </section>
    <section class="footer">
        <div class="container-footer">
            <div class="gt">
                <h1>VT - FASHION</h1>
                <h4>Just Beautiful & Be Your Style</h4> <br>
                <p>
                    Ra đời năm 2020, VT-Fashion với mục tiêu trở thành một trong những website mua sắm thời trang online uy tín hàng đầu Việt Nam. Tại đây quý khách có thể mua sắm trực tuyến các sản phẩm thời trang với giá cả phải chăng : quần áo, thời trang hàng hiệu, thời trang nữ, thời trang hotgirl, thời trang công sở, phụ kiện thời trang, thời trang hàn quốc, giày dép,...
                </p>
            </div>
            <div class="lienhe">
                <h3>LIÊN HỆ</h3>
                <h2>VT - FASHION</h2>
                <p>CS1: 247 Nguyễn Văn Linh, quận Thanh Khê, thành phố Đà Nẵng</p>
                <p>CS2: 68 Lê Duẩn, quận Hải Châu, thành phố Đà Nẵng</p>
                <p>ĐT: 0935686868 - 0378456789</p> <br>
                <div class="lh">
                    <i class="fab fa-facebook"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-twitter-square"></i>
                </div>
            </div>
            <div class="logo">
                <div class="test">
                    <div class="vt">
                        <h3>Vt</h3>
                    </div>
                    <div class="fashion">
                        <h3>fashion</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>


    <%-- --------------------- --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    
    <script src="JavaScript.js"></script>
</body>
</html>
