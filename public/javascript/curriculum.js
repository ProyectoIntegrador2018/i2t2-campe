$(document).bind("DOMSubtreeModified", function() {
    $("input[id$='is_current']").click(function() {
        var isCurrent = $(this).prop('checked')
        var endDateId = $(this).attr('id').replace("is_current", "end_date")
        var endDateField = $('#' + endDateId).first()
        if(isCurrent) {
            endDateField.prop('disabled', true)
        } else {
            endDateField.removeAttr("disabled")
        }
    });
});