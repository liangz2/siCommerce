/* 
 * This is a slideMenu developed to animate right-to-left scrolling effects
 * for menus.
 */

$(function(){
    var lingerTime;
    var animatingItem;
    $(".trigger").mouseenter(function() {
        var currentList = $(this);
        animatingItem = currentList.parent().children("[class~='title']").children("a");
        lingerTime = setTimeout(function(){
            currentList.hide(0, false, function(){
                animatingItem.animate({
                    right: "10px"
                });
            });
        }, 150);
    });

    $("#slideMenu li").mouseleave(function hideMenu() {
        clearTimeout(lingerTime);
        animatingItem.stop(true, false);
        var currentMenu = $(this);
        var element = currentMenu.children("[class~='title']").children("a");
        element.animate({
            duration: 400,
            "right": "-200", 
            queue: false
        },
        {
            complete: function() {
                $(currentMenu).children("[class|='trigger']").fadeIn({
                    duration: 200, 
                    queue: false
                });
            }
        });
    });
});


