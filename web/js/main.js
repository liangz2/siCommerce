/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var isHidden = false;
function loadPage(page) {
    $("#animateArea").css("width", "1024px");
    $("#content").animate({
        duration: 800,
        left: "-1200px" },
    {
        complete: function() {
            $(this).css({
                "left": "1200px", 
                "right": "-1200px"
            }).load(page, function() {
                $(this).animate({
                    duration: 800,
                    right: "0",
                    left: "0"
                });
            });
        }
    });
}

// hide/show the sideBar
function setSideBarVisibility() {
    if($(this).width() <= 1280) {
        if (isHidden === false) {
            $("#sideBar a").css({left: "-150px"});  
            isHidden = true;
        }
    } else {
        if (isHidden === true) {
            $("#sideBar a").css({left: 0});
            isHidden = false;
        }
    }
}

$(window).resize(function(e){
    setSideBarVisibility();
});
// login form check
function checkLoginForm() {
    
}
// setup website when load, same as document.ready
$(function() {
    setSideBarVisibility();
    $("#sideBar a").click(function(e) {
        if ($(this).attr("id") === "hitCounter") {
            return;
        }
        $("#sideBar a").removeClass("selected").addClass("nonselected");
        $(this).addClass("selected").removeClass("nonselected");
    });
    $("#trigger").mouseenter(function() {
        if (isHidden) {
            $("#sideBar a").css({left: 0});
            $("#sideBar").css({zIndex: 5});
        }
    });
    $("#sideBar").mouseleave(function() {
        if (isHidden) {
            $("#sideBar a").css({left: "-150px"});
            $("#sideBar").css({zIndex: 0});
        }
    });
    // hide all hyperlink urls
    $("a").mouseover(function() {
        window.status = '';
        return true;
    }).mouseout(function() {
        window.status = '';
    });
    // show/hide login form
    $("#loginLink").click(function(e) {
        if ($("#login").css("visibility") === "visible") {
            $("#login").fadeTo(200, 0, function(){
                $(this).css("visibility", "hidden");
            });
        } else {
            $("#login").css("visibility", "visible").fadeTo(200, 1);
            $("#login input[type=text]").focus();
        }
    });    
});

