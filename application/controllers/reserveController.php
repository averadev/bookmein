<?php

class reserveController extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('usuario_db');
        $this->load->model('reservas/RoomsTypeModel', 'roomsType');
        $this->load->model('reservas/CustomerModel', 'customer');
        $this->load->model('reservas/ReserveModel', 'reserve');
        $this->load->library('email_class');
        $this->load->model('reservas/MailModel', 'mail');
    }

    // Funcion principal
    function index() {

        $this->load->view(
                "vwBookMeIn", array(
            'selRoomsType' => $this->roomsType->getAllTypes(),
            'allState' => $this->roomsType->getAllState()
                )
        );
    }

    function saveReserve() {
        // Se guarda el cliente
        $customerId = $this->customer->save($this->input->post("customer", TRUE));
        // Se guarda los datos generales de reserva
        $reserveId = $this->reserve->save($this->input->post("arriveDate"), $this->input->post("departureDate"), $customerId);
        //Se guadan la habitaciones seleccionadas
        $this->reserve->saveXrefRoom($reserveId, $this->input->post("xrefRooms", TRUE));
        $reserveCode = $this->reserve->getReserveCode($reserveId);
        //$emails = $this->user->getAllReceiveNotification();
        $data = $this->usuario_db->getAllReceiveNotification();
        $this->mail->send_mail($this->input->post("customer", TRUE), $reserveCode, $data);
        /* $name = 'gengis';
          $email = 'gengiscb@gmail.com';
          $subject = 'jnxsn';
          $message = 'nsjnxjsnx';
          $email_data = array(
          'from' => array('name' => 'Admin'),
          'to' => array('email' => $email, 'name' => $name),
          'subject' => $subject,
          'message' => $message
          );
          $this->email_class->send_email($email_data); */
        header('Content-Type: application/json', true);
        echo json_encode(array(
            'code' => $reserveCode,
            'idReserve' => $reserveId
        ));
    }

    function saveReserveExpedia() {
        $url_expedia = "https://simulator.expediaquickconnect.com/connect/br";
        $url_booking_retrieval = "http://www.expediaconnect.com/EQC/BR/2014/01";
        $hotel_id = 211;
        $username = "geekbucket";
        $password = "ECLPASS";

        $request_xml = '<?xml version="1.0" encoding="UTF-8"?>'
                . '<BookingRetrievalRQ xmlns="' . $url_booking_retrieval . '">'
                . '<Authentication username="' . $username . '" password="' . $password . '"/>'
                . '<Hotel id="' . $hotel_id . '"/>'
                . '</BookingRetrievalRQ>';

        //inicializar opciones del CURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url_expedia);
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 4);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $request_xml);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: close'));

        //ejecuta la peticion y gu the request and also time the transaction ( optional )
        $result = curl_exec($ch);

        //verificar  errores ( again optional )
        if (curl_errno($ch)) {
            $result = 'ERROR -> ' . curl_errno($ch) . ': ' . curl_error($ch);
        } else {
            $returnCode = (int) curl_getinfo($ch, CURLINFO_HTTP_CODE);
            switch ($returnCode) {
                case 200:
                    break;
                default:
                    $result = 'HTTP ERROR -> ' . $returnCode;
                    break;
            }
        }

        //Cerrar conexion
        curl_close($ch);
        //generar objeto xml del resultado
        $xml = simplexml_load_string($result);
        //var_dump($xml->Bookings->Booking);
        $count = 0;
        foreach ($xml->Bookings->Booking as $book) {
            if ($book['type'] == "Book") {
                $expedia_reservacion_id = (String) $book['id'];
                $countExpedia = $this->reserve->getExpediaReserve($expedia_reservacion_id);
                if ($countExpedia <= 0) {
                    $room_id = (String) $book->RoomStay['roomTypeID'];
                    $habitacion_id = (String)$this->roomsType->getRoomId($room_id);
                    /*                     * Datos Cliente* */
                    $nombre = (String) $book->PrimaryGuest->Name['givenName'];
                    $ap_paterno = (String) $book->PrimaryGuest->Name['middleName'];
                    $ap_materno = (String) $book->PrimaryGuest->Name['surname'];
                    $completo = (String) $book->PrimaryGuest->Name['givenName'] . " " . $book->PrimaryGuest->Name['middleName'];
                    $telefono = (String) $book->PrimaryGuest->Phone['number'];
                    $email = (String) $book->PrimaryGuest->Email;
                    $apellido = (String) $book->PrimaryGuest->Name['middleName'];
                    $cliente = array(
                        'name' => utf8_encode($nombre),
                        'aPaterno' => utf8_encode($ap_paterno),
                        'aMaterno' => utf8_encode($ap_materno),
                        'phone' => $telefono,
                        'email' => $email,
                        'aPaterno' => $apellido
                    );
                    // Se guarda el cliente
                    $customerId = $this->customer->save(json_encode($cliente));
                    /** * Datos Reservacion* */
                    $llegada_datetime = new DateTime((String) $book->RoomStay->StayDate ['arrival']);
                    $salida_datetime = new DateTime((String) $book->RoomStay->StayDate ['departure']);
                    $fecha_llegada = $llegada_datetime->format('d/m/Y');
                    $fecha_salida = $salida_datetime->format('d/m/Y');
                    // Se guarda los datos generales de reserva
                    $reserveId = $this->reserve->saveExpedia($fecha_llegada, $fecha_salida, $customerId, $expedia_reservacion_id);
                    /*                     * *Datos Habitacion* */
                    $room_price = (String) $book->RoomStay->Total['amountAfterTaxes'];
                    $room_quantity = "1";

                    $room = array(array(
                        'roomId' => $habitacion_id,
                        'price' => $room_price,
                        'quantity' => $room_quantity,
                        'priceType' => '0',
                        'priceTypeId' =>'0'
                    ));
                    //Se guadan la habitaciones seleccionadas
                    $this->reserve->saveXrefRoom($reserveId, json_encode($room));
                    $count++;
                }
            }
        }
        header('Content-Type: application/json', true);
        echo json_encode(array(
            'guardados' => $count
        ));
    }

    /**
     * Obtiene la disponibilidad de las habitaciones
     * return application/json
     */
    function getRoomsAvaliable() {
        $arriveDate = $this->input->post('arriveDate');
        $departureDate = $this->input->post('departureDate');

        $roomsInfo = $this->roomsType->getRoomsAvailability($arriveDate, $departureDate);
        $roomsAvailable = $this->roomsType->getRoomsFree($arriveDate, $departureDate);

        $array = array(
            'result' => $roomsInfo,
            'available' => $roomsAvailable
        );

        header('Content-Type: application/json', true);
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
