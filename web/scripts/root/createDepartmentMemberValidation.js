var departmentMemberCounter = 0;
var amountOfDepartmentMembers = 1;

function deleteDepartmentMember() {
    var departmentMemberNumber = $(this).val();
    
    // Remove the delete button
    $(this).remove();
    
    // Remove the departmentMember containter
    var departmentMemberToBeRemovedSelector = "select[name='departmentMember" + departmentMemberNumber + "']";
    
    // Remoe the departmentMember container
    $(departmentMemberToBeRemovedSelector).parent().remove();
    
    amountOfDepartmentMembers --;
    $("#hiddenDepartmentMemberCounter").val(amountOfDepartmentMembers);
}

function addAnotherDepartmentMember() {
    
    
    if ($($(".departmentMemberSelector")[amountOfDepartmentMembers-1]).val() === "") {
        alert("Please select a departmentMember before attempting to add another.");
    } else {
         // Disable the previous departmentMember 
        $('.departmentMemberSelector').attr('disabled', true);
        
        // Add the delete button
        $('<button type="button" name="deleteDepartmentMember" class="yellowButton" value=' + departmentMemberCounter + '>Delete</button><br>').insertBefore($(this));
        $('button[value="' + departmentMemberCounter + '"]').click(deleteDepartmentMember);
        
        // Increment the counters
        departmentMemberCounter ++;
        amountOfDepartmentMembers ++;
        
        $("#hiddenDepartmentMemberCounter").val(amountOfDepartmentMembers);
        
        // Add a new departmentMember selector
        $('<div class="departmentMemberSelectorContainer"><label for="departmentMembers">DepartmentMembers</label><br><select name="qualification' + qualificationCounter + '" class="qualificationSelector"><option value =""></option><option value ="masterOfScience">Master of Science</option><option value ="masterOfBusiness">Master of Business</option><option value ="masterOfBusinessAdministration">Master of Business Administration</option><option value ="masterOfBusinessDataScience">Master of Business Data Science</option></select><br></div>').insertBefore(this);  
    }
    
}

function setup() {
    
    // On click add a new departmentMember
    $(".addAnotherDepartmentMemberButton").click(addAnotherDepartmentMember);
    
    // Re-enable the selectors before submitting so the values are submitted
    $('#createDepartmentMember').on('submit', function() {
        $('.departmentMemberSelector').attr('disabled', false);
    });
    
    // Set the value of the departmentMember counter
    $("#hiddenDepartmentMemberCounter").val(amountOfDepartmentMembers);
}

$(document).ready(setup);