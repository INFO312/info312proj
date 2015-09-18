$(document).ready(function(){

    var counter = 1;
		
    $("#addButton").click(function () {
				
	if(counter>10){
            alert("Only 10 textboxes allow");
            return false;
	}   
		
	var newTextBoxDiv = $(document.createElement('div'))
	     .attr("id", 'TextBoxDiv' + counter);
                
	newTextBoxDiv.after().html('<label>Qualification:'+ '</label>' +
	      '<input type="text" name="textbox' +  
	      '" id="textbox' + '" value="" >' +'<label>Year:'+ '</label>' +
	      '<input type="number" name="textbox' + 
	      '" id="textbox' + '" value="" >');
      
 
            
	newTextBoxDiv.appendTo("#TextBoxesGroup");

				
	counter++;
     });

     $("#removeButton").click(function () {
	if(counter===1){
          alert("No more textbox to remove");
          return false;
       }   
        
	counter--;
			
        $("#TextBoxDiv" + counter).remove();
			
     });
  });