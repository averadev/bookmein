var SLIDER = null;
var regPrice = 3;
var tempPrice = 2;
var promoPrice = 1;
var arrayPrice = new Array();
var adultoXtra;
var ninoXtra;


$(function() {

    //  Eventos de Botones
    $(".btnSearch,#tab_consulta").click(function() {
        getSearch();
    });
    $("#tab_entrada").click(function() {
        getSearchEntrance();
    });
    $("#tab_salida").click(function() {
        getSearchExit();
    });
    $("#txtSearch").keypress(function(e) {
        if (e.which === 13) {
            getSearch();
        }
    });
    $(".btnAdd").click(function() {
        SLIDER.next();
    });
    $("#btnSiguiente").click(function() {
        var fecha = formatFecha(getFecha($('#startDateBooking').attr('data-date')));
        var fechaE = formatFecha(getFecha($('#endDateBooking').attr('data-date')));
        loadPanel2(fecha, fechaE);
        SLIDER.next();
    });
    $("#btnSiguiente2").click(function() {
        if (validateSelect() === true) {
            $("#msgSelect").remove();
            $(".bg-danger").hide();
            SLIDER.next();
        } else {
            $(".bg-danger").show("slow");
        }
    });
    $("#btnSiguiente3").click(function() {
        if (validateCustomerInfo()) {
            $(".bg-danger").hide();
            $(".bg-danger2").hide()
            loadPanel4();
            SLIDER.next();

        }

    });
    $("#btnSiguiente4").click(function() {
        generateReserve();
        //SLIDER.next();
    });
    $("#btnFinalizar").click(function() {
        cleanAll();
        SLIDER.next();
    });
    $("#btnCancelar,#btnAnterior, #btnAnterior4").click(function() {
        $(".bg-danger").hide();
        SLIDER.prev();
    });
    $("#btnPreDay").click(function() {
        setFecha(getFecha($('#startDate').attr('data-date')), '#startDate', "decremento", 1);
        getSearchEntrance();
    });
    $("#btnNextDay").click(function() {
        setFecha(getFecha($('#startDate').attr('data-date')), '#startDate', "incremento", 1);
        getSearchEntrance();
    });
    $("#btnPreDayExit").click(function() {
        setFecha(getFecha($('#endDate').attr('data-date')), '#endDate', "decremento", 1);
        getSearchExit();
    });
    $("#btnNexDayExit").click(function() {
        setFecha(getFecha($('#endDate').attr('data-date')), '#endDate', "incremento", 1);

        getSearchExit();
    });

    $('#txtShowCo').change(function() {
        getSearch();
    });
    $('#startDate').change(function() {
        getSearchEntrance();
    });

    $("#btnUpdateModal").click(function() {
        updateRow($(this).attr("attr-id"), $("#selEstado").val());
    });
    changeDate('#startDate', new Date());
    changeDate('#endDate', new Date());
    // Vigencia
    $('#startDate').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#startDate').datepicker('hide');
                getSearchEntrance();
            });
    $('#endDate').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#endDate').datepicker('hide');
                getSearchExit();
            });
    // fechas para la reservacion
    changeDate('#startDateBooking', new Date());
    changeDate('#endDateBooking', new Date());
    changeDate('#startDateConsult', new Date());
    changeDate('#endDateConsult', new Date());
    $('#startDateBooking').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#startDateBooking').datepicker('hide');
            });
    $('#endDateBooking').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#endDateBooking').datepicker('hide');
            });

    $('#startDateConsult').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#startDateConsult').datepicker('hide');
                getSearch();
            });
    $('#endDateConsult').datepicker()
            .on('changeDate', function(ev) {
                changeDate(this, ev.date);
                $('#endDateConsult').datepicker('hide');
                getSearch();
            });

    //inicializar selects cuarto reservación
    $("#selRooms").bind("change", function() {
        $("#peopleBox").html("");
        var n = $(this).val() * 1;
        var items = "";
        for (var i = 0; i < n; i++) {
            items +=
                    "<div id='nPeople" + (i + 1) + "' class='row nPeople'>" +
                    "<div class='adultBox col-xs-4'>" +
                    "<label for='nAdults'>Adultos:</label>" +
                    "<select class='form-control' id='selAdults" + (i + 1) + "' name='nAdults'>" +
                    "<option value='1'>1</option>" +
                    "<option value='2'>2</option>" +
                    "<option value='3'>3</option>" +
                    "<option value='4'>4</option>" +
                    "</select>" +
                    "</div>" +
                    "<div class='childBox col-xs-4'>" +
                    "<label for='nChildren'>Niños:</label>" +
                    "<select class='form-control' id='selChildren" + (i + 1) + "' name='nChildren'>" +
                    "<option value='0'>0</option>" +
                    "<option value='1'>1</option>" +
                    "<option value='2'>2</option>" +
                    "<option value='3'>3</option>" +
                    "<option value='4'>4</option>" +
                    "</select>" +
                    "</div>" +
                    "<div class='childAgeBox col-xs-8'></div>" +
                    "</div>";
        }
        $("#peopleBox").html(items);

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
    SLIDER = $("#slider").data('owlCarousel');

    // Init data
    getSearchEntrance();
    //clean
    cleanAll();

});

