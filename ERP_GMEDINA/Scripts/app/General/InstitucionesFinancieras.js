﻿const btnAgregar = $('#btnAgregarInstFin'),
    DescInstFin = $('#insf_DescInstitucionFinanc'),
    Contac = $('#insf_Contacto'),
    Telef = $('#phone'),
    Corre = $('#insf_Correo'),
    AsteriscoDescripcion = $('#AsteriscoDescripcion'),
    AsteriscoContacto = $('#AsteriscoContacto'),
    AsteriscoTelefono = $('#AsteriscoTelefono'),
    AsteriscoCorreo = $('#AsteriscoCorreo'),
    validacionDescripcion = $('#validacionDescripcion'),
    validacionContacto = $('#validacionContacto'),
    validacionTelefono = $('#validacionTelefono'),
    validacionCorreo = $('#validacionCorreo'),
    validatel = $('#validatel')
;

function Validaciones(
    DescInstFin,
    Contac,
    Telef,
    Corre) {
    debugger;
    var ExpregPhone = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/);
    var ExpregEmail = new RegExp(/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/);
    var todoBien = true;

    // Descripción Institución Financiera
    if (DescInstFin.val() != '') {
        AsteriscoDescripcion.removeClass('text-danger');
        validacionDescripcion.hide();
    } else {
        AsteriscoDescripcion.addClass('text-danger');
        validacionDescripcion.show();
        todoBien = false;
    }

    // Contacto
    if (Contac.val() != '') {
        AsteriscoContacto.removeClass('text-danger');
        validacionContacto.hide();
        validatel.hide();
    } else {
        AsteriscoContacto.addClass('text-danger');
        validacionContacto.show();
        todoBien = false;
    }

    // Telefono
    if (Telef.val() != '' && ExpregPhone.test(Telef.val())) {
        AsteriscoTelefono.removeClass('text-danger');
        validacionTelefono.hide();
    } else {
        AsteriscoTelefono.addClass('text-danger');
        validacionTelefono.show();
        todoBien = false;
    }

    // Correo
    if (Corre.val() != '' && ExpregEmail.test(Corre.val())) {
        AsteriscoCorreo.removeClass('text-danger');
        validacionCorreo.hide();
    } else {
        AsteriscoCorreo.addClass('text-danger');
        validacionCorreo.show();
        todoBien = false;
    }

    return todoBien;
}

//////////////////////////////////////////////////////////////////
const btnEditar = $('#btnEditarInstFin');
const btnEditarConfirmar = $('#btnModalActualizarINFS'),
    DescripInstFin = $('#insf_DescInstitucionFinanc'),
    Contact = $('#insf_Contacto'),
    Tel = $('#phone'),
    Cor = $('#insf_Correo'),
    AsteriscDescrip = $('#AsteriscDescrip'),
    AsteriscContact = $('#AsteriscContact'),
    AsteriscTel = $('#AsteriscTel'),
    AsteriscCorre = $('#AsteriscCorre'),
    validaDescripcion = $('#validaDescripcion'),
    validaContacto = $('#validaContacto'),
    validaTelefono = $('#validaTelefono'),
    validaCorreo = $('#validaCorreo')
;

function Validacion(
    DescripInstFin,
    Contact,
    Tel,
    Cor) {

        var ExprPhone = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/);
        var ExprEmail = new RegExp(/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/);
    var todoBien = true;

    // Descripción Institución Financiera
    if (DescripInstFin.val() != '') {
        AsteriscDescrip.removeClass('text-danger');
        validaDescripcion.hide();
    } else {
        AsteriscDescrip.addClass('text-danger');
        validaDescripcion.show();
        todoBien = false;
    }

    // Contacto
    if (Contact.val() != '') {
        AsteriscContact.removeClass('text-danger');
        validaContacto.hide();
    } else {
        AsteriscContact.addClass('text-danger');
        validaContacto.show();
        todoBien = false;
    }

    // Telefono
    if (Tel.val() != '' && ExprPhone.test(Tel.val())) {
        validaTelefono.hide();
        AsteriscTel.removeClass('text-danger');
    } else {
        AsteriscTel.addClass('text-danger');
        validaTelefono.show();
        todoBien = false;
    }

    // Correo
    if (Cor.val() != '' && ExprEmail.test(Cor.val())) {
        AsteriscCorre.removeClass('text-danger');
        validaCorreo.hide();
    } else {
        AsteriscCorre.addClass('text-danger');
        validaCorreo.show();
        todoBien = false;
    }
    return todoBien;
}


//FUNCION GENERICA PARA REUTILIZAR AJAX
function _ajax(params, uri, type, callback) {
    $.ajax({
        url: uri,
        type: type,
        data: { params },
        success: function (data) {
            callback(data);
        }
    });
}

