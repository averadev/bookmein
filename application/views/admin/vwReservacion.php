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
            <div class="tab-content" style="margin-top:20px;">
                <div class="tab-pane active" id="entrada">
                    <div class="input-group" style="margin-top:10px;">
                        <table>
                            <tr>
                                <td>
                                    <span ><input id="btnPreDay" type="image" src="<?php echo base_url().IMG; ?>icons/arrow-previous-icon.png" name="image" width="40" height="40"><!--<a id="btnPreDay" href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Anterior</a>--></span>
                                </td>
                                <td>
                                    <a href="#"  class="btn small" id="startDate" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Fecha:</a>
                                    <span></span>
                                </td>
                                <td>
                                    <span ><input id="btnNextDay" type="image" src="<?php echo base_url().IMG; ?>icons/arrow-next-icon.png" name="image" width="40" height="40"><!--<a href='#' id="btnNextDay" title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Siguiente</a>--></span>
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
                                    <span ><input id="btnPreDayExit" type="image" src="<?php echo base_url().IMG; ?>icons/arrow-previous-icon.png" name="image" width="40" height="40"><!--<a  href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Anterior</a>--></span>
                                </td>
                                <td>
                                    <a href="#" class="btn small" id="endDate" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-20"><span class="redPoint">*</span>Fecha:</a>
                                    <span></span>
                                </td>
                                <td>
                                    <span ><input id="btnNexDayExit" type="image" src="<?php echo base_url().IMG; ?>icons/arrow-next-icon.png" name="image" width="40" height="40"><!--<a id="btnNexDayExit" href='#' title='View' class="btn btn-info btnPrev"><i class="fancybox-prev"></i> Siguiente</a>--></span>
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
                        <table>
                            <tr>
                                <td width="280">
                                    <a href="#" class="btn small" id="startDateConsult" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Fecha Inicio:</a>
                                    <span></span>
                                </td>
                                <td width="60"></td>
                                <td width="280">
                                    <a href="#" class="btn small" id="endDateConsult" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-20"><span class="redPoint">*</span>Fecha Fin:</a>
                                    <span></span>
                                </td>
                            </tr>
                        </table>
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
            
            <form>
                <table class="table table-bordered">
                    <tr>
                        <td width="280">
                            <a href="#" class="btn small" id="startDateBooking" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Entrada</a>
                            <span></span>
                        </td>
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
                        <td width="280">
                            <div id="peopleBox" >
                                <div  id="nPeople1" class="row nPeople">
                                    <div class="col-xs-6">
                                        <label for="nAdults">Adultos:</label>
                                        <select class="form-control" id="selAdults1" name="nAdults">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>																	
                                        </select>
                                    </div>
                                    <div class="col-xs-6">
                                        <label for="nChildren">Niños:</label>
                                        <select class="form-control " id="selChildren1" name="nChildren">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>																	
                                        </select>
                                    </div>
                                    
                                        
                                    </div>
                               
                            </div>
                            <div class="childAgeBox col-xs-12">
                                        *Se consideran niños entre 3 y 12 años.<br/>
                                        *Los niños menores de 3 años no pagan.<br/>
                                        *Mayores de 12 años pagan como adultos.<br/>
                            </div>

                        </td>
                    </tr>
                </table>
                <div class="rollovericons">
                    <a id="btnSiguiente" class="btn btn-primary pull-right">Siguiente</a>
                <a id="btnCancelar" class="btn btn-danger pull-right">Cancelar</a>
                </div>
                
            </form>
        </div>

    </div>
    <!-- __________ Tab 2 reservacion __________ -->
    <div class="item">
        <div class="container" style="width:700px;">
            <p class="bg-danger">Debes seleccionar al menos un cuarto</p>
            <div class="panelTitle"></div>			
            <div class="leftSide">				
                <div class="panel panel-primary">
                    <div id="reserveRange" class="panel-heading"></div>
                    <div id="reserveTotal" class="panel-body">Total $ 0,000.00</div>
                </div>
                <div id="roomConteiner" class="scroll"></div>				
            </div>		
            <div class="rightSide">	
                <div id="nextIcon2" class="nextButtom">					
                    <input type="hidden" class="panelIndex" value="2" />				
                </div>				
            </div>
            <div class="rollovericons">
                <a id="btnSiguiente2" class="btn btn-primary pull-right">Siguiente</a>
            <a id="btnAnterior" class="btn btn-danger pull-right">Anterior</a>
            </div>
            
        </div>

    </div>
    <div class="item">
        <div class="container" style="width:620px;">
                <div class="panelTitle"></div>
                <div class="leftSide">
                    <div id="customerInfo">
                        <div id="cFormTitle"><h3>Datos del Cliente</h3></div>
                        <form class="form-horizontal" role="form">
                            <p class="bg-danger">Los campos marcados (<span class="redPoint">*</span>), son obligatorios...</p>
                            <p class="bg-danger2">El correo (<span class="redPoint">*</span>), no es válido</p>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nombre</label>
                                <input type="text" class="form-control" id="cName" name="cName" placeholder="Ingresar nombre">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Apellidos</label>
                                <input type="text" class="form-control" id="cPaterno" name="cPaterno" placeholder="Ingresar apellidos">
                            </div>
