$(document).ready(function() {
    initFields();
    const observer = new MutationObserver(initFields);
    var element = document.getElementById("work-experiences");
    if (element) {
        observer.observe(element, { childList: true });
    }
})

function initFields() {
    $("input[id$='is_current']").each(function(index, field) {
        updateDateFieldDisplay(field);
        $(field).click(function(event) {
            updateDateFieldDisplay(event.target);
        })
    })
}

function updateDateFieldDisplay(checkboxField) {
    const isCurrent = $(checkboxField).prop('checked');
    const endDateId = $(checkboxField).attr('id').replace("is_current", "end_date");
    const endDateField = $('#' + endDateId).first();
    if(isCurrent) {
        endDateField.prop('disabled', true);
    } else {
        endDateField.removeAttr("disabled");
    }
}