<%-- 
    Document   : home
    Created on : 22-Jun-2012, 12:53:43 AM
    Author     : Icewill
--%>
<link rel="stylesheet" href="css/slider.css"/>
<link rel='stylesheet' href='css/tabRow.css'/>
<link rel="stylesheet" href="css/ddMenu.css"/>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script type="text/javascript">
    function loadXMLDoc(page) {
        $("#tabContent").load(page);
    }
</script>
<script>
    $(document).ready(function() {

        $(".tabrow li").click(function() {
            $(".tabrow li").removeClass("selected");
            $(this).addClass("selected");
            
        });
    });
</script>
<!--
<div id="menu">
    <li><a id="home" class="chosen" href="/">H<span class="small">OME</span></a></li>
    <li><a id ="about" href="?content=about">A<span class="small">BOUT US</span></a></li>
    <li><a id="service" href="?content=service">S<span class="small">ERVICES</span></a></li>
    <li><a id="host" href="?content=host">H<span class="small">OSTING</span></a></li>
    <li><a id="corp" href="?content=corp">C<span class="small">ORPORATE</span></a></li>
    <li><a id="contact" href="?content=contact">C<span class="small">ONTACT US</span></a></li>
    <li><a class="pos" href="pos.html" target="blank_">W<span class="small">PoS</span></a></li>-->
    <%--<c:if test="<%= user != null && user.isSales() %>">
        <li><a href="point_of_sale.jsp">P<span class="small">OS</span></a></li>
    </c:if>--%>
</div>
<div class="clear"></div>
<div class="slider-wrapper theme-default">
    <!--<div id="slider" class="nivoSlider">
        <img src="images/sliderAds/showroom_1.jpg" data-thumb="images/sliderAds/showroom_1.jpg" alt="Slide 1">
        <img src="images/sliderAds/showroom_2.jpg" data-thumb="images/sliderAds/showroom_2.jpg" alt="Slide 2">
    </div>-->
</div>
<div id="ddMenu">
    <jsp:include page="includes/ddMenu.jsp"/>
</div>

<ul class="tabrow">
    <li><a href="javascript:loadXMLDoc('about.jsp')">Sale</a></li>
    <li><a href="#">Search</a></li>
    <li><a href="#">Now Hiring</a></li>
    <li><a href="#">Holiday Hours</a></li>
</ul>

<div id="tabContent"></div>