<!--                            <div class="form-group">
                                <label for="exampleInputEmail1">Last Name(2)</label>
                                <input type="text" class="form-control" id="cMaterno" name="cMaterno" placeholder="Enter Last Name 2" >
                            </div>-->
                            <div class="form-group">
                                <label for="exampleInputPassword1">País</label>
                                <input type="text" class="form-control" id="cAddress" name="cAddress" placeholder="Ingresar País">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Teléfono</label>
                                <input type="text" class="form-control" id="cPhone" name="cPhone" placeholder="Ingresar Teléfono">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">E-mail</label>
                                <input type="text" class="form-control" id="cEmail" name="cEmail" placeholder="Ingresar email">
                            </div>
                        </form>
                    </div>
                </div>
            </form>
            <div class="rollovericons">
             <a id="btnSiguiente3" class="btn btn-primary pull-right">Siguiente</a>
            <a id="btnAnterior" class="btn btn-danger pull-right">Anterior</a>
            </div>
            
        </div>
    </div>
    <div class="item">
        <div class="container" style="width:620px;">
            <div class="panelTitle"></div>			

            <div class="panel panel-primary"  id="totalData">
                <div class="panel-heading" id="generalData"></div>
                <div class="panel-body" id="generalPrice">
                    <div><div id="reservePrice">Total: $ 0,000.00</div></div>						
                    <div id="reserveCode">Cod. de ReservaCion: 123456</div>
                </div>
                
            </div>

            <div id="roomSummary" class="well">			
                <div id="reserveSummary"></div>				
            </div>
           <p class="bg-danger">Guardando Reservacion....</p>

            <div class="rightSide">					
                <div id="nextIcon4" class="nextButtom">				
                    <input type="hidden" class="panelIndex" value="3" />
                    <input type="hidden" id="reserved" name="reserved" value="0" />
                </div>
                <!-- Paypal -->
                <form role="form" id="formPaypal" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">						

                    <input type="hidden" name="cmd" value="_xclick" />
                    <input type="hidden" name="business" value="fortalezasuites@hotmail.com" />

                    <!-- Importante -->
                    <input type="hidden" id="ppItemName" name="item_name" value="" />
                    <input type="hidden" id="ppItemNumber" name="item_number" value="" />
                    <input type="hidden" id="ppAmount" name="amount" value="" />
                    <!--  --> 

                    <input type="hidden" name="notify_url" value="<?php echo base_url(); ?>reserveController/paySuccess" />
                    <input type="hidden" name="no_shipping" value="1" />
                    <input type="hidden" name="return" value="<?php echo base_url(); ?>" />
                    <input type="hidden" name="cancel_return" value="<?php echo base_url(); ?>" />
                    <input type="hidden" name="no_note" value="1" />
                    <input type="hidden" name="currency_code" value="<?php echo CURREN; ?>" />
                    <input type="hidden" name="bn" value="PP-BuyNowBF" />
                    <!--<input type="image"  id="btnPay" src="<?php echo base_url(); ?>assets/reservas/images/pp_icon.png" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" width="300" height="220">-->
                    &nbsp&nbsp&nbsp<span class="label label-success">Pagar con PayPal</span><br/><br/>
                    <input type="image"  id="btnPay" src="https://www.paypal.com/es_XC/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                    <!--<div id="legendPaypal"><br/>*Pay with PayPal</div>-->
                    <a id="btnFinalizar" class="btn btn-primary pull-right">Finalizar</a>
                </form>


            </div>	
           <div class="rollovericons">
              <a id="btnSiguiente4" class="btn btn-primary pull-right">Confirmar Reservación</a>
            <a id="btnAnterior4" class="btn btn-danger pull-right">Anterior</a> 
           </div>
            
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
<script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/json/jquery.json.js"></script>

<script src="<?php echo base_url() . JS; ?>api/reservacion.js"></script>