function formatFecha(fechaString) {
    var fecha;
    var date = new Date(fechaString);
    var dd = date.getDate();
    var mm = date.getMonth() + 1;
    var yyyy = date.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    return  fecha = dd + '/' + mm + '/' + yyyy;
}
function setFecha(fechaString, tipoFecha, tipoCambio, dias) {
    var date = new Date(fechaString);
    console.log(date);
    if (tipoCambio === "incremento") {
        date.setDate(date.getDate() + dias);
    } else {
        date.setDate(date.getDate() - dias);
    }
    changeDate(tipoFecha, date);

}

function loadPanel2(fechaEntrada, fechaSalida) {
    $("#reserveTotal").html("Total: $ 0.00 " + CURRENCY);
    adultoXtra = getGuestNumber("selAdults");
    ninoXtra = getGuestNumber("selChildren");
    $.ajax({
        type: "POST",
        url: "../reserveController/getRoomsAvaliable",
        dataType: 'json',
        data: {
            arriveDate: fechaEntrada,
            departureDate: fechaSalida
        },
        success: function(data) {
            //console.log(data);
            var allRooms = (data.length != 0) ? data.result : [];
            var available = (data.length != 0) ? data.available : [];
            var reserveInfo = getDataPanel1();
            //console.log(allRooms);
            $("#roomConteiner").html(createRoomHeader(allRooms, available, fechaEntrada, fechaSalida));
            loadRoomInfo(reserveInfo, allRooms, available);
        }
    });
    $("#roomConteiner").val("");
}

