<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RiwayatPrestasi_model extends CI_Model {

    // Method to get all records
    public function getAllPrestasi() {
        $this->db->select('prestasi.*, atlet.name as atlet_name');
        $this->db->from('prestasi');
        $this->db->join('atlet', 'prestasi.atlet_id = atlet.id');
        $query = $this->db->get();
        return $query->result_array();
    }

    // Method to get a specific record by ID
    public function getPrestasiById($id) {
        $this->db->select('prestasi.*, atlet.name as atlet_name');
        $this->db->from('prestasi');
        $this->db->join('atlet', 'prestasi.atlet_id = atlet.id');
        $this->db->where('prestasi.id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }
}
