function setup() {
    $(".applicationShowHide").click(function() {
        var iframe = $(this).siblings("iframe")
        var src = $(iframe).attr("data-src");
        
        $(iframe).attr("src", src);
        $(iframe).toggle();
       
        if ($(this).text() === "Show") {
            $(this).text("Hide");
        } else {
            $(this).text("Show");
        }
    });
}

$(document).ready(setup);