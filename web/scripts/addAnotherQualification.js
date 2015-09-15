function doSomething() {
    
  $(".addAnotherQualificationButton").click(function() {
      $('<label for="qualifications">Qualifications</label><br><select name="qualifications"><option value =""></option></select><br>').insertBefore(this);
  });
   
}

$(document).ready(doSomething);