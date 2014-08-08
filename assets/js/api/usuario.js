var SLIDER = null;

$(function() {

    //  Eventos de Botones
    $(".btnSearch").click(function() {
        getSearch();
    });
    $("#txtSearch").keypress(function(e) {
        if (e.which == 13) {
            getSearch();
        }
    });
    $(".btnAdd").click(function() {
        SLIDER.next();
    });
    $("#btnDeleteModal").click(function() {
        deleteRow($(this).attr("attr-id"));
    });
    $("#btnGuardar").click(function() {
        save();
    });
    $("#btnCancelar").click(function() {
        clearData();
        SLIDER.prev();
    });

    // Slider
    $("#slider").owlCarousel({
        navigation: false,
        slideSpeed: 500,
        paginationSpeed: 400,
        singleItem: true,
        mouseDrag: false,
        touchDrag: false
    });
    SLIDER = $("#slider").data('owlCarousel')

    // Init data
    getSearch();
});

/**
 * Replace All Function
 */
String.prototype.replaceAll = function(find, replace) {
    return this.replace(new RegExp(find, 'g'), replace);
}

/**
 * Arma la tabla del catalogo
 */
function setRowTable(pagina, data) {
    // Template Row
    var tmpRows = "";
    var templateR = "";
    var template = "<tr><td class='idRow'>INDEX</td>" +
            "<td><a class='editRow' attr-id='ID'>NOMBRE<a></td>" +
            "<td >APE</td>" +
            "<td>USUARIO</td>" +
            "<td>CORREO</td>" +
            "<td>PUESTO</td>" +
            "<td width='80' align='center'>NOTIFICACIONES</td>" +
            "<td width='80'>" +
            "<a href='#' attr-id='ID' attr-name='NOMBRE' title='Eliminar' class='btn btn-danger btn-xs btnDelete' style='margin-left: 20px;'" +
            " data-toggle='modal' data-target='.modal-delete'><i class='fam-delete'></i></a>" +
            "</td></tr>";

    // Recorrer elementos
    for (i = 0; i < data.length; i++) {
        templateR = template;
        templateR = templateR.replace("INDEX", (i + 1 + ((pagina - 1) * 10)));
        templateR = templateR.replaceAll("ID", data[i].admin_id);
        templateR = templateR.replaceAll("NOMBRE", data[i].nombre);
        templateR = templateR.replaceAll("APE", data[i].apellido);
        templateR = templateR.replace("USUARIO", data[i].username);
        templateR = templateR.replace("CORREO", data[i].email);
        templateR = templateR.replace("PUESTO", data[i].puesto);
        if(data[i].recibe_notificacion == '1'){
            templateR = templateR.replace("NOTIFICACIONES", "SI");
        }else{
            templateR = templateR.replace("NOTIFICACIONES", "NO");
        }
        tmpRows += templateR;
    }
    $("#bodyTable").html(tmpRows);

    // Eventos de los botones
    $(".editRow").click(function() {
        SLIDER.next();
        consultar($(this).attr("attr-id"));
    });
    $(".btnDelete").click(function() {
        $("#delNombre").html($(this).attr("attr-name"));
        $("#btnDeleteModal").attr("attr-id", $(this).attr("attr-id"));
    });

    clearData();
}

/**
 * Arma el paginador
 */
function setPaginator(pagina, total) {
    // set 
    var pag = "";
    total = parseInt(total);
    pagina = parseInt(pagina);
    if (total > 10) {
        total = parseInt(total / 10) + 1;
        for (i = 1; i <= total; i++) {
            if (i == pagina) {
                pag += "<li class='active'><a>" + i + "</a></li>";
            } else {
                pag += "<li class='btnPagina'><a>" + i + "</a></li>";
            }
        }
    }
    $(".pagination").html(pag);
    $(".btnPagina").click(function() {
        getSearch($($(this).children()).html());
    });
}

/**
 * Limpiar el formulario del catalogo
 */
