$(document).ready(function(){

    var counter = 1;
		
    $("#addButton").click(function () {
				
	if(counter>10){
            alert("Only 10 textboxes allow");
            return false;
	}   
		
	var newTextBoxDiv = $(document.createElement('div'))
	     .attr("id", 'TextBoxDiv' + counter);
                
	newTextBoxDiv.after().html('<select name="textbox' + counter + 
	      '" id="textbox' + counter + '" value="" >' 
              + counter + '<option value=""></option>' 
              + counter + '<option value="alecHolt">Alec Holt</option>' 
              + counter + '<option value="brendonWoodford">BrendonWoodford</option>' 
              + counter + '<option value="grantDick">Grant Dick</option>' 
              + counter + '<option value="hankWolfe">Hank Wolfe</option>' 
              + counter + '<option value="holgerRegenbrecht">Holger Regenbrecht</option>');
      
 
            
	newTextBoxDiv.appendTo("#TextBoxesGroup");

				
	counter++;
     });

     $("#removeButton").click(function () {
	if(counter==1){
          alert("No more textbox to remove");
          return false;
       }   
        
	counter--;
			
        $("#TextBoxDiv" + counter).remove();
			
     });
  });