function createRoomHeader(rooms, available, fechaEntrada, fechaSalida) {

    $("#reserveRange").html(
            "<span class='titleArrive'>Arrival:</span> <span class='txtArrive'>" + fechaEntrada + "</span>" +
            "<br/><span class='titleDeparture'>Departure: </span> <span class='txtDeparture'>" + fechaSalida + "</span>"
            );

    var roomItem = "";
    for (var i = 0; i < rooms.length; i++) {
        var item = rooms[i];
        $.extend(item, available[i]);
        roomItem += "<div class='roomItem'>" +
                "<div class='roomTypeName'><h4>" + item.name + "</h4></div>" +
                "<div class='roomDescription'>" + item.description + " </div>" +
                "<div class='roomTable ' id='tmpRoom" + item.id + "'>" +
                "<div class='roomTotal'>Total: </div>" +
                "</div>";
    }

    return roomItem;

}
function getDataPanel1() {

    return {
        'arriveDate': formatFecha(getFecha($('#startDateBooking').attr('data-date'))),
        'departureDate': formatFecha(getFecha($('#endDateBooking').attr('data-date'))),
        'nRooms': $("#selRooms").val(),
        'nAdults': getGuestNumber("selAdults"),
        'nChildren': getGuestNumber("selChildren"),
        'nAdultExtra': 1,
        'nChildExtra': 1,
        'strArriveDate': formatFecha(getFecha($('#startDateBooking').attr('data-date'))),
        'strDepartureDate': formatFecha(getFecha($('#endDateBooking').attr('data-date')))
    };
}
function getGuestNumber(selector) {

    var n = 0;
    $.each($("select[id^='" + selector + "']"), function() {
        n = $(this).val() * 1 + n;
    });
    return n;
}
function loadXtraPeople() {
    adultoXtra = getGuestNumber("selAdults");
    ninoXtra = getGuestNumber("selChildren");
}
function loadRoomInfo(reserveInfo, rooms, roomsFree) {

    for (var i = 0; i < rooms.length; i++) {
        var room = rooms[i];
        $.extend(room, reserveInfo);
        $.extend(room, roomsFree);
        var extraPeople = findExra(room.capacity * 1);
        $.extend(room, extraPeople);
        $("#tmpRoom" + rooms[i].id).setTemplate(getRoomTemplate());
        $("#tmpRoom" + rooms[i].id).setParam('numberFormatter', numberFormatter);
        //el metodo $.processTempate solo acepta parametros arrays
        $("#tmpRoom" + rooms[i].id).processTemplate([room]);
        $('td:nth-child(1),th:nth-child(1)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(2),th:nth-child(2)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(3),th:nth-child(3)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(4),th:nth-child(4)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(5),th:nth-child(5)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(6),th:nth-child(6)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(7),th:nth-child(7)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(8),th:nth-child(8)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(9),th:nth-child(9)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(10),th:nth-child(10)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(11),th:nth-child(11)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(12),th:nth-child(12)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(13),th:nth-child(13)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(14),th:nth-child(14)', "#tmpRoom" + rooms[i].id).hide();
        $('td:nth-child(15),th:nth-child(15)', "#tmpRoom" + rooms[i].id).hide();
        atachTableEvents("#tmpRoom" + rooms[i].id, rooms[i].nRooms, parseInt(rooms[i].available) * 1);
        //console.log(rooms[i].available * 1);
        if (rooms[i].available < 1)
            $("#tmpRoom" + rooms[i].id).append("<div class='notAvailable text-danger text-right' >Sin disponibilidad</div>");
        else
            $("#tmpRoom" + rooms[i].id).append("<div class='tRoomPrice text-info text-right' >Total: $ 0.00 " + CURRENCY + "</div><div class='xtraPerson text-danger text-right'></div>");

    }
}
function numberFormatter(val) {
    if (val != 0)
        return $.formatNumber(val, {format: "$ #,###.00", locale: "us"});
    else
        return "0.00";
}
function getRoomTemplate() {
    var room =
            "<table class='tableRooms table table-bordered table-striped'>" +
            "{#foreach $T as row}" +
            "<tr>" +
            "<th> Room Type Id	</th>" +
            "<th> regualrPrice	</th>" +
            "<th> Price Type Id	</th>" +
            "<th> price			</th>" +
            "<th> pAultExtra	</th>" +
            "<th> pChildExtra	</th>" +
            "<th> priceType		</th>" +
            "<th> priceTypeName	</th>" +
            "<th> available		</th>" +
            "<th> capacity		</th>" +
            "<th> adults		</th>" +
            "<th> children		</th>" +
            "<th> adultsExtra	</th>" +
            "<th> childrenExtra	</th>" +
            "<th> roomChange	</th>" +
            "<th> Cuartos  </th>" +
            "<th> Adultos		</th>" +
            "<th> Menores	</th>" +
            "<th> Precio por cuarto [{$T.row.capacity} persons] </th>" +
            "<th> Adicional		</th>" +
            "<th></th>" +
            "</tr>" +
            "<tr>" +
            "<td class='hiden roomId'>{$T.row.id}</td>" +
            "<td class='hiden regularPrice'>	{$T.row.regularPrice}	</td>" +
            "<td class='hiden priceTypeId'>		{$T.row.priceTypeId}	</td>" +
            "<td class='hiden price'>			{$T.row.price}			</td>" +
            "<td class='hiden pAdultExtra'>		{$T.row.pAdultExtra}	</td>" +
            "<td class='hiden pChildExtra'>		{$T.row.pChildExtra}	</td>" +
            "<td class='hiden priceType'>		{$T.row.priceType}		</td>" +
            "<td class='hiden priceTypeName'>	{$T.row.priceTypeName}	</td>" +
            "<td class='hiden available'>		{$T.row.available}		</td>" +
            "<td class='hiden capacity'>		{$T.row.capacity}		</td>" +
            "<td class='hiden adults'>			{$T.row.nAdults}		</td>" +
            "<td class='hiden children'>		{$T.row.nChildren}		</td>" +
            "<td class='hiden nAdultExtra'>		{$T.row.nAdultExtra}	</td>" +
            "<td class='hiden nChildExtra'>		{$T.row.nChildExtra}	</td>" +
            "<td class='hiden roomChange'>0</td>" +
            "<td class='alt colRooms'>			<input type='text' class='numRooms' name='numRooms' value='{$T.row.nRooms}' size='3' maxlength='3' /> </td>" +
            "<td class='alt nAdults'>			{$T.row.nAdults}		</td>" +
            "<td class='alt nChildren'>			{$T.row.nChildren}		</td>" +
            "<td class='alt totalPrice'>		{#if $T.row.priceType == 3} <div class='holaMundo'> {'Price: ' +  $P.numberFormatter($T.row.price)} </div> {#else} {'</div>' + $T.row.priceTypeName + ': <span>' + $P.numberFormatter($T.row.price) + '</span> </div>' + '<div class=prevPrice>Regular Price: ' +  $P.numberFormatter($T.row.regularPrice) + '<div>' }  {#/if} </td>" +
            "<td class='alt'>					<div>Adult: {$P.numberFormatter($T.row.pAdultExtra)}</div> <div> Child: {$P.numberFormatter($T.row.pChildExtra)}</div> </td>" +
            "<td class='alt colSelect'>			 <input type='checkbox' name='selectRow' {#if $T.row.available < 1} disabled='disabled'   />  </td>" +
            "</tr>" +
            "{#/for}" +
            "</table>";

    return room;
}
function findExra(capRoom) {

    var rooms = $("#selRooms").val() * 1
    var adults = [];
    var childs = [];
    for (var i = 0; i < rooms; i++) {
        var nAdult = $("#selAdults" + (i + 1)).val() * 1
        var nChild = $("#selChildren" + (i + 1)).val() * 1
        if ((nAdult + nChild) > capRoom) {
            adults.push(findAdultExtra(nAdult, capRoom));
            childs.push(findChildExtra(nAdult, nChild, capRoom));
        }
    }

    var adultExtra = 0;
    var childExtra = 0;
    for (var i = 0; i < adults.length; i++) {
        adultExtra += adults[i];
    }
    for (var i = 0; i < childs.length; i++) {
        childExtra += childs[i];
    }

    var extra = {'nAdultExtra': adultExtra, 'nChildExtra': childExtra};
    return extra;
}

function findAdultExtra(cAdult, cap) {

    var r = cAdult - cap;
    if (r > 0) {
        return r;
    }
    return 0;

}

