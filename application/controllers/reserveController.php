<?php

class reserveController extends CI_Controller{
	
	function __construct(){		
		parent::__construct();		
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('reservas/RoomsTypeModel','roomsType');
		$this->load->model('reservas/CustomerModel','customer');
		$this->load->model('reservas/ReserveModel','reserve');
	}

	// Funcion principal
	function index(){	
				
		$this->load->view(
			"vwBookMeIn",
			array(
				'selRoomsType'	=> $this->roomsType->getAllTypes(),
				'allState'		=> $this->roomsType->getAllState()
			)
		);		
	}

	function saveReserve(){
		// Se guarda el cliente
		$customerId = $this->customer->save($this->input->post("customer", TRUE));
		// Se guarda los datos generales de reserva
		$reserveId = $this->reserve->save($this->input->post("arriveDate"),$this->input->post("departureDate"),$customerId);
		//Se guadan la habitaciones seleccionadas
		$this->reserve->saveXrefRoom($reserveId,$this->input->post("xrefRooms",TRUE));
		$reserveCode = $this->reserve->getReserveCode($reserveId);
		
		header('Content-Type: application/json',true);
    	echo json_encode(array(
    		'code' => $reserveCode,
    		'idReserve' => $reserveId    	
    	)); 
	}
	
	
	/**
	 * Obtiene la disponibilidad de las habitaciones
	 * return application/json
	 */
	function getRoomsAvaliable() {
    	$arriveDate = $this->input->post('arriveDate');
    	$departureDate= $this->input->post('departureDate');    	
    	
    	$roomsInfo = $this->roomsType->getRoomsAvailability($arriveDate,$departureDate);
    	$roomsAvailable =  $this->roomsType->getRoomsFree($arriveDate,$departureDate);
    	
    	$array = array(
    		'result' => $roomsInfo,
    		'available' => $roomsAvailable
    	);
    	
    	header('Content-Type: application/json',true);
    	echo json_encode($array);    	
   }
	
	/**
	 * Obtiene la disponibilidad de las habitaciones
	 * return application/json
	 */
	function paySuccess() {
		
    	$txn_id = $_POST['item_number'];
		$this->reserve->updateStatus($txn_id, 2);
   }
  
}