// REGION DE VARIABLES
var EliminarID = 0;
//var registroID = 0;
var esAdministrador = $("#rol_Usuario").val();
//Funcion para refrescar la tabla (Index)
function cargarGridINFS() {
    //    var esAdministrador = $("#rol_Usuario").val();
    //    cons.log("Hola: " +esAdministrador);
    _ajax(null,
        '/InstitucionesFinancieras/GetData',
        'GET',
        (data) => {
            if (data.length == 0) {
                //Validar si se genera un error al cargar de nuevo el grid
                iziToast.error({
                    title: 'Error',
                    message: 'No se pudo cargar la información, contacte al administrador',
                });
            }
            //GUARDAR EN UNA VARIABLE LA DATA OBTENIDA
            var ListaINFS = data;
            //LIMPIAR LA DATA DEL DATATABLE
            $('#IndexTable').DataTable().clear();
            //RECORRER DATA OBETINA Y CREAR UN "TEMPLATE" PARA REFRESCAR EL TBODY DE LA TABLA DEL INDEX
            for (var i = 0; i < ListaINFS.length; i++) {
                //variable para verificar el estado del registro
                var estadoRegistro = ListaINFS[i].insf_Activo == false ? 'Inactivo' : 'Activo';
                //variable boton detalles
                var botonDetalles = ListaINFS[i].insf_Activo == true ? '<a href="InstitucionesFinancieras/Details?id=' + ListaINFS[i].insf_IdInstitucionFinanciera + '" data-id = "' + ListaINFS[i].insf_IdInstitucionFinanciera + '" class="btn btn-primary btn-xs">Detalles</a>' : '';
                //variable boton editar
                var botonEditar = ListaINFS[i].insf_Activo == true ? '<a href="InstitucionesFinancieras/Edit?id=' + ListaINFS[i].insf_IdInstitucionFinanciera + '" data-id = "' + ListaINFS[i].insf_IdInstitucionFinanciera + '" style="margin-left:3px;"  class="btn btn-default btn-xs">Editar</a>' : '';
                //variable donde está el boton activar
                var botonInactivar = ListaINFS[i].insf_Activo == true ? esAdministrador == "1" ? '<button data-id = "' + ListaINFS[i].insf_IdInstitucionFinanciera + '" type="button" class="btn btn-danger btn-xs"  id="btnModalInactivarINFS">Inactivar</button>' : '' : '';
                //variable donde está el boton activar
                var botonActivar = ListaINFS[i].insf_Activo == false ? esAdministrador == "1" ? '<button data-id = "' + ListaINFS[i].insf_IdInstitucionFinanciera + '" type="button" class="btn btn-primary btn-xs"  id="btnModalActivarINFS">Activar</button>' : '' : '';

                $('#IndexTable').dataTable().fnAddData([
                ListaINFS[i].insf_IdInstitucionFinanciera,
                ListaINFS[i].insf_DescInstitucionFinanc,
                ListaINFS[i].insf_Contacto,
                ListaINFS[i].insf_Telefono,
                ListaINFS[i].insf_Correo,
                estadoRegistro,
                botonDetalles + botonEditar + botonInactivar + botonActivar
                ]);
            }
        });
}


//FUNCION: Opciones de validacion
$('#btnCargarPlanilla').click(function ()
{
//------------------------------------------------------------------------------------------------------
    //ENVIAR DATA AL SERVIDOR PARA EJECUTAR LA INSERCIÓN
        $.ajax({
            url: "/InstitucionesFinancieras/_CargaDocumento",
            method: "POST",
            data: data
        }).done(function (data)
        {
            //VALIDAR RESPUESTA OBETNIDA DEL SERVIDOR, SI LA INSERCIÓN FUE EXITOSA O HUBO ALGÚN ERROR

            if (data.Data == "error")
            {
               // $("#frmCrearAuxCes").modal('hide');
                iziToast.error({
                    title: 'Error',
                    message: 'Error: Revise la configuracion, en caso de continuar el error, contacte al administrador',
                });
            }
            else
            {
                $("#frmOpcionesINFS").modal({ backdrop: 'static', keyboard: false });
            }
        });
});


//Crear Institución Financiera ya validado
$(btnAgregar).click(function () {
    if (Validaciones(
    DescInstFin,
    Contac,
    Telef,
    Corre
    )) {
        debugger;
        var data = $("#frmCreateInstFin").serializeArray();
        //ENVIAR DATA AL SERVIDOR PARA EJECUTAR LA INSERCIÓN
        $.ajax({
            url: "/InstitucionesFinancieras/Create",
            method: "POST",
            data: data
        }).done(function (data) {

            //VALIDAR RESPUESTA OBTENIDA DEL SERVIDOR, SI LA INSERCIÓN FUE EXITOSA O HUBO ALGÚN ERROR
            if (data != "error") {
                document.getElementById("btnAgregarInstFin").disabled = true;
                window.location.href = '/InstitucionesFinancieras/Index';
                // Mensaje de exito cuando un registro se ha guardado bien
                iziToast.success({
                    title: 'Exito',
                    message: '¡El registro se agregó de forma exitosa!',
                });
            }
            else {
                iziToast.error({
                    title: 'Error',
                    message: '¡No se guardó el registro, contacte al administrador!',
                });
            }
        });

    }
    // Evitar PostBack en los Formularios de las Vistas Parciales de Modal
    $("#frmCreateInstFin").submit(function (e) {
        return false;
    });
    document.getElementById("btnAgregarInstFin").disabled = false;
});