function findChildExtra(cAdult, cChild, cap) {
    var r = cAdult - cap;
    if (r >= 0) {
        return cChild;
    } else {
        return ((cChild) + (r));
    }
}
function atachTableEvents(tableWrapper, roomsSelected, maxRooms) {

    //Selecciona la tabla al seleecionar la casilla de verificacione
    var allCheckBoxSel = $(".colSelect", tableWrapper);
    for (var i = 0; i < allCheckBoxSel.length; i++) {
        var inputs = $(allCheckBoxSel[i]).children();
        for (var j = 0; j < inputs.length; j++) {
            $(inputs[j]).unbind();
            $(inputs[j]).bind("change", function() {

                if ($(this).is(":checked")) {
                    $(tableWrapper).find("table").addClass('roomSelected');
                    updateRoomValues(tableWrapper, $(".numRooms", tableWrapper).val());
                    updateXtraValue(tableWrapper);
                    updateTotalValue(tableWrapper);
                } else {
                    $(tableWrapper).find("table").removeClass('roomSelected');
                    $(tableWrapper).find(".tRoomPrice").html(function() {
                        return "<div>Total: " + (numberFormatter(0)) + " " + CURRENCY + "</div>";
                    });
                    updateXtraValue(tableWrapper);
                    updateTotalValue(tableWrapper);
                }
            });
        }
    }

    //Limita el input a valores numericos
    var allCol = $(tableWrapper).find(".colRooms");
    for (var i = 0; i < allCol.length; i++) {
        var inputs = $(allCol[i]).children();
        //console.log(maxRooms);
        for (var j = 0; j < inputs.length; j++) {
            var minValue = 1;
            if (maxRooms === 0) {
                minValue = 0;
            } else {
                console.log("mayor")
            }
            $(inputs[j]).SpinnerControl({
                typedata: {min: minValue, max: maxRooms, interval: 1},
                defaultVal: (roomsSelected * 1),
                //Evento al incrementar
                onIncrement: function(value) {
                    //console.log("hola");
                    var row = getRowData(tableWrapper);
                    if (row.roomChange == 0) {
                        $("table .adults", tableWrapper).html(row.capacity * (value - 1));
                        $("table .children", tableWrapper).html("0");
                        $("table .roomChange", tableWrapper).html("1");
                    }

                    if (!$("table", tableWrapper).hasClass('roomSelected')) {
                        $("table", tableWrapper).addClass('roomSelected');
                        $("table", tableWrapper).find("input[name=selectRow]").get(0).checked = true;
                    }

                    updateRoomValues(tableWrapper, value);
                    updateXtraValue(tableWrapper);
                    updateTotalValue(tableWrapper);
                },
                //Eventto al decrement
                onDecrement: function(value) {
                    var row = getRowData(tableWrapper);
                    if (row.roomChange == 0) {
                        $("table .adults", tableWrapper).html(row.capacity * (value - 1));
                        $("table .children", tableWrapper).html("0");
                        $("table .roomChange", tableWrapper).html("1");
                    }
                    if (!$("table", tableWrapper).hasClass('roomSelected')) {
                        $("table", tableWrapper).addClass('roomSelected');
                        $("table", tableWrapper).find("input[name=selectRow]").get(0).checked = true;
                    }
                    updateRoomValues(tableWrapper, value);
                    updateXtraValue(tableWrapper);
                    updateTotalValue(tableWrapper);
                }
            });
        }
    }
}
function getRowData(tableWrapper) {
    var row = {
        roomId: $(tableWrapper).parent().find(".roomId").html() * 1,
        description: $(tableWrapper).parent().find(".roomDescription").html(),
        regularPrice: $.trim($(tableWrapper).find(".regularPrice").html()) * 1,
        priceTypeId: $.trim($(tableWrapper).find(".priceTypeId").html()) * 1,
        price: $.trim($(tableWrapper).find(".price").html()) * 1,
        pAdultExtra: $.trim($(tableWrapper).find(".pAdultExtra").html()) * 1,
        pChildExtra: $.trim($(tableWrapper).find(".pChildExtra").html()) * 1,
        priceType: $.trim($(tableWrapper).find(".priceType").html()) * 1,
        priceTypeName: $.trim($(tableWrapper).find(".priceTypeName").html()),
        available: $.trim($(tableWrapper).find(".available").html()) * 1,
        capacity: $.trim($(tableWrapper).find(".capacity").html()) * 1,
        adults: $.trim($(tableWrapper).find(".adults").html()) * 1,
        children: $.trim($(tableWrapper).find(".children").html()) * 1,
        nAdultExtra: $.trim($(tableWrapper).find(".nAdultExtra").html()) * 1,
        nChildExtra: $.trim($(tableWrapper).find(".nChildExtra").html()) * 1,
        roomChange: $.trim($(tableWrapper).find(".roomChange").html()) * 1,
        nRooms: $.trim($(tableWrapper).find(".numRooms").val()) * 1,
        totalPrice: ($.trim($(tableWrapper).find(".numRooms").val()) * $.trim($(tableWrapper).find(".price").html())) * 1,
        roomTypeName: $(tableWrapper).siblings(".roomTypeName").html(),
        days: getDiferenceDays(new Date(getFecha($('#startDateBooking').attr('data-date'))), new Date(getFecha($('#endDateBooking').attr('data-date'))))
    };

    return row;
}

