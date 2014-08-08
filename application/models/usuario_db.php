<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class usuario_db extends CI_MODEL {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function get($id) {
        $this->db->from('admin');
        $this->db->where('admin_id', $id);
        return $this->db->get()->result();
    }

    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function getAll() {
        $this->db->from('admin');
        return $this->db->get()->result();
    }

    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function getAllReceiveNotification() {
//        $this->db->select('email');
//        $this->db->from('admin');
//        $this->db->where('recibe_notificacion=1');
////        foreach ($this->db->get()->result() as $row) {
////            $arrDatos[] = $row->email;
////            return $arrDatos;
////        }
//        return  $this->db->get()->result();
        $data = array();
        $query = $this->db->query("SELECT admin_id, email FROM `admin` WHERE recibe_notificacion = 1");
        foreach ($query->result() as $row) {
            $data[] = $row->email;
        }
        return $data;
    }

    /**
     * Obtiene la busqueda de los registros activos del catalogo
     */
    public function getSearch($texto, $pagina) {
        $this->db->from('admin');
        $this->db->where("nombre like '%" . $texto . "%'");
        if ($pagina > 0) {
            $this->db->limit(10, (($pagina - 1) * 10));
        }
        return $this->db->get()->result();
    }

    /**
     * Obtiene la cuenta de registros de la consulta
     */
    public function getCount($texto) {
        $this->db->select('count(admin_id) as total');
        $this->db->from('admin');
        $this->db->where("nombre like '%" . $texto . "%'");
        return $this->db->get()->result();
    }

    /**
     * Guarda el registro
     */
    public function insert($data) {
        $this->db->insert('admin', $data);
    }

    /**
     * Actualiza el registro
     */
    public function update($data) {
        $this->db->where('admin_id', $data['admin_id']);
        $this->db->update('admin', $data);
    }

    /**
     * Eliminar el registro
     */
    public function delete($id) {
        $this->db->where('admin_id', $id);
        $this->db->delete('admin');
    }

}

//end model