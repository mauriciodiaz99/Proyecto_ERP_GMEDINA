
    id = sessionStorage.getItem("IdPersona");
    $("#MeterId").find("#emp_idd").val(id)


    function Fecha() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        return today = yyyy + '-' + mm + '-' + dd;
    }

    $("#hinc_FechaInicio").attr("min", Fecha());
    $("#hinc_FechaFin").attr("min", Fecha());


    $("#btnGuardar").click(function () {
        debugger
    var data = $("#FormNuevo").serializeArray();
    data = serializar(data);
    if (data != null) {
        data = JSON.stringify({ tbHistorialIncapacidades: data });
        _ajax(data,
            '/HistorialIncapacidades/Create',
            'POST',
            function (obj) {
                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    MsgSuccess("¡Exito!", "Se ha agregado el registro");
                    setTimeout(function () { window.location.href = "Index"; }, 3000);
                } else {
                    MsgError("Error", "Codigo:" + obj + ". contacte al administrador.(Verifique si el registro ya existe)");
                }
            });
    } else {
        MsgError("Error", "por favor llene todas las cajas de texto");
    }
    });

    
    
    _ajax({ ID: parseInt(id) },
            '/HistorialIncapacidades/Detallesempleados/',
            'GET',
            function (obj) {

                if (obj != "-1" && obj != "-2" && obj != "-3") {
                    //$("#ModalDetalles").find("#emp_Id")["0"].innerText = obj.NombreCompleto;
                    $("#llamardata").find("#nombre")["0"].innerText = obj.tbPersonas.per_Nombres;
                    $("#llamardataa").find("#identidad")["0"].innerText = obj.tbPersonas.per_Identidad;
                    //$("#ModalDetalles").find("#hinc_CentroMedico")["0"].innerText = obj.hinc_CentroMedico;

                 
                }
            });

    