//Editar Institución Financiera ya validado
$(btnEditarConfirmar).click(function () {

    if (Validacion(
    DescripInstFin,
    Contact,
    Tel,
    Cor
    )) {
        $("#frmActualizarINFS").modal({ backdrop: 'static', keyboard: false });
       }

    // Evitar PostBack en los Formularios de las Vistas Parciales de Modal
    $("#frmEditInstFin").submit(function (e) {
        return false;
    });

});

$(btnEditar).click(function () {

    var data = $("#frmEditInstFin").serializeArray();
        //ENVIAR DATA AL SERVIDOR PARA EJECUTAR LA INSERCIÓN
        $.ajax({
            url: "/InstitucionesFinancieras/Edit",
            method: "POST",
            data: data
        }).done(function (data) {

            //VALIDAR RESPUESTA OBTENIDA DEL SERVIDOR, SI LA INSERCIÓN FUE EXITOSA O HUBO ALGÚN ERROR
            if (data != "error") {
                document.getElementById("btnEditarInstFin").disabled = true;
                window.location.href = '/InstitucionesFinancieras/Index';
                // Mensaje de exito cuando un registro se ha guardado bien
                iziToast.success({
                    title: 'Exito',
                    message: '¡El registro se agregó de forma exitosa!',
                });
            }
            else {
                iziToast.error({
                    title: 'Error',
                    message: '¡No se guardó el registro, contacte al administrador!',
                });
            }
        });

    // Evitar PostBack en los Formularios de las Vistas Parciales de Modal
        $("#frmEditInstFin").submit(function (e) {
            return false;
        });
        document.getElementById("btnEditarInstFin").disabled = false;
});




var ID_in = 0;
// INACTIVAR 
$(document).on("click", "#btnModalInactivarINFS", function () {
    ID_in = $(this).data('id');
    document.getElementById("btnInactivarINFS").disabled = false;
    $("#frmInactivarINFS").modal({ backdrop: 'static', keyboard: false });
});

$("#btnInactivarINFS").click(function () {
    //SERIALIZAR EL FORMULARIO (QUE ESTÁ EN LA VISTA PARCIAL) DEL MODAL, SE PARSEA A FORMATO JSON
    //SE ENVIA EL JSON AL SERVIDOR PARA EJECUTAR LA INACTIVACIóN
    document.getElementById("btnInactivarINFS").disabled = true;
    $.ajax({
        url: "/InstitucionesFinancieras/Inactivar/" + ID_in,
        method: "POST"
    }).done(function (data) {
        if (data == "error") {
            //Cuando traiga un error del backend al guardar la edicion
            iziToast.error({
                title: 'Error',
                message: 'No se logró inactivar el registro, contacte al administrador',
            });
        }
        else {
            $("#frmInactivarINFS").modal('hide');
            cargarGridINFS();
            //Mensaje de exito de la inactivación
            iziToast.success({
                title: 'Exito',
                message: 'El registro se inactivó de forma exitosa!',
            });
        }
    });
    ID_in = 0;
    // $("#frmInactivarINFS").modal('hide');
});


// Activar
var activarID = 0;
$(document).on("click", "#btnModalActivarINFS", function () {
    activarID = $(this).data('id');
    document.getElementById("btnActivarINFS").disabled = false;
    $("#frmActivarINFS").modal({ backdrop: 'static', keyboard: false });
});

//activar ejecutar
$("#btnActivarINFS").click(function () {
    document.getElementById("btnActivarINFS").disabled = true;
    $.ajax({
        url: "/InstitucionesFinancieras/Activar/" + activarID,
        method: "POST",
        data: { id: activarID }
    }).done(function (data) {
        if (data == "error") {
            iziToast.error({
                title: 'Error',
                message: 'No se logró activar el registro, contacte al administrador',
            });
        }
        else {
            cargarGridINFS();
            $("#frmActivarINFS").modal('hide');
            //Mensaje de exito de la activación
            iziToast.success({
                title: 'Éxito',
                message: '¡El registro se Activó de forma exitosa!',
            });
        }
    });
    activarID = 0;
    //$("#frmActivarINFS").modal('hide');
});
