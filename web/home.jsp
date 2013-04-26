<%-- 
    Document   : point_of_sale
    Created on : 17-Jun-2012, 1:44:15 PM
    Author     : Icewill
--%>
<script>
    $(function() {
        $("#projectSlides").nivoSlider();
        
    });
    function expand(id, h) {
        if ($(id).hasClass("selected")) {
            $(id).removeClass("selected").animate({ width: "300px", height: "55px" }, 200);
            return;
        } else {
            if ($(".project.selected").length !== 0) {
                $(".project.selected").animate({ width: "300px", height: "55px" }, 300).removeClass("selected");
            }
            $(id).animate({ width: "95%" }, 400, function(){$(this).animate({ height: h }, 300, function(){$(this).addClass("selected");});});      
        }
    }
</script>

<div id='clear'></div>
<div id="projectDetails">
    <div id="wiki" class="project">
        <h3><a onclick="expand('#wiki', '300px');">Wiki Site Management System</a></h3>
        <img class="leftImg" src="images/projects/wiki/apply_to_join.jpg">
        <p class="top_p">
            This is the project for CMPT315 the Web Centric course, which introduces 
            Java Server Page programming, JavaScript, usage of MySQL on eCommerce sites
            and the concept of server request/response protocols.
        </p>
        <p>
            The WSMS focuses on the connection between websites and the backend database 
            where allows logins of different users creating different site wiki pages that 
            manage them. Users can create their projects and upload webpages onto them, as 
            well as apply to join a project. Administrator of a project has the ability to
            approve the application, remove users and remove pages. All users including 
            the administrator can apply for a promotion and demotion, and when the last 
            person leaves the project it will be automatically deleted.
        </p>
    </div>
    <div id='clear'></div>
    <div id='egrapid' class="project">
        <h3><a onclick="expand('#egrapid', '280px');">EGRAPID</a></h3>
        <img class='leftImg' src="images/projects/egrapid/downloader.png">
        <p class="top_p">
            EGRAPID is a weather forecasting software developed by a brilliant meteorologist
            and former employee at Environment Canada, Jamie Archibald. 
        </p>
        <p>
            During the summer in 2010, I was asked to fix this software that origainlly 
            ran on a Linux-based system. The data for this software to work is also not 
            working. Instead of repairing the program I developed a new system which combined 
            both features together in Java with Swing GUI package. The data harvesting part used 
            threading heavily in order to download multiple data sets over 150 megabytes simultaneously.
        </p>
    </div>
    <div id='clear'></div>
    <div id="drawkit" class="project">
        <h3><a onclick="expand('#drawkit', '280px');">DrawKit</a></h3>
        <img class="leftImg" src="images/projects/drawkit/copy.png">
        <p class="top_p">
            DrawKit is the final project for the OOP course in Java and Swing package 
            that demonstrate the understanding of how objects work as in interface and inheritance.

        </p>
        <p>
            The program simply takes user input for parameters such as the radius of 
            a circle, side of a square, color through the colorchooser etc.
            The program supports redo and undo feature and saving as a file; in additional, 
            I added in the ability to resize by dragging the square box in the conner of 
            every shape.
        </p>
    </div>
    <div id='clear'></div>
    <div id='ushahidi' class="project">
        <h3><a onclick="expand('#ushahidi', '240px');">Ushahidi Standalone Application</a></h3>
        <p class="top_p">
            This project is based on Java and Swing and the Ushahidi web project 
            with the ability to read, summit incidences without the constrains of browser.
        </p>
        <p>
            &quot;Ushahidi&quot; was the original name of the web mash-up we built in response 
            to the 2008 post-election violence in Kenya. Shortly thereafter, &quot;Ushahidi&quot; the 
            company was formed as we started to turn the original web mash-up into an open 
            source platform. The name &quot;Ushahidi&quot; now refers to the company and our flagship 
            platform is now called the &quot;Ushahidi Platform&quot;. 
            For more information about Ushahidi project, please visit their 
            <a href="http://www.ushahidi.com" target="_blank">website</a>.
        </p>
    </div>
    <div id="clear"></div>
    <div id="viamachinery" class="project">
        <h3><a onclick= "expand('#viamachinery', '210px');">Viamachinery.com</a></h3>
        <p class="top_p">
            <a href='http://viamachinery.com/testing' target="_blank">VIA Machinery</a> is javascript enriched web site I recently developed 
            for a customer through Honor Computer Systems.
        </p>
        <p>
            The requirement from the customer was simple and I decided to use jQeury dynamic loading instead of the conventional 
            page loading method, which makes the web site completely free of obvious loading(loading is done behind the scene) and 
            appear to be in one piece. 
            All fade-in and fade-out effects are also achieved by using jQuery and written by me from the ground up 
            (except for the slider).
        </p>
    </div>
</div>