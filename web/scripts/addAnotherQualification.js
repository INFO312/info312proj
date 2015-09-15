var qualificationCounter = 0;

function deleteQualification() {
    var qualificationNumebr = $(this).val();
    
    // Remove the delete button
    $(this).remove();
    
    // Remove the qualification containter
    var qualificationToBeRemovedSelector = "select[name='qualification" + qualificationNumebr + "']";
    
    // Remoe the qualification container
    $(qualificationToBeRemovedSelector).parent().remove();
}

function addAnotherQualification() {
    
    if ($($(".qualificationSelector")[qualificationCounter]).val() === "") {
        alert("Please select a qualification before attempting to add another.");
    } else {
         // Disable the previous qualification 
        $('.qualificationSelector').attr('disabled', true);
        
        // Add the delete button
        $('<button type="button" name="deleteQualification" class="yellowButton" value=' + qualificationCounter + '>Delete</button><br>').insertBefore($(this));
        $('button[value="' + qualificationCounter + '"]').click(deleteQualification);
        
        // Increment the counter
        qualificationCounter ++;
        
        // Add a new qualification selector
        $('<div class="qualificationSelectorContainer"><label for="qualifications">Qualifications</label><br><select name="qualification' + qualificationCounter + '" class="qualificationSelector"><option value =""></option><option value ="masterOfScience">Master of Science</option><option value ="masterOfBusiness">Master of Business</option><option value ="masterOfBusinessAdministration">Master of Business Administration</option><option value ="masterOfBusinessDataScience">Master of Business Data Science</option></select><br></div>').insertBefore(this);  
    }
    
}

function setup() {
    
    // On click add a new qualification
    $(".addAnotherQualificationButton").click(addAnotherQualification);
    
    // Re-enable the selectors before submitting so the values are submitted
    $('#createDepartmentMember').on('submit', function() {
        $('.qualificationSelector').attr('disabled', false);
    });
}

$(document).ready(setup);