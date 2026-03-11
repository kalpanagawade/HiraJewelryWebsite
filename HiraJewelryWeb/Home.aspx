<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HiraJewelryWeb.Home" %>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JewelleryShop.Home" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Jewellery Store</title>

<style>

body{
margin:0;
font-family:Arial;
}

/* Slider */
.slider{
position:relative;
width:100%;
height:100vh;
overflow:hidden;
}

.slider img{
width:100%;
height:100vh;
position:absolute;
object-fit:cover;
transition:opacity 1s;
}

/* Text Overlay */

.overlay{
position:absolute;
top:30%;
left:10%;
color:white;
}

.overlay h1{
font-size:60px;
margin:0;
}

.overlay h2{
font-size:40px;
}

.overlay p{
font-size:22px;
}

/* Button */

.btnExplore{
background:#d4af37;
color:black;
padding:12px 25px;
text-decoration:none;
font-size:18px;
}

/* Login icon */

.loginIcon{
position:absolute;
top:10px;
right:60px;
font-size:30px;
color:white;
cursor:pointer;
}
.headerBar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #333;
    color: white;
}

.headerBar .logo h2 {
    margin: 0;
    font-family: Arial, sans-serif;
}

.headerBar .loginContainer {
    display: flex;
    align-items: center;
}

.loginIcon img {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    cursor: pointer;
}

</style>

<script>

let current = 0;

function changeImage()
{
let images = document.getElementsByClassName("slide");
for(let i=0;i<images.length;i++)
{
images[i].style.opacity = 0;
}
current++;
if(current >= images.length)
{
current = 0;
}
images[current].style.opacity = 1;
}
setInterval(changeImage,5000);

</script>

</head>

<body>

<form runat="server">

<div class="headerBar">
    <div class="logo">
        <h2>My Website</h2>
    </div>

    <div class="loginContainer">
        <!-- LOGIN ICON -->
        <asp:LinkButton ID="btnLogin" runat="server" CssClass="loginIcon" OnClick="btnLogin_Click">
            <img src="images/profile.gif" alt="Login" />
        </asp:LinkButton>
    </div>
</div>

<div class="slider">


<img src="images/jewel1.jpg" class="slide" style="opacity:1;" />
<img src="images/jewel2.jpg" class="slide" />
<img src="images/jewel3.jpg" class="slide" />
<img src="images/jewel4.jpg" class="slide" />

<!-- TEXT -->

<div class="overlay">
<h2>For Every Role</h2>
<h1>SHE</h1>
<p>Celebrate Women's Day</p>
<h2>AUTUMN COLLECTION</h2>
<h1>Flat 8% OFF</h1>
<a class="btnExplore">Explore Now</a>

</div>
</div>
</form>

</body>
</html>
