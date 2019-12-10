﻿
function llenarTabla() {
    _ajax(null,
       '/HistorialHorasTrabajadas/llenarTabla',
       'POST',
       function (Lista) {
           tabla.clear();
           tabla.draw();
           $.each(Lista, function (index, value) {
               tabla.row.add({
                   Id: value.htra_Id,
                   Colaborador: value.Colaborador.length == 0 ? 'Sin Asignar' : value.Colaborador[0],
                   Jornada: value.jor_Descripcion,
                   Recargo: value.tiho_Recargo,
                   Descripcion: value.tiho_Descripcion
               });
           });
           tabla.draw();
       });
}
$(document).ready(function () {
    llenarTabla();
});

$('#IndexTable tbody').on('click', 'td.details-control', function () {
    var tr = $(this).closest('tr');
    var row = tabla.row(tr);

    if (row.child.isShown()) {
        row.child.hide();
        tr.removeClass('shown');
    }
    else {
        id = row.data().Id;
        hola = row.data().hola;
        _ajax({ id: parseInt(id) },
            '/HistorialHorasTrabajadas/ChildRowData',
            'GET',
            function (obj) {
                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    row.child(format(obj)).show();
                    tr.addClass('shown');
                }
            });
    }

});