function updateXtraValue(tableWrapper) {
    var adultoTotal = 0;
    var ninoTotal = 0;
    var legendXtra = '';
    var capacidadTotal = 0;
    var firstPosc = 0;
    var row = getRowData(tableWrapper);
    $(".xtraPerson").html(legendXtra);

    for (var dataPosc in arrayPrice) {
        var rowTemp = getRowData(dataPosc);
        if ($(dataPosc).find(".tableRooms").hasClass("roomSelected")) {
            // Capacidad
            capacidadTotal += (row.capacity * $(".numRooms", dataPosc).val());
            // Total reset
            var totalPrice = (rowTemp.price * $(".numRooms", dataPosc).val() * rowTemp.days);
            $(dataPosc).find(".tRoomPrice").html(function() {
                return "<div>Total: " + (numberFormatter(totalPrice)) + " " + CURRENCY + "</div>";
            });
            arrayPrice[dataPosc] = totalPrice;
        }
    }

    if ((capacidadTotal > 0) && (capacidadTotal < (adultoXtra + ninoXtra))) {
        if (capacidadTotal <= adultoXtra) {
            adultoTotal = adultoXtra - capacidadTotal;
            ninoTotal = ninoXtra;
        } else {
            adultoTotal = 0;
            ninoTotal = (adultoXtra + ninoXtra) - capacidadTotal;
        }
        if (adultoTotal > 0)
            legendXtra = 'Adulto Adicional : ' + adultoTotal;
        if (adultoTotal > 0 && ninoTotal > 0)
            legendXtra += '<br/>';
        if (ninoTotal > 0)
            legendXtra += 'Menor Adicional: ' + ninoTotal;

        for (var dataPosc in arrayPrice) {
            var rowTemp = getRowData(dataPosc);
            if ($(dataPosc).find(".tableRooms").hasClass("roomSelected")) {
                var totalPrice = (rowTemp.price * $(".numRooms", dataPosc).val() * rowTemp.days) + (rowTemp.pAdultExtra * adultoTotal) + (rowTemp.pChildExtra * ninoTotal);
                $(dataPosc).find(".tRoomPrice").html(function() {
                    return "<div>Total: " + (numberFormatter(totalPrice)) + " " + CURRENCY + "</div>";
                });
                arrayPrice[dataPosc] = totalPrice;
                $(dataPosc).find(".xtraPerson").html(legendXtra);
                break;
            }
        }
    }

}

/**
 * Actualiza los valores de un tipos habitacion
 * @param tableWrapper
 * @param rooms
 */
function updateRoomValues(tableWrapper, rooms) {
    var row = getRowData(tableWrapper);
    var totalPrice = (row.price * rooms * row.days);
    $(tableWrapper).find(".tRoomPrice").html(function() {
        return "<div>Total: " + (numberFormatter(totalPrice)) + " " + CURRENCY + "</div>";
    });
    arrayPrice[tableWrapper] = totalPrice;
}

