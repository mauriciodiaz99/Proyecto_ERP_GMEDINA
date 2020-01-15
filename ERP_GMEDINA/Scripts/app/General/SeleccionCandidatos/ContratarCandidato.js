$(document).ready(function () {


    $("#Candidato").val(sessionStorage.getItem("per_Descripcion"));
    llenarDropDownList()
});

function llenarDropDownList() {


    _ajax(null,
       '/SeleccionCandidatos/llenarDropDowlistTipoMonedas',
       'POST',
       function (result) {
           debugger
           $.each(result, function (id, Lista) {

               Lista.forEach(function (value, index) {
                   debugger
                   var x = document.getElementById("tmon_Id");
                   var option = document.createElement("option");
                   option.text = value.Descripcion;
                   option.value = value.Id;
                   x.add(option);
               });
           });
       });

    _ajax(null,
   '/SeleccionCandidatos/llenarDropDowlistRequisicion',
   'POST',
   function (result) {
       debugger
       $.each(result, function (id, Lista) {
           Lista.forEach(function (value, index) {
               var x = document.getElementById("req_Id");
               var option = document.createElement("option");
               option.text = value.Descripcion;
               option.value = value.Id;
               x.add(option);
           });
       });
   });
}

$("#btnCrear").click(function () {
    //declaramos el objeto principal de nuestra tabla y asignamos sus valores
    var tbEmpleados =
        {
            per_id:     sessionStorage.getItem("per_Id"),
            car_Id:     document.getElementById("car_Id").value,
            area_Id:    document.getElementById("area_Id").value,
            depto_Id:   document.getElementById("depto_Id").value,
            jor_Id:     document.getElementById("jor_Id").value,
            cpla_IdPlanilla: document.getElementById("cpla_IdPlanilla").value,
            fpa_IdFormaPago: document.getElementById("fpa_IdFormaPago").value,
            emp_CuentaBancaria: $("#emp_CuentaBancaria").val(),
            emp_Fechaingreso: $("#emp_Fechaingreso").val(),
        };

    var tbSuelos =
        {
            suc_Cantidad: $("#sue_Cantidad").val(),
            tam_Id: document.getElementById("tam_Id").value,
            tbCargos: { car_Descripcion: $("#car_Descripcion").val() },
        };
    var tbRequisiciones =
        {
            suc_Id: $("#Sucursales").val(),
            area_Descripcion: $("#area_Descripcion").val(),
            tbCargos: { car_Descripcion: $("#car_Descripcion").val() },
        };

    if (tbAreas != null) {
        data = JSON.stringify({
            tbAreas: tbAreas,
            tbDepartamentos: lista
        });
        _ajax(data,
            '/Areas/Create',
            'POST',
            function (obj) {
                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    //LimpiarControles(["habi_Descripcion", "habi_RazonInactivo"]);
                    MsgSuccess("¡Exito!", "Se ah agregado el registro");
                    ChildTable.clear().draw();
                    $("#FormAreas").find("#suc_Id option[value='0']").attr("selected", true);
                    $("#FormAreas").find("#area_Descripcion").val("");
                    $("#FormAreas").find("#car_Descripcion").val("");
                } else {
                    MsgError("Error", "Codigo:" + obj + ". contacte al administrador.(Verifique si el registro ya existe)");
                }
            });
    } else {
        MsgError("Error", "por favor llene todas las cajas de texto");
    }
});

$("#btnContratar").click(function () {
    var data = $("#FormContratar").serializeArray();
    data = serializar(data);

    if (data != null) {
        data = JSON.stringify({ tbEmpleados: data });
        _ajax(data,
            '/SeleccionCandidatos/Contratar',
            'POST',
            function (obj) {
                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    $("#ModalContratar").modal('hide');//ocultamos el modal
                    $('body').removeClass('modal-open');//eliminamos la clase del body para poder hacer scroll
                    $('.modal-backdrop').remove();//eliminamos el backdrop del modal 
                    llenarTabla();
                    LimpiarControles(["emp_FechaInreso", "emp_CuentaBancaria"]);
                    MsgSuccess("¡Éxito!", "Se ha guardado el cambio");
                } else {

                    MsgError("Error", "Codigo:" + obj + ". contacte al administrador.");
                }
            });
    } else {
        MsgError("Error", "por favor llene todas las cajas de texto");
    }
});

