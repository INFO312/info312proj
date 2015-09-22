function setup() {
    
    $(".editButton").click(function() {
        
        // Hide
        $($(this).parent("td").siblings("td")[0]).children(".programTitle").toggle();
        $(this).toggle();
        $($(this).parent("td").siblings("td")[1]).children(".disableButton").toggle();
        
        // Show
        $($(this).parent("td").siblings("td")[0]).children(".editInput").toggle();
        $(this).siblings(".saveButton").toggle();
        $($(this).parent("td").siblings("td")[1]).children(".discardButton").toggle();
        
      
        
    });
    
    $(".discardButton").click(function() {
        
        // Show
        $($(this).parent("td").siblings("td")[0]).children(".programTitle").toggle();
        $($(this).parent("td").siblings("td")[1]).children(".saveButton").toggle();
        $(this).siblings(".disableButton").toggle();
        
        // Hide
        $($(this).parent("td").siblings("td")[0]).children(".editInput").toggle();
        $($(this).parent("td").siblings("td")[1]).children(".editButton").toggle();
        $(this).toggle();
        
    });
    
    $(".disableButton").click(function() {
        
        $(this).toggle();
        $(this).siblings(".enableButton").toggle(); 
        
    });
    
    $(".enableButton").click(function() {
        
        $(this).toggle();
        $(this).siblings(".disableButton").toggle(); 
        
    });
    
}

$(document).ready(setup);