function updateTotalValue(tableWrapper) {

    var total = 0;
    var allTables = $("div[id^='tmpRoom']");
    for (var dataPosc in arrayPrice) {
        //console.log($(dataPosc).find(".tableRooms").hasClass("roomSelected"));
        if ($(dataPosc).find(".tableRooms").hasClass("roomSelected")) {
            total += arrayPrice[dataPosc];
            //console.log(arrayPrice);
        }
    }
    $("#reserveTotal").data("total", total);
    $("#reserveTotal").html("Total: " + numberFormatter(total) + " " + CURRENCY);
}
function getDiferenceDays(date1, date2) {

    var days = 0;
    if (date1 != null && date2 != null)
        days = (date2.getTime() - date1.getTime()) / (1000 * 60 * 60 * 24);
    return (days == 0) ? 1 : (days * 1);
}
var roomReserve = [];
function loadPanel4() {

    $("#formPaypal").hide();
    roomReserve = getAllRoomSelected();
    preReserve = getDataPanel1();

    loadReserveSummary();
}
function getAllRoomSelected() {

    var allRooms = $("div[id^='tmpRoom']");
    var rooms = [];
    var i = 0;
    for (var dataPosc in arrayPrice) {
        if ($(dataPosc).find(".tableRooms").hasClass("roomSelected")) {
            var objToReserve = getRowData($(dataPosc));
            objToReserve.newPrice = arrayPrice[dataPosc];
            rooms.push(objToReserve);
        }
        i++;
    }

    return rooms;
}
function getReservePrice(rooms) {

    var price = 0;
    for (var dataPosc in arrayPrice) {
        if ($(dataPosc).find(".tableRooms").hasClass("roomSelected"))
            price += arrayPrice[dataPosc];
    }
    return price;
}
function loadReserveSummary() {

    var p1 = getDataPanel1();
    $("#generalData").html(
            "<span class='titleArrive'>Llegada:</span> <span class='txtArrive'>" + p1.strArriveDate + "</span>" +
            "<br/><span class='titleDeparture'>Salida: </span> <span class='txtDeparture'>" + p1.strDepartureDate + "</span>"
            );

    $("#reservePrice").html("Total: " + numberFormatter(getReservePrice(roomReserve)) + " " + CURRENCY);
    $("#reserveCode").html("Cod. de Reservación: - - - -");
    var innerHtml = "";
    var total = 0;
    for (var i = 0; i < roomReserve.length; i++) {
        innerHtml += "" +
                "<div class='roomForPay'>" +
                "<div class='roomTypeName sumRoom text-success'>" + roomReserve[i].nRooms + " Cuartos. " + roomReserve[i].roomTypeName + "</div>" +
                "<div class='roomTypeName sumPrice text-success'>" + numberFormatter(roomReserve[i].newPrice) + "</div>" +
                "<div class='roomDescription sumDesc text-success'>" + roomReserve[i].description + "</div>" +
                "</div>";
    }

    $("#roomSummary").html(innerHtml);
}
function cleanAll() {
    $("#arriveDate").val("");
    $("#departureDate").val("");
    $("#cName").val("");
    $("#cPaterno").val("");
    $("#cMaterno").val("");
    $("#cAddress").val("");
    $("#cPhone").val("");
    $("#reserved").val(0);
    $("#cEmail").val("");
    $("#btnSiguiente4").removeAttr("disabled");
    $(".bg-danger").hide();
}
function getCustomerInfo() {
    return {
        'name': $.trim($("#cName").val()),
        'aPaterno': $.trim($("#cPaterno").val()),
        'aMaterno': $.trim($("#cMaterno").val()),
        'address': $.trim($("#cAddress").val()),
        'city': $.trim($("#cCiyt").val()),
        'state': $.trim($("#cState").val()),
        'zip': $.trim($("#cZip").val()),
        'country': $("#cCountry").val(),
        'phone': $.trim($("#cPhone").val()),
        'email': $.trim($("#cEmail").val())
    };
}
function validateCustomerInfo() {
    if ($("#cName").val() == '' ||
            $("#cPaterno").val() == '' ||
            $("#cAddress").val() == '' ||
            $("#cPhone").val() == '' ||
            $("#cEmail").val() == '') {
        $(".bg-danger").show("slow");
        return false;
    }
    if (!validateEmail($("#cEmail").val())) {
        $(".bg-danger2").show("slow");
        return false;
    }
    return true;
}
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function generateReserve() {

    var reserved = $("#reserved").val() * 1;
    $("#newReserve").remove();

    if (reserved == 0) {
        //$("#msgLoading").remove();
        //$("#msg").append("<p id='msgLoading' style='color:red'>Generando Reservacion...</p>");
        $(".bg-danger").show("slow");
        $("#btnSiguiente4").attr("disabled", "disabled");
        $.post("../reserveController/saveReserve", {
            'customer': $.toJSON(getCustomerInfo()),
            'xrefRooms': $.toJSON(getXrefRoomReserve(roomReserve)),
            'arriveDate': preReserve.arriveDate,
            'departureDate': preReserve.departureDate

        }, function(jsonData) {

            var reserveCode = jsonData.code;
            var reserveId = jsonData.reserveId;
            //$("#msgLoading").remove();
            $(".bg-danger").hide();
            $("#reserved").val(1);
            $("#reserveCode").css({fontWeight: 'bold'})
            $("#reserveCode").html("Cod. de Reservation: <span style='color:red'># " + reserveCode + "</div>");
            addPayPalInfo(reserveCode);

            $("#btnSiguiente4, #btnAnterior4").fadeOut(300, function() {
                $("#formPaypal").fadeIn(300);
            });

        }, "json"
                );
    }
}
function addPayPalInfo(reserveCode) {
    $("#ppItemName").val("Reservation " + roomReserve.length + " room(s)");
    $("#ppItemNumber").val(reserveCode);
    $("#ppAmount").val(numberFormatter(getReservePrice(roomReserve)));
}
/**
 * 
 * @param roomReserve
 * @returns {Array}
 */
function getXrefRoomReserve(roomReserve) {
    var xref = [];
    for (var i = 0; i < roomReserve.length; i++) {
        xref.push({
            'roomId': roomReserve[i].roomId,
            'price': roomReserve[i].newPrice,
            'quantity': roomReserve[i].nRooms,
            'priceType': roomReserve[i].priceType,
            'priceTypeId': roomReserve[i].priceTypeId

        });
    }
    return xref;
}

function validateSelect() {
    var valid = false;
    var allTables = $("div[id^='tmpRoom']");
    for (var i = 0; i < allTables.length; i++) {
        if ($(allTables[i]).find(".tableRooms").hasClass("roomSelected")) {
            valid = true;
        }
    }
    return valid;
}

/**
 * Replace All Function
 */
String.prototype.replaceAll = function(find, replace) {
    return this.replace(new RegExp(find, 'g'), replace);
}

/**
 * Arma la tabla del catalogo
 */
