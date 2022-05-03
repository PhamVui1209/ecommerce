<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="VT_Fashion_New.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="TrangChu1.css" rel="stylesheet" />
    <link href="TrangChu2.css" rel="stylesheet" />
    <script src="TrangChu.js" type="text/javascript"></script>
    <style>
        .dtlph{
            margin-left: 180px;
        }
        .itemph{
            margin-left: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%------------- Slide------------- --%>
    <section class="home" id="home">

        <div class="home-slider owl-carousel">

            <div class="item">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/home_img1.jpg" meta:resourcekey="Image1Resource1" />
                <div class="content">
                    <h3>heavy discounts</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a>
                        <asp:Button ID="Button1" class="btn" runat="server" Text="discover" /></a>
                </div>
            </div>

            <div class="item">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/home_img2.jpg" meta:resourcekey="Image2Resource1" />
                <div class="content">
                    <h3>latest gadgets</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a>
                        <asp:Button ID="Button2" class="btn" runat="server" Text="discover" /></a>
                </div>
            </div>

            <div class="item">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/home_img3.jpg" meta:resourcekey="Image3Resource1" />
                <div class="content">
                    <h3>trending shoes</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, neque.</p>
                    <a>
                        <asp:Button ID="Button3" class="btn" runat="server" Text="discover" /></a>
                </div>
            </div>

            <div class="item">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/home_img8.jpg" meta:resourcekey="Image4Resource1" />
            </div>

        </div>
    </section>


    <%-- --------Top sản phẩm bán chạy (dùng databound)--%>
    <%--        <section class="arrival" id="arrival">

        <h1 class="heading"> <span>Sản phẩm bán chạy</span> </h1>
        
        <div class="box-container owl-carousel">
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image5" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Áo trắng</h3>
                    <div class="subInfo">
                        <strong class="price"> $10000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image6" ImageUrl="~/images/arr-img4.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Áo thun</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image7" ImageUrl="~/images/tui1.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Áo hở vai</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image8" ImageUrl="~/images/arr-im7.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Giày cao gót</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image9" ImageUrl="~/images/arr-im8.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Mũ</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
        
            <div class="item">
                <div class="image">
                    <asp:Image ID="Image10" ImageUrl="~/images/arr-im5.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Giày cao gót</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>

            <div class="item">
                <div class="image">
                    <asp:Image ID="Image11" ImageUrl="~/images/arr-img2.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Áo</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>

            <div class="item">
                <div class="image">
                    <asp:Image ID="Image12" ImageUrl="~/images/balo1.jpg" runat="server" />
                </div>
                <div class="info">
                    <h3>Dây chuyền bạc</h3>
                    <div class="subInfo">
                        <strong class="price"> $1000/- <span>$1500/-</span> </strong>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half"></i>
                        </div>
                    </div>
                </div>
                <div class="overlay">
                    <a href="#" style="--i:1;" class="fas fa-heart"></a>
                    <a href="#" style="--i:2;" class="fas fa-shopping-cart"></a>
                    <a href="#" style="--i:3;" class="fas fa-eye"></a>
                </div>
            </div>
            
        </div>
        
    </section>--%>



    <%-- Tạm thời đưa sản phẩm lên trước, đưa top 6 bán chạy sau --%>

    <h1 class="heading"><span>Sản phẩm bán chạy</span> </h1>

    <asp:DataList ID="DataList1" Class="dtlsp" runat="server" RepeatColumns="3">
        <ItemTemplate>
            <div class="itemsp">
                <div class="image">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" + Eval("hinh") %>' />
                </div>
                <br />
                <div class="info">
                    <h3>
                        <asp:Label ID="Label1" Class="h3" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                    </h3>
                    <div class="subInfo">
                        <strong class="price">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("giaban", "{0:0,0}")%>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="<big>đ </big>"></asp:Label>
                        </strong>
                    </div>
                </div>
                <div class="overlay">
                    <asp:LinkButton ID="btnThem" runat="server" CommandArgument='<%# Eval("masp") %>' OnClick="btnThem_Click"><i class="fas fa-cart-plus"></i></asp:LinkButton>
                    <asp:LinkButton ID="btnCtsp" runat="server" CommandArgument='<%# Eval("masp") %>' OnClick="btnCtsp_Click"><i class="fas fa-eye"></i></asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <%-- ----------------Giảm giá (click vô button sẽ ra các sản phẩm giảm giá)------------------- --%>
    <section class="best_seller">
        <div class="seller_container">
            <div class="images">
                <img src="./images/banner.gif" alt="">
            </div>
            <div class="test">
                <h1>Giảm giá Sock - Đừng bỏ lỡ</h1>
                <a href="GiamGia.aspx">
                    <asp:Button ID="Button4" class="btn" runat="server" Text="MUA NGAY" OnClick="Button4_Click" />
                </a>
            </div>
        </div>
    </section>
    <%-- ----------------------------- --%>
    <section class="deal">
        <div class="deal_container">
            <div class="item">
                <div class="deal_icon">
                    <i class="fas fa-shipping-fast"></i>
                </div>
                <div class="deal_text">
                    <h1>FREE SHIPPING</h1>
                </div>
            </div>
            <div class="item">
                <div class="deal_icon">
                    <i class="fas fa-money-check-alt"></i>
                </div>
                <div class="deal_text">
                    <h1>EASY PAYMENTS</h1>
                </div>
            </div>
            <div class="item">
                <div class="deal_icon">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div class="deal_text">
                    <h1>10 DAYS REPLACEMENTS</h1>
                </div>
            </div>
        </div>
    </section>

    <%-- ---------Hiển thị đánh giá của khách hàng-------------------- --%>
<%--    <section class="review">
        <h1 class="heading"><span>Đánh giá từ khách hàng </span></h1>
        <div class="review_container owl-carousel">
            <div class="item">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem, itaque molestiae voluptate consequatur neque natus aperiam facere soluta, tenetur veritatis suscipit, necessitatibus reiciendis ut magnam modi corporis nulla voluptatem! Ab!</p>
                <div class="user">
                    <div class="img">
                        <asp:Image ID="Image13" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                    </div>
                    <div class="text">
                        <h3>Phạm Vui</h3>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem, itaque molestiae voluptate consequatur neque natus aperiam facere soluta, tenetur veritatis suscipit, necessitatibus reiciendis ut magnam modi corporis nulla voluptatem! Ab!</p>
                <div class="user">
                    <div class="img">
                        <asp:Image ID="Image14" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                    </div>
                    <div class="text">
                        <h3>Phạm Vui</h3>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem, itaque molestiae voluptate consequatur neque natus aperiam facere soluta, tenetur veritatis suscipit, necessitatibus reiciendis ut magnam modi corporis nulla voluptatem! Ab!</p>
                <div class="user">
                    <div class="img">
                        <asp:Image ID="Image15" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                    </div>
                    <div class="text">
                        <h3>Phạm Vui</h3>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem, itaque molestiae voluptate consequatur neque natus aperiam facere soluta, tenetur veritatis suscipit, necessitatibus reiciendis ut magnam modi corporis nulla voluptatem! Ab!</p>
                <div class="user">
                    <div class="img">
                        <asp:Image ID="Image16" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                    </div>
                    <div class="text">
                        <h3>Phạm Vui</h3>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem, itaque molestiae voluptate consequatur neque natus aperiam facere soluta, tenetur veritatis suscipit, necessitatibus reiciendis ut magnam modi corporis nulla voluptatem! Ab!</p>
                <div class="user">
                    <div class="img">
                        <asp:Image ID="Image17" ImageUrl="~/images/arr-im1.jpg" runat="server" />
                    </div>
                    <div class="text">
                        <h3>Phạm Vui</h3>
                    </div>
                </div>
            </div>

        </div>
    </section>--%>

    <%-- Phản hồi --%>
    <h1 class="heading"><span>Đánh giá từ khách hàng </span></h1>
    <asp:DataList ID="DataList2" Class="dtlph" runat="server"  RepeatColumns="3">
        <ItemTemplate>
            <div class="itemph">
                <p>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("noidung") %>'></asp:Label>
                </p>
                <div class="user">
                    <div class="text">
                        <h3>
                             <asp:Label ID="Label4" runat="server" Text='<%# Eval("tendangnhap") %>'></asp:Label>
                        </h3>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <div class="popup">
        <div class="closepopup"><i class="far fa-times-circle"></i></div>
        <div class="load">
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
            <h1>Vt - Fashion xin chào!</h1>
            <h2>Cảm ơn bạn đã ghé thăm</h2>
        </div>
    </div>

</asp:Content>
