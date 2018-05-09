$(document).ready(function() {

    var crud = {
        save: function() {
            debugger;
            var win = $(this).parents('.editorWindow');
            var entityType = win.data('entityType');
            var action = win.data('action');
        },
        create: function() {
            debugger;
        },
        update: function() {
            debugger;
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            var windowId = $(this).data("target");
            var editorWin = $(windowId);
            var fields = editorWin.find(".field").each(function (index) {
                $(this).val(data[this.name]);
            });
            editorWin.data('entityType', entityType);
            editorWin.data('action', 'update');
            //data['entityType'] = entityType;
            //data['action'] = 'update';
        },
        delete: function() {
            //debugger;
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            data['entityType'] = entityType;
            data['action'] = 'delete';
            $.ajax({
                url: 'api.php',
                data: data,
                type: 'POST',
                success: function(result) {
                    //debugger;
                    var res = JSON.parse(result);
                    if (res.success) {
                        location.reload();
                    } else {
                        alert(res.message);
                    }
                },
                error: function(result) {
                    //debugger;
                    alert(result || 'Server error');
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
    $('.btn.save-button').click(crud.save);
});