<?php
setlocale(LC_ALL,"es_ES@euro","es_ES","esp");
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Reservacion extends CI_Controller {
/**
 * The Saving coupon
 * Author: Alberto Vera Espitia
 * GeekBucket 2014
 *
 */
    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->database('default');
        $this->load->model('reservacion_db');
        //$this->output->enable_profiler(TRUE);
         if (!$this->session->userdata('is_admin_login')) {
            redirect('admin/home');
        }
    }

    public function index() {
        $arr['page'] = 'reservacion';
        $this->load->view('admin/vwReservacion',$arr);
    }

    /**
     * Obtiene la busqueda de los registros activos del catalogo
     */
    public function getSearch(){
        if($this->input->is_ajax_request()){
            // Consulta tamaño consulta
            $pagina = $_POST['pagina'];
            $total = $this->reservacion_db->getCount($_POST['texto'], $_POST['showCo'], $_POST['fechaIni'], $_POST['fechaFin'])[0];
            $data = $this->reservacion_db->getSearch($_POST['texto'], $_POST['showCo'], $_POST['fechaIni'], $_POST['fechaFin'], $pagina);
            // Formato a fechas
            foreach ($data as $obj){
                $obj->fechaLlegada = strftime("%d-%m-%Y", strtotime($obj->fechaLlegada));
                $obj->fechaSalida = strftime("%d-%m-%Y", strtotime($obj->fechaSalida));
                $obj->habitaciones = $this->reservacion_db->getReserHabitacion($obj->id);
            }
            echo json_encode(array(
                'pagina'=>$pagina,
                'total'=>$total->total,
                'data'=>$data));
        }
    }
    /**
     * Obtiene la busqueda de los registros con fecha de llegada  del catalogo
     */
    public function getSearchEntrance(){
        if($this->input->is_ajax_request()){
            // Consulta tamaño consulta
            $pagina = $_POST['pagina'];
            $total = $this->reservacion_db->getCountEntrance($_POST['fecha'])[0];
            $data = $this->reservacion_db->getSearchEntrance($_POST['fecha'], $pagina);
            
            // Formato a fechas
            foreach ($data as $obj){
                $obj->fechaLlegada = strftime("%d-%m-%Y", strtotime($obj->fechaLlegada));
                $obj->fechaSalida = strftime("%d-%m-%Y", strtotime($obj->fechaSalida));
                $obj->habitaciones = $this->reservacion_db->getReserHabitacion($obj->id);
            }
            echo json_encode(array(
                'pagina'=>$pagina,
                'total'=>$total->total,
                'data'=>$data));
        }
    }
    
    public function getSearchExit(){
        if($this->input->is_ajax_request()){
            // Consulta tamaño consulta
            $pagina = $_POST['pagina'];
            $total = $this->reservacion_db->getCountExit($_POST['fecha'])[0];
            $data = $this->reservacion_db->getSearchExit($_POST['fecha'], $pagina);
            
            // Formato a fechas
            foreach ($data as $obj){
                $obj->fechaLlegada = strftime("%d-%m-%Y", strtotime($obj->fechaLlegada));
                $obj->fechaSalida = strftime("%d-%m-%Y", strtotime($obj->fechaSalida));
                $obj->habitaciones = $this->reservacion_db->getReserHabitacion($obj->id);
            }
            echo json_encode(array(
                'pagina'=>$pagina,
                'total'=>$total->total,
                'data'=>$data));
        }
    }

    /**
     * Guarda el registro
     */
    public function save(){
        if($this->input->is_ajax_request()){
            if ($_POST['id'] == '0'){
                unset($_POST['id']);
                $this->reservacion_db->insert($_POST);
            }else{
                $this->reservacion_db->update($_POST);
            }
            echo json_encode(array());
        }
    }
}
