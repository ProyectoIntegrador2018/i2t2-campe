var selectedRow;

$(document).ready(function() {
    $('.table-row').on('click', function () {
        if (selectedRow) {
            selectedRow.removeClass('table-selected-row');
        }
        $(this).addClass('table-selected-row');
        selectedRow = $(this);
        var buttons = $('.actions .table-button');
        buttons.each((index, button) => {
            var tag = $(button).attr('table-button-tag');
            if (!tag || $(selectedRow).find("a:contains('" + tag + "')").size() > 0) {
                $(button).removeClass('disabled');
            } else {
                $(button).addClass('disabled');
            }
        });
        var buttons = $('.actions .table-button-dropdown');
        buttons.each((index, button) => {
            var tag = $(button).attr('table-button-tag');
            if (!tag || $(selectedRow).find("a:contains('" + tag + "')").size() > 0) {
                $(button).parent().removeClass('hide');
            } else {
                $(button).parent().addClass('hide');
            }
        });
    } );

    $('.table-button, .table-button-dropdown').on('click', function () {
        var tag = $(this).attr('table-button-tag');
        if (tag) {
            $(selectedRow).find("a:contains('" + tag + "')")[0].click();
        }
    });
} );