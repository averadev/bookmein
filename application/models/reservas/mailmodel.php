<?php

class MailModel extends CI_Model {
    
    function send_mail($c,$codeReserve,$data){ 
        //$email = "gengiscb@gmail.com";
        $customer = json_decode($c);
        //$total = count($data);
        $subject = 'Notificación de reservación';
        $message = 'El cliente <br/>';
        $message = $message. 'Nombre:'.$customer->name . " " . $customer->aPaterno . " " . $customer->aMaterno."<br/>" ;
        $message = $message. 'Correo: '.$customer->email.'<br/>';
        $message = $message. 'Tel: '.$customer->phone.'<br/>';
        $message = $message. 'Realizo la reservación con el código '.$codeReserve;
        foreach ($data as $e){
            //$message = $message.$e;
            $email_data = array(
            'from' => array('name' => 'Admin'),
            'to' => array('email' => $e),
            'subject' => $subject,
            'message' => $message
        ); 
            $this->email_class->send_email($email_data); 
        }   
        
        unset($data);
    }
}
