<%-- 
    Document   : pos
    Created on : 4-Feb-2013, 2:36:06 PM
    Author     : Wilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    $(document).ready(function(){
        $('#posSlides').movingBoxes({
            startPanel   : 1,      // start with this panel
            reducedSize  : 0.7,    // non-current panel size: 80% of panel size
            buildNav     : true,   // if true, navigation links will be added
            navFormatter : function(index, panel){ return panel.find('b span').text(); } // function which gets nav text from span inside the panel header

            // width and panelWidth options removed in v2.2.2, but still backwards compatible
            // width        : 500,    // overall width of movingBoxes (not including navigation arrows)
            // panelWidth   : 0.7,    // current panel width
        });
        
        $("#posSlides img").fancyZoom();
    });
    
</script>
<div id='posPage'>
    <div id="posSlides">
        <div>
            <img src="images/movingBox/pos/Pos_C_login.jpg" alt="#big_1">
            <b><span>Login</span> control</b>
            <p>Log in as different user for various rank control</p>
        </div>
        <div>
            <img src="images/movingBox/pos/Pos_C_menu.jpg" alt="#big_2">
            <b><span>Menu</span> control</b>
            <p>Tabbed pane based menu control</p>
        </div>
        <div>
            <img src="images/movingBox/pos/Pos_C_inventory_master.jpg" alt="#big_3">
            <b><span>Inventory</span> control</b>
            <p>Inventory master controls the entire database</p>
        </div>
        <div>
            <img src="images/movingBox/pos/Pos_C_add1.jpg" alt="#big_4">
            <b><span>Add</span> more products</b>
            <p>Ability to add more products</p>
        </div>

        <div>
            <img src="images/movingBox/pos/Pos_C_add2.jpg" alt="#big_5">
            <b><span>Feedback</span> for add action</b>
            <p>Successfully adding a product</p>
        </div>

        <div>
            <img src="images/movingBox/pos/Pos_C_remove1.jpg" alt="#big_6">
            <b><span>Remove</span> product</b>
            <p>Able to remove product from database</p>
        </div>

        <div>
            <img src="images/movingBox/pos/Pos_C_remove2.jpg" alt="#big_7">
            <b><span>Feedback</span> for remove action</b>
            <p>Successfully removing a product</p>
        </div>

        <div>
            <img src="images/movingBox/pos/Pos_C_sales.jpg" alt="#big_8">
            <b><span>Sales</span> control that creates invoice</b>
            <p>A table that keeps track of purchased items</p>
        </div>
    </div>

    <div id="big_1">
        <img src="images/projects/pos/Pos_C_login.png" alt="picture">
    </div>
    <div id="big_2">
        <img src="images/projects/pos/Pos_C_menu.png" alt="picture">
    </div>
    <div id="big_3">
        <img src="images/projects/pos/Pos_C_inventory_master.png" alt="picture">
    </div>
    <div id="big_4">
        <img src="images/projects/pos/Pos_C_add1.png" alt="picture">
    </div>
    <div id="big_5">
        <img src="images/projects/pos/Pos_C_add2.png" alt="picture">
    </div>
    <div id="big_6">
        <img src="images/projects/pos/Pos_C_remove1.png" alt="picture">
    </div>
    <div id="big_7">
        <img src="images/projects/pos/Pos_C_remove2.png" alt="picture">
    </div>
    <div id="big_8">
        <img src="images/projects/pos/Pos_C_sales.png" alt="picture">
    </div>

    <div id='posIntro'>
        <h2>Web Based Point of Sale System (WBPOSS)</h2>
        <p>
            The Web Based Point of Sale System is inspired by and originally design for 
            the company I worked for a year named <a href="http://www.honorcomp.com" target="_self">
            Honor Computer Systems</a>. The system is a vast, old system that 
            includes inventory control and so on.
        </p>
        <h3>Overview</h3>
        <p>
            The basic idea is to unify the database of both the eCommerce site and the 
            Pos system,at the same time have the Pos run within the browser, removing the constrain of 
            the Wndows Remote Desktop we are currently using. Due to the nature of the all remote 
            desktop, good Internet connection is mandatory, and it happens to be an opposite in 
            one of our store because of the constant uploading of the security cameras. 
        </p>
        <p>
            With the thought of making an web app JavaScript came to my mind so were other possibilities 
            such as Java web app, C# web app etc. Eventually I chose JavaFX which bares 
            strong ability to create rich graphical interface and also that's what I've wanted 
            to do with any application. The result on the decision is quite satisfying because 
            the syntax of JavaFX is exactly the same with Java which has always been my expertise.
        </p>
        <p>
            JavaFX has the ability to make use of the Cascading Style Sheet syntax to enhance the GUI design in terms 
            of flexibility and easiness. After JDK7, JavaFX compiler is embedded within the 
            installer where everyone can have access to without hassling with installing an other 
            run time environment. With the help of CSS and the JavaFX animation feature, I created 
            a easy-to-use and modern graphical interface.
        </p>
        <h3>Data Synchronization</h3>
        <p>
            All data query calls made on the clients are remote methods on the server, doing so 
            the there is only one set of code needed to be changed when there is an update 
            or fix required. The first choice is the RMI (Remote Method Invocation) package 
            provided by Java, but soon I decided to go for a third-party package called <a href="http://hessian.caucho.com" target="_blank">
                Hessian Binary Web Service Protocol
            </a> because it gives the option to operate as a servlet in JSP, which in my case 
            fits the requirement seamlessly.
        </p>
        <p>
            Hessian also supports https protocol which makes secure logins handy to work with. 
            Using Hessian I am able to achieve synchronization whenever a product is purchased 
            the server will call the update method remotely and update all clients that are currently 
            viewing the product list.
        </p>
        <h3>GUI</h3>
        <div id="guiIntro">
                <b>Tabbed Control</b>
            <ul class="guiList">
                <li>No extra windows open</li>
                <li>clean and easy to control</li>
                <li>Open as many as desired</li>
            </ul>
                <b>Graphical Buttons</b>
            <ul class="guiList">
                <li>No toolbar but big buttons</li>
                <li>Much easier to navigate through menu</li>
                <li>Modern & Stylish</li>
            </ul>
                <b>Animated Message Prompt</b>
            <ul class="guiList">
                <li>JavaFX built-in animation class</li>
                <li>Click through, no need to close</li>
                <li>Fade-in & Fade-out</li>
            </ul>
        </div>
        <p><a href="javascript: loadPage('PosClient.html')">Click to start the application in the browser</a></p>
    </div>
</div>