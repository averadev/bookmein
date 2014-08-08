<?php
$this->load->view('admin/vwHeader');
?>

<div class="page-header container">
    <h1><small>Usuarios</small></h1>
</div>

<div id="slider" class="owl-carousel">

    <!-- __________ TABLA __________ -->
    <div class="item">
        <div class="container" style="width:900px;">
            <div class="input-group">
                <input id="txtSearch" type="text"placeholder="Busqueda por nombre" class="form-control">
                <span class="input-group-addon btnSearch"><i class="fam-search"></i> Buscar</span>
            </div>
            <br/>
            <p class="bg-info">La información se almaceno satisfactoriamente.</p>

            <div class="panel panel-default" >
                <!-- Default panel contents -->
                <div class="panel-heading">Lista de Usuarios <span style='float:right; margin-top: -7px;'><a href='#' title='View' class="btn btn-primary btnAdd"><i class="fam-plus"></i> Usuario  </a></span></div>

                <!-- Table -->
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Usuario</th>
                            <th>Correo</th>
                            <th>Puesto</th>
                            <th>Notificaciones</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="bodyTable">
                    </tbody>
                </table>
            </div>

            <ul class="pagination">
            </ul>
        </div><!-- /.container -->
    </div>

    <!-- __________ FORMULARIO __________ -->
    <div class="item">
        <div class="container" style="width:620px;">
            <form role="form">
                <p class="bg-danger">Los campos marcados (<span class="redPoint">*</span>), son obligatorios...</p>
                <p class="bg-danger2">El correo (<span class="redPoint">*</span>), no es válido</p>

                <input id="hideID" type="hidden" value="0">
                <table>
                    <tr>
                        <td width="450">
                            <div class="form-group">
                                <label for="txtNombre"><span class="redPoint">*</span>Nombre</label>
                                <input type="text" class="form-control" id="txtNombre">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="txtApellido"><span class="redPoint">*</span>Apellido</label>
                                <input type="text" class="form-control" id="txtApellido">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="txtUsuario"><span class="redPoint">*</span>Usuario</label>
                                <input type="text" class="form-control" id="txtUsuario">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="txtContr"><span class="redPoint">*</span>Contraseña</label>
                                <input type="password" class="form-control" id="txtContr">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="txtCorreo"><span class="redPoint">*</span>Correo</label>
                                <input type="text" class="form-control" id="txtCorreo">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="txtCorreo"><span class="redPoint">*</span>Puesto</label>
                                <input type="text" class="form-control" id="txtPuesto">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="checkbox">
                                <label for="checkNotif">
                                    <input type="checkbox" id="checkNotif"> Recibir notificaciones de reservación
                                </label>
                            </div>
                            <!--<label for="checkNotif">Recibir notificaciones de reservación:</label><input type="checkbox" class="form-control" id="checkNotif">-->
                        </td>
                    </tr>
                </table>

                <a id="btnGuardar" class="btn btn-primary pull-right">Guardar</a>
                <a id="btnCancelar" class="btn btn-danger pull-right">Cancelar</a>
            </form>
        </div>
    </div>
</div>


<!-- __________ HIDE MODAL __________ -->
<div class="modal fade modal-delete" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-body">
                <h4 class="modal-title" id="mySmallModalLabel">¿Desea eliminar el registro?</h4>
                <br/><span id="delNombre"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button id="btnDeleteModal" type="button" class="btn btn-primary" data-dismiss="modal">Eliminar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<?php
$this->load->view('admin/vwFooter');
?>
<script src="<?php echo base_url() . JS; ?>api/common.js"></script>
<script src="<?php echo base_url() . JS; ?>api/usuario.js"></script>