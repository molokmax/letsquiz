$(document).ready(function() {

    var crud = {
        save: function() {
            var win = $(this).parents('.editorWindow');
            var form = win.find('form')[0];
            if (form.checkValidity()) {
                var entityType = win.data('entityType');
                var action = win.data('action');
                var data = {
                    entityType: entityType,
                    action: action
                };
                var isFileForm = false;
                win.find(".field").each(function (index) {
                    var field = $(this);
                    var val = null;
                    if (this.type == "checkbox") {
                        val = field.prop("checked"); // field.is(":checked");
                    } else if (this.type == "file") {
                        isFileForm = !!field.val();
                        val = this.files[0];
                    } else {
                        val = field.val();
                    }
                    data[this.name] = val;
                });
                var options = {
                    url: 'api.php',
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
                };
                if (isFileForm) {
                    var fd = new FormData();
                    for (var i in data) {
                        fd.append(i, data[i]);
                    }
                    data = fd;
                    options.cache = false;
                    options.contentType = false;
                    options.processData = false;
                }
                options.data = data;
                $.ajax(options);
            }
        },
        create: function() {
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            var windowId = $(this).data("target");
            var editorWin = $(windowId);
            editorWin.find(".field").each(function (index) {
                if (this.type === 'checkbox') {
                    $(this).prop('checked', false);
                } else if (this.type === 'file') {
                    this.value = "";
                } else {
                    $(this).val("");
                }
            });
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
                if (this.type === 'checkbox') {
                    $(this).prop('checked', data[this.name]);
                } else if (this.type === 'file') {
                    this.value = "";
                } else {
                    $(this).val(data[this.name]);
                }
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