// $(function() {

//     $('#side-menu').metisMenu();

// });

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
$(function() {

    $(window).bind("load resize", function() {
        console.log($(this).width())
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })

    $('#notifications').slimScroll({
        height: '300px'
    });


        
    $('input[type=date]').datepicker();
    $('input[type=month]').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'MM yy',
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    });

})
