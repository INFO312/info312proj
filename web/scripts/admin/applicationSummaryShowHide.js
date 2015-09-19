function setup() {
    
    $(".applicationSummaryWrapper").each(function() {
       $(this).toggle();
    });

    $(".applicationSummaryDate").click(function() {
        
        $(this).siblings(".applicationSummaryWrapper").toggle();
        var currentArrow = $(this).children("span");
        if ($(currentArrow).attr("class") === "downArrow") {
            $(currentArrow).attr("class", "upArrow");
            $(currentArrow).html('&#x25B2;');
        } else {
            $(currentArrow).attr("class", "downArrow");
            $(currentArrow).html('&#x25BC;'); 
        }
       
    });
    
}

$(document).ready(setup);