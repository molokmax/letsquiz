$(document).ready(function() {

    var crud = {
        create: function() {
            debugger;
        },
        update: function() {
            debugger;
        },
        delete: function() {
            debugger;
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr');
            //var id = recordElement.data('record-id');
            var data = crud.getData(recordElement);
            data['entityType'] = entityType;
            data['action'] = 'delete';
            $.ajax({
                url: 'api.php',
                data: data,
                type: 'POST',
                success: function(result) {
                    // Do something with the result
                    debugger;
                },
                error: function(result) {
                    debugger;
                }
            });
        },
        getData: function(element) {
            var data = element.data();
            var result = {};
            for (item in data) {
                var field = item.substring(6).toLowerCase();
                result[field] = data[item];
            }
            return result;
        }
    };

    $('.btn.crud-create').click(crud.create);
    $('.btn.crud-update').click(crud.update);
    $('.btn.crud-delete').click(crud.delete);
});