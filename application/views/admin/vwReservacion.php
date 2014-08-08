<?php
$this->load->view('admin/vwHeader');
?>
<script type="text/javascript">
var CURRENCY = '<?php echo CURREN; ?>';

</script>
<div class="page-header container">
    <h1><small>Reservaciones</small></h1>
</div>

<div id="slider" class="owl-carousel">
    <div class="item">
        <div class="container">
            <div class="row">
                <div class="col-md-12"><span class="pull-right"><a href='#' title='View' class="btn btn-primary btnAdd"><i class="fam-plus"></i> Reservación  </a></span></div>
            </div><br/>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li class="active"><a href="#entrada" role="tab" data-toggle="tab" id="tab_entrada">Entradas del día</a></li>
                <li><a href="#salida" role="tab" data-toggle="tab" id="tab_salida">Salidas del día</a></li>
                <li><a href="#consulta" role="tab" data-toggle="tab" id="tab_consulta">Consultas</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="entrada">
                    <div class="input-group" style="margin-top:10px;">
                        <table>
                            <tr>
                                <td>
                                    <span ><a id="btnPreDay" href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Anterior</a></span>
                                </td>
                                <td>
                                    <a href="#"  class="btn small" id="startDate" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Fecha:</a>
                                    <span></span>
                                </td>
                                <td>
                                    <span ><a href='#' id="btnNextDay" title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Siguiente</a></span>
                                </td>
                            </tr>

                        </table></div><br/>
                    <!-- __________ TABLA __________ -->
                    <p class="bg-info">La información se almaceno satisfactoriamente.</p>

                    <div class="panel panel-default" >
                        <!-- Default panel contents -->
                        <div class="panel-heading">Lista de Reservaciones</div>

                        <!-- Table -->
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Llegada</th>
                                    <th>Salida</th>
                                    <th>Habitacion(es)</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody id="bodyTableEntrada">
                            </tbody>
                        </table>
                    </div>

                    <ul id="paginationEntrada" class="pagination">
                    </ul>
                    <!--fin tabla-->
                </div>
                <div class="tab-pane" id="salida">
                    <!-- __________ TABLA __________ -->
                    <div class="input-group" style="margin-top:10px;">
                        <table>
                            <tr>
                                <td>
                                    <span ><a id="btnPreDayExit" href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Anterior</a></span>
                                </td>
                                <td>
                                    <a href="#" class="btn small" id="endDate" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-20"><span class="redPoint">*</span>Fecha:</a>
                                    <span></span>
                                </td>
                                <td>
                                    <span ><a id="btnNexDayExit" href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Siguiente</a></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br/>
                    <p class="bg-info">La información se almaceno satisfactoriamente.</p>

                    <div class="panel panel-default" >
                        <!-- Default panel contents -->
                        <div class="panel-heading">Lista de Reservaciones</div>

                        <!-- Table -->
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Llegada</th>
                                    <th>Salida</th>
                                    <th>Habitacion(es)</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody id="bodyTableSalida">
                            </tbody>
                        </table>
                    </div>

                    <ul id="paginationSalida" class="pagination">
                    </ul>
                    <!--fin tabla-->
                </div>
                <div class="tab-pane" id="consulta">
                    <!-- __________ TABLA __________ -->
                    <div class="input-group" style='margin-top: 10px;'>
                        <input id="txtSearch" type="text" placeholder="Busqueda por cliente o codigo" class="form-control">
                        <span class="input-group-addon btnSearch"><i class="fam-search"></i> Buscar</span>
                    </div>

                    <div class="input-group" style="margin-top:10px;">
                        <div class="xFiltro">
                            <label>Fecha Inicio</label>
                            <input type="date" id="txtFechaIni" />
                        </div>
                        <div class="xFiltro">
                            <label>Fecha Fin</label>
                            <input type="date" id="txtFechaFin" />
                        </div>
                        <div class="xFiltro">
                            <input type="checkbox" id="txtShowCo"><label for="txtShowCo">&nbsp;Mostrar CheckOuts</label>
                        </div>

                    </div>
                    <br/>
                    <p class="bg-info">La información se almaceno satisfactoriamente.</p>

                    <div class="panel panel-default" >
                        <!-- Default panel contents -->
                        <div class="panel-heading">Lista de Reservaciones</div>

                        <!-- Table -->
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Llegada</th>
                                    <th>Salida</th>
                                    <th>Habitacion(es)</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody id="bodyTable">
                            </tbody>
                        </table>
                    </div>

                    <ul id="paginationConsulta" class="pagination">
                    </ul>
                    <!--fin tabla-->
                </div>
            </div>
        </div>
    </div>


    <!-- __________ TAB 1 Panel Reservacion __________ -->
    <div class="item">
        <div class="container" style="width:620px;">
            <form class="form-inline" role="form">
                <table>
                    <tr>
                        <td width="280">
                            <a href="#" class="btn small" id="startDateBooking" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Entrada</a>
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="280">
                            <a href="#" class="btn small" id="endDateBooking" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-20"><span class="redPoint">* </span>Salida </a>
                            <span></span>
                        </td>
                    </tr>
                    <tr>						
                        <td width="280"> 
                            <div class="row">
                                <div class="col-xs-6">
                                    <label for="selRooms">Cuartos:</label>
                                    <select class="form-control" id="selRooms" name="nRooms">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>								
                                    </select>	
                                </div>
                            </div>

                        </td>					
                    </tr>
                    <tr>
                        <td width="280">
                            <div id="peopleBox" >
                                <div id="nPeople1" class="row nPeople">
                                    <div class="adultBox col-xs-4">
                                        <label for="nAdults">Adultos:</label>
                                        <select class="form-control" id="selAdults1" name="nAdults">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>																	
                                        </select>
                                    </div>
                                    <div class="childBox col-xs-4">
                                        <label for="nChildren">Niños:</label>
                                        <select class="form-control " id="selChildren1" name="nChildren">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>																	
                                        </select>
                                    </div>
                                    <div class="childAgeBox col-xs-8">
                                        *Se consideran niños entre 3 y 12 años.<br/>
                                        *Los niños menores de 3 años no pagan.<br/>
                                        *Mayores de 12 años pagan como adultos.<br/>
                                    </div>
                                </div>
                                <br/>
                            </div>

                        </td>
                    </tr>
                </table>
                <a id="btnSiguiente" class="btn btn-primary pull-right">Siguiente</a>
                <a id="btnCancelar" class="btn btn-danger pull-right">Cancelar</a>
            </form>
        </div>

    </div>
    <!-- __________ Tab 2 reservacion __________ -->
    <div class="item">
        <div class="container" style="width:620px;">
            <div class="panelTitle"></div>			
            <div class="leftSide">				
                <div>
                    <div id="reserveRange"></div>
                    <div id="reserveTotal">Total $ 0,000.00</div>
                </div>
                <div id="roomConteiner"></div>				
            </div>		
            <div class="rightSide">	
                <div id="nextIcon2" class="nextButtom">					
                    <input type="hidden" class="panelIndex" value="2" />				
                </div>				
            </div>
            <a id="btnSiguiente2" class="btn btn-primary pull-right">Siguiente</a>
            <a id="btnAnterior" class="btn btn-danger pull-right">Anterior</a>
        </div>

    </div>
