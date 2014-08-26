<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Booke Me In</title>
        <script type="text/javascript">
            var CURRENCY = '<?php echo CURREN; ?>';
        </script>
        <link href="<?php echo HTTP_CSS_PATH; ?>bootstrap.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>icons.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>jquery.bxslider.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>owl.carousel.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>datepicker.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>typeahead.css" rel="stylesheet">
        <link href="<?php echo HTTP_CSS_PATH; ?>bookme.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/reservas/css/plugins/spinnercontrol/jquery.spinnercontrol.css"/>
    </head>
    <body>
        <div class="page-header container">
            <h1><small>Reservaciones</small></h1>
        </div>
<!--        <div class="container" style="width:700px;">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="container-fluid">
                             Collect the nav links, forms, and other content for toggling 
                            <div class="expand" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="#">Link</a></li>
                                    <li class="divider"><a href="#">Link</a></li>
                                    <li class="divider"><a href="#">Link</a></li>
                                    <li class="divider"><a href="#">Link</a></li>
                                </ul>
                            </div> /.navbar-collapse 
                        </div> /.container-fluid 
                    </nav>
            <ul id="pasos" class="nav nav-pills nav-justified">
                <li id="paso1" class="active"><a href="#">Paso 1</a></li>
                <li id="paso2"><a href="#">Paso 2</a></li>
                <li id="paso3"><a href="#">Paso 3</a></li>
                <li id="paso4"><a href="#">Paso 4</a></li>
            </ul>
            <hr>
        </div>-->
        <div id="slider" class="owl-carousel">
            <!-- __________ TAB 1 Panel Reservacion __________ -->
            <div class="item">
                <div class="container" style="width:700px;">
                    <table class="table table-bordered">
                        <tr>
                            <td width="280">
                                <div>
                                    <a href="#" class="btn small" id="startDateBooking" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-03"><span class="redPoint">*</span>Entrada</a>
                                <span></span>
                                </div>
                                <div>
                                    <a href="#" class="btn small" id="endDateBooking" style="padding: 6px 0;" data-date-format="yyyy-mm-dd" data-date="2014-03-20"><span class="redPoint">* </span>Salida </a>
                                <span></span>
                                </div>
                                
                            </td>
                            <td width="280">
                                
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
                    </div>
                </div>

            </div>
            <!-- __________ Tab 2 reservacion __________ -->
            <div class="item">
                <div class="container" style="width:700px;">
                    <div class="alert alert-danger" role="alert"></div>
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
                                <div class="alert alert-danger" role="alert"></div>
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
                    <div class="rollovericons">
                        <a id="btnSiguiente3" class="btn btn-primary pull-right">Siguiente</a>
                        <a id="btnAnterior" class="btn btn-danger pull-right">Anterior</a>
                    </div>

                </div>
            </div>
            <!-- Tab 3 reservacion -->
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
                    <div class="alert alert-danger" role="alert"></div>

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
                            <!--<label class="label label-success">Pagar con PayPal</label><br/>-->
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
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>jquery.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>owl.carousel.min.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>bootstrap.min.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>das.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>api/common.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/jtemplates/jquery-jtemplates.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/jshashtable/jshashtable.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/format/jquery.format.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/numberformatter/jquery.numberformatter.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/spinnercontrol/jquery.spinnercontrol.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>assets/reservas/js/plugins/json/jquery.json.js"></script>
        <script type="text/javascript" src="<?php echo HTTP_JS_PATH; ?>api/bookme.js"></script>
    </body>
</html> 
