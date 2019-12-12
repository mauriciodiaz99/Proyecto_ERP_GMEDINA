﻿var ChildTable = null;
var list = [];
var inactivar = [];
var dRow = null;
function Remove(Id, lista) {
    var list = [];
    lista.forEach(function (value, index) {
        if (value.Id != Id) {
            list.push(value);
        }
    });
    return list;
}
function Add(depto_Descripcion, car_Descripcion) {
    var info = ChildTable.rows().data();
    if (depto_Descripcion.trim().length != 0 && car_Descripcion.trim().length != 0) {
        for (var i = 0; i < ChildTable.data().length; i++) {
            var Fila = info[i];
            if (Fila.Descripcion == depto_Descripcion || Fila.Cargo == car_Descripcion) {
                if (Fila.Cargo == car_Descripcion) {
                    var span = $("#FormDepartamentos").find("#errorcar_Descripcion");
                    $(span).addClass("text-warning");
                    $(span).closest("div").addClass("has-warning");
                    span.text('El cargo "' + car_Descripcion + '" ya existe');
                    $("#FormDepartamentos").find("#car_Descripcion").focus();
                }
                if (Fila.Descripcion == depto_Descripcion) {
                    var span = $("#FormDepartamentos").find("#errordepto_Descripcion");
                    $(span).addClass("text-warning");
                    $(span).closest("div").addClass("has-warning");
                    span.text('La Descripcion "' + depto_Descripcion + '" ya existe');
                    $("#FormDepartamentos").find("#depto_Descripcion").focus();
                }
                return null;
            }
        }
        ChildTable.row.add(
            {
                Descripcion: depto_Descripcion.trim(),
                Cargo: car_Descripcion,
                Acciones: '<div>' +
                            '<input type="button" class="btn btn-danger btn-xs" onclick="Remover(this)" value="Remover" />' +
                        '</div>',
                Accion:'i'
            }
            ).draw();
    } else {
        if (car_Descripcion.trim().length == 0) {
            var txt_required = $("#FormDepartamentos").find("#car_Descripcion").data("val-required");
            var span = $("#FormDepartamentos").find("#errorcar_Descripcion");
            $(span).addClass("text-danger");
            $(span).closest("div").addClass("has-error");
            span.text(txt_required);
            $("#FormDepartamentos").find("#car_Descripcion").focus();
        }
        if (depto_Descripcion.trim().length == 0) {
            var txt_required = $("#FormDepartamentos").find("#depto_Descripcion").data("val-required");
            var span = $("#FormDepartamentos").find("#errordepto_Descripcion");
            $(span).addClass("text-danger");
            $(span).closest("div").addClass("has-error");
            span.text(txt_required);
            $("#FormDepartamentos").find("#depto_Descripcion").focus();
        }
    }
}
function getJson() {
    //declaramos una lista para recuperar en un formato 
    //especifico el json de datatable.
    list = new Array();
    //declaramos el objeto que ira dentro de la vista    
    var info=ChildTable.rows().data();
    for (var i = 0; i < ChildTable.data().length; i++) {
        var fila = info[i];
        var tbDepartamentos =
         {
             Id: i,
             depto_Descripcion: fila.Descripcion,
             car_Descripcion: fila.Cargo,
             Accion: fila.Accion
         };
        list.push(tbDepartamentos);
    }
    return list;
}
function Remover(btn) {
    var tr = $(btn).closest('tr');
    var row = ChildTable.row(tr);
    var id = row.data().Id;
    if (id != undefined) {
        inactivar.push(id);
    } 
    ChildTable
            .row($(btn).parents('tr'))
            .remove()
            .draw();
}
function Edit(btn) {
    var tr = $(btn).closest('tr');
    var row = ChildTable.row(tr);
    var datos=row.data();
    dRow = row;
    $('#ModalEditar').find("#depto_Descripcion").val(datos.Descripcion);
    $('#ModalEditar').find("#car_Descripcion").val(datos.Cargo);

    $('#ModalEditar').modal('toggle');
    $('#ModalEditar').modal('show');
    $('#ModalEditar').modal('hide');
}
function llenarChild() {
    _ajax(JSON.stringify({ id: area_Id }),
        '/Areas/cargarChild',
        'POST',
        function (data) {
            data.forEach(function (valor,indice) {
                ChildTable.row.add(
                    {
                        Id:valor.car_Id,
                        Descripcion: valor.depto_Descripcion,
                        Cargo: valor.car_Descripcion,
                    });
            });
            ChildTable.draw();
        });    
}
$(document).ready(function () {
    ChildTable = $(ChildDataTable).DataTable({
        pageLength: 3,
        lengthChange: false,
        columns:
         [
               { data: 'Descripcion' },
               { data: 'Cargo' },
               {
                   data: 'Acciones',
                   defaultContent: '<div>' +
                                          '<input type="button" class="btn btn-white btn-xs" onclick="Edit(this)" value="Editar" />'+
                                          '<input type="button" class="btn btn-danger btn-xs" onclick="Remover(this)" value="Remover" />' +
                                      '</div>'
               }
         ],
        order: [[0, 'asc']]
    });
    llenarChild();
});
$("#add").click(function () {
    var depto_Descripcion = $("#FormDepartamentos").find("#depto_Descripcion").data("val-maxlength-max");
    var car_Descripcion = $("#FormDepartamentos").find("#car_Descripcion").data("val-maxlength-max");
    var Descripcion = $("#FormDepartamentos").find("#depto_Descripcion").val();
    var Cargo = $("#FormDepartamentos").find("#car_Descripcion").val();
    if (Descripcion.length > depto_Descripcion || Cargo.length > car_Descripcion) {
        MsgError("Error", "una caja de texto tiene muchos caracteres");
        return null;
    }
    var valores = Descripcion + Cargo;
    for (var i = 0; i < valores.length; i++) {
        if (valores[i] == ">" || valores[i] == "<") {
            MsgError("Error", "La cadena de entrada contiene caracteres no permitidos.('>' ó '<')");
            return null;
        }
    }
    Add(Descripcion, Cargo);
});
$("#FormCreate").submit(function (e) {
    e.preventDefault();
});
$("#btnCrear").click(function () {
    //declaramos el objeto principal de nuestra tabla y asignamos sus valores
    var tbAreas =
        {
            suc_Id: $("#Sucursales").val(),
            area_Descripcion: $("#area_Descripcion").val(),
            car_Descripcion: $("#car_Descripcion").val(),
        };
    var lista = getJson();

    if (tbAreas != null) {
        data = JSON.stringify({
            cAreas: tbAreas,
            Departamentos: lista,
            inactivar: inactivar
        });
        _ajax(data,
            '/Areas/Edit',
            'POST',
            function (obj) {
                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    //LimpiarControles(["habi_Descripcion", "habi_RazonInactivo"]);
                    MsgSuccess("¡Exito!", "Se ah agregado el registro");
                } else {
                    MsgError("Error", "Codigo:" + obj + ". contacte al administrador.(Verifique si el registro ya existe)");
                }
            });
    } else {
        MsgError("Error", "por favor llene todas las cajas de texto");
    }
});
$("#FormDepartamentos").find("#depto_Descripcion").keypress(function (envet) {
    if (alerta($(this).closest("div"))) {
        return null;
    }
    var id = $(this).attr("id");
    var form = $(this).closest("form");
    limpiarSpan(id, form);
});
$("#FormDepartamentos").find("#car_Descripcion").keypress(function (envet) {
    if (alerta($(this).closest("div"))) {
        return null;
    }
    var id = $(this).attr("id");
    var form = $(this).closest("form");
    limpiarSpan(id, form);
});

$("#ModalEditar").find("#btnActualizar").on("click", function () {
    var depto =
        {
            Id:dRow.data().Id,
            Descripcion: $('#ModalEditar').find("#depto_Descripcion").val(),
            Cargo:$('#ModalEditar').find("#car_Descripcion").val(),
            Accion:'e'
        }
    
    dRow = null;
});
$("#ModalInhabilitar").find("#InActivar").on("click", function () {

});
function limpiarSpan(id, form) {
    var span = $(form).find("#error" + id);
    $(span).closest("div").removeClass("has-error has-warning");
    $(span).removeClass("text-danger text-warning");
    $(form).find("#error" + id).text("");
}
function alerta(div) {
    var val_maxlength = $(div).find("input").data("val-maxlength-max");
    if ($(div).find("input").val().trim().length >= val_maxlength) {
        var txt_maxlength = $(div).find("input").data("val-maxlength");
        var span = $(div).find("span");
        $(span).addClass("text-warning");
        $(span).closest("div").addClass("has-warning");
        span.text(txt_maxlength);
        event.preventDefault();
        return true;
    }
    return false;
}