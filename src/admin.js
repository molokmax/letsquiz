window.QUIZ_SETTINGS = {};

$(document).ready(function() {

    var crud = {
        correctValue(entityType, fieldName, fieldValue, data, action) {
            if (entityType === 'GAME' && action === 'create' && fieldName === 'price' && !fieldValue) {
                return window.QUIZ_SETTINGS.DEFAULT_GAME_PRICE;
            } else {
                return fieldValue;
            }
        },
        buildReportParams(entityType, data, action) {
            if (entityType === 'GAME') {
                return 'entityType=REGISTRATION&game_id=' + data['id']
            } else {
                return 'entityType=' + entityType;
            }
        },
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
            var action = 'create';
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
                    var val = crud.correctValue(entityType, this.name, "", data, action);
                    $(this).val(val);
                }
            });
            editorWin.data('entityType', entityType);
            editorWin.data('action', action);
        },
        update: function() {
            var action = 'update';
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
                    var val = crud.correctValue(entityType, this.name, data[this.name], data, action);
                    $(this).val(val);
                }
            });
            editorWin.data('entityType', entityType);
            editorWin.data('action', action);
        },
        delete: function() {
            var action = 'update';
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            data['entityType'] = entityType;
            data['action'] = action;
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
        report: function() {
            var action = 'report';
            var entityContainer = $(this).parents('.container');
            var entityType = entityContainer.data('entity-type');
            var recordElement = $(this).parents('tr.record');
            var data = crud.getData(recordElement);
            var url = 'report.php?' + crud.buildReportParams(entityType, data, action);
            var winId = window.open(url, "_blank");
            if (!winId) {
                alert('Please allow popups for this website');
            }
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

    // $('.quiz-datetimepicker input').each(function (index) {
    //     $(this).datetimepicker({
    //         format:'Y-m-d H:i',
    //         lang:'ru'
    //     });
    // });

    $('.btn.crud-create').click(crud.create);
    $('.btn.crud-update').click(crud.update);
    $('.btn.crud-delete').click(crud.delete);
    $('.btn.save-button').click(crud.save);
    $('.btn.crud-report').click(crud.report);
});