</div>

<!-- __________ HIDE MODAL __________ -->
<div class="modal fade modal-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-body">
                <h4 class="modal-title" id="mySmallModalLabel">Información del Registro</h4>
                <br/>

                <table style="margin-left: 30px;">
                    <tr>
                        <td>
                            <label id="txtNombre" style="font-size: xx-large;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <label id="txtLlegadaSalida" style="font-size: large; margin-bottom:20px;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <label id="txtHabitaciones" style="font-size: medium;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <label id="txtTotal" style="font-size: large; margin-bottom:20px;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <label class="custom-select">
                                <select id="selEstado">
                                    <option value="1">Tentativo</option>
                                    <option value="2">Pagado</option>
                                    <option value="3">CheckIn</option>
                                    <option value="4">CheckOut</option>
                                </select>
                            </label>
                        </td>
                    </tr>
                </table>

                <span id="delNombre"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button id="btnUpdateModal" type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<?php
$this->load->view('admin/vwFooter');
?>
<script src="<?php echo base_url() . JS; ?>bootstrap-datepicker.js"></script>
<script src="<?php echo base_url() . JS; ?>api/common.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/jtemplates/jquery-jtemplates.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/jshashtable/jshashtable.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/format/jquery.format.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/numberformatter/jquery.numberformatter.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/spinnercontrol/jquery.spinnercontrol.js"></script>

<script src="<?php echo base_url() . JS; ?>api/reservacion.js"></script>