var items;

function toggleNavigation() {
    var active = $('.selected');
    var createDepartmentMemberForm = $('#createDepartmentMember');
    var manageDepartmentMembers = $('#manageDepartmentMembers');
    
    if ($(active).text() === "Create") {
        $($(items)[0]).removeClass('selected');
        $($(items)[1]).addClass('selected');

        $(createDepartmentMemberForm).toggle();
        $(manageDepartmentMembers).toggle();
    } else {
        $($(items)[0]).addClass('selected');
        $($(items)[1]).removeClass('selected');

        $(createDepartmentMemberForm).toggle();
        $(manageDepartmentMembers).toggle();
    }
}

function setup() {
    items = $('.subnav-item');
    $(items).click(toggleNavigation); 
}

$(document).ready(setup);