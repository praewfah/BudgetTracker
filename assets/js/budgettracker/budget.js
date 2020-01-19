$(document).ready(function() {
    
    //transection
    if ($("#transection").length) {
        initTransection($('#date-from').val(), $('#date-to').val()) ;
    }
    
    if ($("#income").length) {
        initData($('#inputBudgetMonth').val(), $('#inputBudgetYear').val()) ;
    }
    
    $('#inputBudgetType').on('change', function(){
        $('#inputBudgetCategory').hide();
        $('#inputBudgetCategoryIncome').hide();
        $('#inputBudgetCategoryExpense').hide();
        
        var d = $(this).val();
        $('#inputBudgetCategory'+d).removeAttr('disabled').show();
    }); 
    
    // Allow digits only, using a RegExp
    $("#inputBudgetAmount").inputFilter(function(value) {
        return /^\d*$/.test(value);  
    });
    
    $('form').on('submit', function(){
        $('input, select').each(
            function(){  
                var input = $(this);
                checkValid(input);
            }
        );
    } );
   
    $('#search-transection').on('click', function(){
        initTransection($('#date-from').val(), $('#date-to').val()) ;
    });
   
    $('#inputBudgetMonth').change(function(){
        initData($(this).val(), $('#inputBudgetYear').val()) ;
    });
    
    $('#inputBudgetYear').change(function(){
        initData($('#inputBudgetMonth').val(), $(this).val()) ;
    });

} );

function initTransection(from, to) {
    var transections = GetData('load_budget_transection', from, to);

    transections.success(function (data) {
        $("#transection").dataTable().fnDestroy();
        render_table_transection(data);
    });
}

function initData(m, y) {
    var total_income;
    var call_income = GetData('load_budget_income', m, y);
    
    call_income.success(function (data) {
        $("#income").dataTable().fnDestroy();
        render_table("income", data);
        
        total_income = data.total_income;
        $('#total-income').html(addCommas(total_income));
        
        var call_expense = GetData('load_budget_expense', m, y);
        call_expense.success(function (data) {
             $("#expense").dataTable().fnDestroy();
            render_table("expense", data);

            var total_expense = data.total_expense;
            $('#total-expense').html(addCommas(total_expense));

            var total_balance = total_income- total_expense;
            $('#total-balance').html(addCommas(total_balance));
        });
    });
}

function render_table_transection(data){
    $('#transection').DataTable({
        "paging":   false,
        "info":     false,
        "data": (data.data),
        "columns": [           
            { "data": "transection_date", "width": "15%" },
            { "data": "budget_category", "width": "15%" },
            { "data": "description", "width": "40%" },
            { "data": "budget_type", "width": "15%" },
            { "data": null, "width": "15%", render: function (data) {
                if(data.budget_type == "Expense") {
                    return '<div class="td-right">(' + addCommas(data.actual) + ')</div>';
                } else {
                    return '<div class="td-right">' + addCommas(data.actual) + '</div>';
                }
            }}
        ]
    });
}

function render_table(table, data){
    $('#'+table).DataTable({
        "paging":   false,
        "info":     false,
        "ordering": false,
        "data": (data.data),
        "columns": [           
            { "data": null, "width": "55%", render: function (data) {
                if (data.budget_category == "Totals") {
                    return '<div class="td-right text-bold">' + data.budget_category + '</div>';
                } else {
                    return '<div>' + data.budget_category + '</div>';
                }
            }},
            { "data": null, "width": "15%", render: function (data) {
                if (data.budget_category == "Totals") {
                    return '<div class="td-right text-bold">' + addCommas(data.budget_amount) + '</div>';
                } else {
                    return '<div class="td-right">' + addCommas(data.budget_amount) + '</div>';
                }
            }},
            { "data": null, "width": "15%", render: function (data) {
                if (data.budget_category == "Totals") {
                    return '<div class="td-right text-bold">' + addCommas(data.actual) + '</div>';
                } else {
                    return '<div class="td-right">' + addCommas(data.actual) + '</div>';
                }
            }},
            { "data": null, "width": "15%", render: function (data) {
                if (data.budget_category == "Totals") {
                    return '<div class="td-right text-bold">' + addCommas(data.difference) + '</div>';
                } else {
                    return '<div class="td-right">' + addCommas(data.difference) + '</div>';
                }
            }}
        ]  
    });
}
    
function GetData(url, d1, d2) {
    return $.ajax({
        type: "POST",
        url: url + "/" + d1 + "/" + d2,
        dataType: 'json'
    });
}

function addCommas(nStr)
{
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function checkValid(ele) {
    try
    {
        if ($(ele).prop('tagName') == 'TEXTAREA')
        {
            validateTextarea.call(ele);
        }

        if ($(ele).prop('validity').valid)
        {
            var remove = 'invalid';
            var add = 'valid';

            if ($(ele).attr('minlength') && $(ele).attr('minlength') > $(ele).val().length)
            {
                var remove = 'valid';
                var add = 'invalid';
            } else if ($(ele).attr('maxlength') && $(ele).attr('maxlength') < $(ele).val().length)
            {
                var remove = 'valid';
                var add = 'invalid';
            }

            $(ele).removeClass(remove);
            $(ele).addClass(add);
        } else
        {
            $(ele).removeClass('valid');
            $(ele).addClass('invalid');
        }
    } catch (e) {
    }

    if (!$(ele).prop('required') && $(ele).val() == '')
    {
        $(ele).removeClass('valid');
    }

    // trigger validate event
    $(document).trigger('validated');
}

// Restricts input for the set of matched elements to the given inputFilter function.
(function($) {
  $.fn.inputFilter = function(inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
      if (inputFilter(this.value)) {
        this.oldValue = this.value;
        this.oldSelectionStart = this.selectionStart;
        this.oldSelectionEnd = this.selectionEnd;
      } else if (this.hasOwnProperty("oldValue")) {
        this.value = this.oldValue;
        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      } else {
        this.value = "";
      }
    });
  };
}(jQuery));