function setRowTable(data) {
    // Template Row
    var tmpRows = "";
    var templateR = "";
    var template = "<tr><td class='idRow'>CODE</td>" +
            "<td><a class='editRow' attr-id='INDEX' data-toggle='modal' data-target='.modal-edit'>CLIENTE<a></td>" +
            "<td>ESTADO</td>" +
            "<td>LLEGADA</td>" +
            "<td>SALIDA</td>" +
            "<td>HABITACION</td>" +
            "<td>PRECIO</td></tr>";

    // Recorrer elementos
    for (i = 0; i < data.length; i++) {
        templateR = template;
        templateR = templateR.replaceAll("INDEX", data[i].id);
        templateR = templateR.replaceAll("CODE", data[i].codigo);
        templateR = templateR.replaceAll("CLIENTE", data[i].completo);
        templateR = templateR.replaceAll("LLEGADA", data[i].fechaLlegada);
        templateR = templateR.replaceAll("SALIDA", data[i].fechaSalida);
        templateR = templateR.replaceAll("ESTADO", data[i].estado);

        var precio = 0;
        var rooms = "";
        var habitaciones = data[i].habitaciones;
        for (x = 0; x < habitaciones.length; x++) {
            precio += parseFloat(habitaciones[x].precio);
            if (rooms != "") {
                rooms += "<br/>"
            }
            rooms += habitaciones[x].nombre + " (" + (parseFloat(habitaciones[x].precio)).formatMoney(0, "$", ",", ".") + ")";
        }
        templateR = templateR.replaceAll("HABITACION", rooms);
        templateR = templateR.replaceAll("PRECIO", precio.formatMoney(0, "$", ",", "."));


        tmpRows += templateR;
    }
    $("#bodyTable").html(tmpRows);


    $(".editRow").click(function() {
        $("#btnUpdateModal").attr("attr-id", $(this).attr("attr-id"));
        $("#txtNombre").html($(this).html());
        $("#txtLlegadaSalida").html($($(this).parent().parent().children()[3]).html() +
                " / " + $($(this).parent().parent().children()[4]).html());
        $("#txtHabitaciones").html($($(this).parent().parent().children()[5]).html());
        $("#txtTotal").html("Total: " + $($(this).parent().parent().children()[6]).html());

        var estado = 1;
        if ($($(this).parent().parent().children()[2]).html() == "Pagado")
            estado = 2;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckIn")
            estado = 3;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckOut")
            estado = 4;
        $("#selEstado").val(estado);
    });
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
    $("#paginationConsulta").html(pag);
    $(".btnPagina").click(function() {
        getSearch($($(this).children()).html());
    });
}

/**
 * Obtiene el registro seleccionado
 */
function updateRow(idRow, idEstado) {
    $.ajax({
        type: "POST",
        url: "reservacion/save",
        dataType: 'json',
        data: {
            id: idRow,
            estadoReservacionId: idEstado
        },
        success: function(data) {
            reloadSearch();
        }
    });
}

/**
 * Recarga la busqueda y considera paginacion :)
 */
function reloadSearch() {
    if ($("#paginationConsulta").find(".active a").length > 0) {
        var pagina = parseInt($($("#paginationConsulta").find(".active a")[0]).html());
        getSearch(pagina);
    } else {
        getSearch();
    }
}

/**
 * Obtiene la busqueda de los registros activos del catalogo
 */
function getSearch(pagina) {
    console.log($("#txtShowCo").is(':checked'));
    $.ajax({
        type: "POST",
        url: "reservacion/getSearch",
        dataType: 'json',
        data: {
            texto: $("#txtSearch").val(),
            fechaIni: $('#startDateConsult').attr('data-date'),
            fechaFin: $('#endDateConsult').attr('data-date'),
            showCo: $("#txtShowCo").is(':checked'),
            pagina: ((typeof pagina == 'undefined') ? 1 : pagina)
        },
        success: function(data) {
            setRowTable(data.data);
            setPaginator(data.pagina, data.total);
            console.log(data.pagina);
            console.log(data.total);

        }
    });
}

/**
 * Obtiene la busqueda de los registros activosy de entrada del dia en el catalogo
 */
function getSearchEntrance(pagina) {
    //console.log($('#startDate').attr('data-date'));
    $.ajax({
        type: "POST",
        url: "reservacion/getSearchEntrance",
        dataType: 'json',
        data: {
            fecha: $('#startDate').attr('data-date'),
            pagina: ((typeof pagina == 'undefined') ? 1 : pagina)
        },
        success: function(data) {
            setRowTableEntrance(data.data);
            setPaginatorEntrance(data.pagina, data.total);
            //console.log(data.total);
        }
    });
}
/**
 * Obtiene la busqueda de los registros activosy de entrada del dia en el catalogo
 */
function getSearchExit(pagina) {
    console.log("adios");
    $.ajax({
        type: "POST",
        url: "reservacion/getSearchExit",
        dataType: 'json',
        data: {
            fecha: $('#endDate').attr('data-date'),
            pagina: ((typeof pagina == 'undefined') ? 1 : pagina)
        },
        success: function(data) {
            setRowTableExit(data.data);
            setPaginatorExit(data.pagina, data.total);
            //console.log(data.total);
        }
    });
}
/**
 * Arma la tabla del catalogo
 */
