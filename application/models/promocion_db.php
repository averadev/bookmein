<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
Class promocion_db extends CI_MODEL
{
 
    public function __construct(){
        parent::__construct();
    }

    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function get($id){
        $this->db->from('promocion');
        $this->db->where('id', $id);
        return  $this->db->get()->result();
    }
 
    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function getAll(){
        $this->db->from('promocion');
        $this->db->where('status = 1');
        return  $this->db->get()->result();
    }
 
    /**
     * Obtiene la busqueda de los registros activos del catalogo
     */
    public function getSearch($texto, $pagina){
        $this->db->from('promocion');
        $this->db->where('status = 1');
        $this->db->where("nombre like '%".$texto."%'");
        if ($pagina > 0){
            $this->db->limit(10, (($pagina - 1)*10));
        }
        return  $this->db->get()->result();
    }
 
    /**
     * Obtiene la cuenta de registros de la consulta
     */
    public function getCount($texto){
        $this->db->select('count(id) as total');
        $this->db->from('promocion');
        $this->db->where('status = 1');
        $this->db->where("nombre like '%".$texto."%'");
        return  $this->db->get()->result();
    }
 
    /**
     * Guarda el registro
     */
    public function insert($data){
        $this->db->insert('promocion', $data);
        return $this->db->insert_id();
    }
 
    /**
     * Actualiza el registro
     */
    public function update($data){
        $this->db->where('id', $data['id']);
        $this->db->update('promocion', $data);
    }
 
    /**
     * Eliminar el registro
     */
    public function delete($id){
        $this->db->where('id', $id);
        $this->db->update('promocion',  array('status' => 0));
    }
    
    /**
     * Eliminar el registro
     */
    public function verifyDates($fechaInicio, $fechaFin, $id){
        $this->db->from('promocion');
        $this->db->where("status = 1");
        $this->db->where("id <> ".$id);
        $this->db->where("(( '".$fechaInicio."' between fechaInicio and  fechaFin) OR ( '".$fechaFin."' between fechaInicio and  fechaFin) OR  (fechaInicio between '".$fechaInicio."' and '".$fechaFin."'))");
        return  $this->db->get()->result();
    }
 
    /**
     * Eliminar el registro
     */
    public function deleteRoom($tempId){
        $this->db->where('promocionId', $tempId);
        $this->db->delete('xref_habitacion_promocion');
    }
 
    /**
     * Eliminar el registro
     */
    public function saveRoom($data){
        return $this->db->insert('xref_habitacion_promocion', $data);
    }
 
    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function getHabitaciones($id){
        $this->db->from('xref_habitacion_promocion');
        $this->db->where("promocionId", $id);
        return  $this->db->get()->result();
    }
 
}
//end model