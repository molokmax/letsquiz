$(document).ready(function() {

    var crud = {
        save: function() {
            var win = $(this).parents('.editorWindow');
            var entityType = win.data('entityType');
            var action = win.data('action');
            var data = {
                entityType: entityType,
                action: action
            };
            win.find(".field").each(function (index) {
                var field = $(this);
                var val = null;
                if (this.type == "checkbox") {
                    val = field.is(":checked");
                } else {
                    val = field.val();
                }
                data[this.name] = val;
            });
            $.ajax({
                url: 'api.php',
                data: data,
                type: 'POST',
                success: function(result) {
                    var res = JSON.parse(result);
                    if (res.success) {
                        location.reload();
                    } else {
                        alert(res.message);
                    }
                },
                error: function(result) {
                    alert(result || 'Server error');
                }
            });
        },
        create: function() {
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            var windowId = $(this).data("target");
            var editorWin = $(windowId);
            editorWin.data('entityType', entityType);
            editorWin.data('action', 'create');
        },
        update: function() {
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            var windowId = $(this).data("target");
            var editorWin = $(windowId);
            editorWin.find(".field").each(function (index) {
                $(this).val(data[this.name]);
            });
            editorWin.data('entityType', entityType);
            editorWin.data('action', 'update');
        },
        delete: function() {
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
                    var res = JSON.parse(result);
                    if (res.success) {
                        location.reload();
                    } else {
                        alert(res.message);
                    }
                },
                error: function(result) {
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

    $('.quiz-datetimepicker').each(function (index) {
        $(this).datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            sideBySide: true
        });
    });

    $('.btn.crud-create').click(crud.create);
    $('.btn.crud-update').click(crud.update);
    $('.btn.crud-delete').click(crud.delete);
    $('.btn.save-button').click(crud.save);
});