function setRowTableEntrance(data) {
    // Template Row
    var tmpRows = "";
    var templateR = "";
    var template = "<tr><td class='idRow'>CODE</td>" +
            "<td><a class='editRow' attr-id='INDEX' data-toggle='modal' data-target='.modal-edit'>CLIENTE<a></td>" +
            "<td>ESTADO</td>" +
            "<td>LLEGADA</td>" +
            "<td>SALIDA</td>" +
            "<td>HABITACION</td>" +
            "<td>PRECIO</td></tr>";

    // Recorrer elementos
    for (i = 0; i < data.length; i++) {
        templateR = template;
        templateR = templateR.replaceAll("INDEX", data[i].id);
        templateR = templateR.replaceAll("CODE", data[i].codigo);
        templateR = templateR.replaceAll("CLIENTE", data[i].completo);
        templateR = templateR.replaceAll("LLEGADA", data[i].fechaLlegada);
        templateR = templateR.replaceAll("SALIDA", data[i].fechaSalida);
        templateR = templateR.replaceAll("ESTADO", data[i].estado);

        var precio = 0;
        var rooms = "";
        var habitaciones = data[i].habitaciones;
        for (x = 0; x < habitaciones.length; x++) {
            precio += parseFloat(habitaciones[x].precio);
            if (rooms != "") {
                rooms += "<br/>"
            }
            rooms += habitaciones[x].nombre + " (" + (parseFloat(habitaciones[x].precio)).formatMoney(0, "$", ",", ".") + ")";
        }
        templateR = templateR.replaceAll("HABITACION", rooms);
        templateR = templateR.replaceAll("PRECIO", precio.formatMoney(0, "$", ",", "."));


        tmpRows += templateR;
    }
    $("#bodyTableEntrada").html(tmpRows);


    $(".editRow").click(function() {
        $("#btnUpdateModal").attr("attr-id", $(this).attr("attr-id"));
        $("#txtNombre").html($(this).html());
        $("#txtLlegadaSalida").html($($(this).parent().parent().children()[3]).html() +
                " / " + $($(this).parent().parent().children()[4]).html());
        $("#txtHabitaciones").html($($(this).parent().parent().children()[5]).html());
        $("#txtTotal").html("Total: " + $($(this).parent().parent().children()[6]).html());

        var estado = 1;
        if ($($(this).parent().parent().children()[2]).html() == "Pagado")
            estado = 2;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckIn")
            estado = 3;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckOut")
            estado = 4;
        $("#selEstado").val(estado);
    });
}
/**
 * Arma el paginador de la tabla de entradas
 */
function setPaginatorEntrance(pagina, total) {
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
    $("#paginationEntrada").html(pag);
    $(".btnPagina").click(function() {
        getSearchEntrance($($(this).children()).html());
    });
}

/**
 * Arma la tabla del catalogo
 */
function setRowTableExit(data) {
    // Template Row
    var tmpRows = "";
    var templateR = "";
    var template = "<tr><td class='idRow'>CODE</td>" +
            "<td><a class='editRow' attr-id='INDEX' data-toggle='modal' data-target='.modal-edit'>CLIENTE<a></td>" +
            "<td>ESTADO</td>" +
            "<td>LLEGADA</td>" +
            "<td>SALIDA</td>" +
            "<td>HABITACION</td>" +
            "<td>PRECIO</td></tr>";

    // Recorrer elementos
    for (i = 0; i < data.length; i++) {
        templateR = template;
        templateR = templateR.replaceAll("INDEX", data[i].id);
        templateR = templateR.replaceAll("CODE", data[i].codigo);
        templateR = templateR.replaceAll("CLIENTE", data[i].completo);
        templateR = templateR.replaceAll("LLEGADA", data[i].fechaLlegada);
        templateR = templateR.replaceAll("SALIDA", data[i].fechaSalida);
        templateR = templateR.replaceAll("ESTADO", data[i].estado);

        var precio = 0;
        var rooms = "";
        var habitaciones = data[i].habitaciones;
        for (x = 0; x < habitaciones.length; x++) {
            precio += parseFloat(habitaciones[x].precio);
            if (rooms != "") {
                rooms += "<br/>"
            }
            rooms += habitaciones[x].nombre + " (" + (parseFloat(habitaciones[x].precio)).formatMoney(0, "$", ",", ".") + ")";
        }
        templateR = templateR.replaceAll("HABITACION", rooms);
        templateR = templateR.replaceAll("PRECIO", precio.formatMoney(0, "$", ",", "."));


        tmpRows += templateR;
    }
    $("#bodyTableSalida").html(tmpRows);


    $(".editRow").click(function() {
        $("#btnUpdateModal").attr("attr-id", $(this).attr("attr-id"));
        $("#txtNombre").html($(this).html());
        $("#txtLlegadaSalida").html($($(this).parent().parent().children()[3]).html() +
                " / " + $($(this).parent().parent().children()[4]).html());
        $("#txtHabitaciones").html($($(this).parent().parent().children()[5]).html());
        $("#txtTotal").html("Total: " + $($(this).parent().parent().children()[6]).html());

        var estado = 1;
        if ($($(this).parent().parent().children()[2]).html() == "Pagado")
            estado = 2;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckIn")
            estado = 3;
        else if ($($(this).parent().parent().children()[2]).html() == "CheckOut")
            estado = 4;
        $("#selEstado").val(estado);
    });
}
/**
 * Arma el paginador de la tabla de entradas
 */
function setPaginatorExit(pagina, total) {
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
    $("#paginationSalida").html(pag);
    $(".btnPagina").click(function() {
        getSearchEntrance($($(this).children()).html());
    });
}