function clearData() {
    $("#hideID").val('0');
    $("#txtNombre").val('');
    $("#txtApellido").val('');
    $("#txtUsuario").val('');
    $("#txtContr").val('');
    $("#txtCorreo").val('');
    $("#txtPuesto").val('');
    $("#checkNotif").prop('checked', false);
    $(".bg-danger").hide();
}

/**
 * Limpiar el formulario del catalogo
 */
function validateForm() {
    if ($("#txtNombre").val() == '' ||
            $("#txtApellido").val() == '' ||
            $("#txtUsuario").val() == '' ||
            $("#txtContr").val() == '' ||
            $("#txtCorreo").val() == '' ||
            $("#txtPuesto").val() == '' ) {
        $(".bg-danger").show("slow");
        return false;
    }
    if(!validateEmail($("#txtCorreo").val())){
        $(".bg-danger2").show("slow");
        return false;
    }
    return true;
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 

/**
 * Obtiene el registro seleccionado
 */
function consultar(idRow) {
    //console.log(idRow);
    $.ajax({
        type: "POST",
        url: "usuario/get",
        dataType: 'json',
        data: {
            id: idRow
        },
        success: function(data) {
            //console.log(data[0].recibe_notificacion);
            $("#hideID").val(data[0].admin_id);
            $("#txtNombre").val(data[0].nombre);
            $("#txtApellido").val(data[0].apellido);
            $("#txtUsuario").val(data[0].username);
            $("#txtContr").val(data[0].password);
            $("#txtCorreo").val(data[0].email);
            $("#txtPuesto").val(data[0].puesto);
            if(data[0].recibe_notificacion == "1"){
                $('#checkNotif').prop('checked', true);
            }else{
                $('#checkNotif').prop('checked', false);
            }
            
        }
    });
}

/**
 * Obtiene el registro seleccionado
 */
function deleteRow(idRow) {
    //console.log(idRow);
    $.ajax({
        type: "POST",
        url: "usuario/delete",
        dataType: 'json',
        data: {
            id: idRow
        },
        success: function(data) {
            reloadSearch();
        }
    });
}


/**
 * Guarda el registro
 */
function save() {
    if (validateForm()) {
        var recibe_notificacion = 0;
        if($('#checkNotif').is(':checked')){
            recibe_notificacion = 1;
        }
        //console.log(recibe_notificacion);
        //console.log($("#hideID").val());
        $.ajax({
            type: "POST",
            url: "usuario/save",
            dataType: 'json',
            data: {
                admin_id: $("#hideID").val(),
                nombre: $("#txtNombre").val(),
                apellido: $("#txtApellido").val(),
                username: $("#txtUsuario").val(),
                password: $("#txtContr").val(),
                email: $("#txtCorreo").val(),
                puesto: $("#txtPuesto").val(),
                recibe_notificacion : recibe_notificacion
            },
            success: function(data) {
                clearData();
                reloadSearch();
                SLIDER.prev();
                $(".bg-info").show("slow");
                setTimeout(function() {
                    $(".bg-info").hide("slow");
                }, 3000);
            }
        });
    }
}

/**
 * Recarga la busqueda y considera paginacion :)
 */
function reloadSearch() {
    if ($(".pagination").find(".active a").length > 0) {
        var pagina = parseInt($($(".pagination").find(".active a")[0]).html());
        getSearch(pagina);
    } else {
        getSearch();
    }
}

/**
 * Obtiene la busqueda de los registros activos del catalogo
 */
function getSearch(pagina) {
    $.ajax({
        type: "POST",
        url: "usuario/getSearch",
        dataType: 'json',
        data: {
            texto: $("#txtSearch").val(),
            pagina: ((typeof pagina == 'undefined') ? 1 : pagina)
        },
        success: function(data) {
            //console.log(data.total);
            setRowTable(data.pagina, data.data);
            setPaginator(data.pagina, data.total);
        }
    });
}