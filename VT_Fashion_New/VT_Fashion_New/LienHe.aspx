<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="VT_Fashion_New.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .menu a{
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3834.1115787172234!2d108.20595431468405!3d16.0596986888868!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1632377209324!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    <div class="box-container owl-carousel">
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <div class="item">
                <div class="image">
                    <img src="images/ao1.webp" alt="">
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
            </ItemTemplate>
        </asp:DataList>
    </div>
    
</asp:Content>
