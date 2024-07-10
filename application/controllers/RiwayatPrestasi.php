<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RiwayatPrestasi extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('RiwayatPrestasi_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['title'] = 'Riwayat Prestasi';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['riwayat_prestasi'] = $this->RiwayatPrestasi_model->getAllPrestasi();
        $data['atlet'] = $this->db->get('atlet')->result_array(); // Ambil daftar atlet
        
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('riwayatprestasi/index', $data);
        $this->load->view('templates/footer');
    }
    
    public function add()
    {
        $this->form_validation->set_rules('atlet_id', 'Atlet', 'required');
        $this->form_validation->set_rules('tahun', 'Tahun', 'required');
        $this->form_validation->set_rules('kejuaraan', 'Kejuaraan', 'required');
        $this->form_validation->set_rules('prestasi', 'Prestasi', 'required');
    
        if ($this->form_validation->run() == false) {
            $this->index();
        } else {
            $data = [
                'atlet_id' => $this->input->post('atlet_id'),
                'tahun' => $this->input->post('tahun'),
                'kejuaraan' => $this->input->post('kejuaraan'),
                'prestasi' => $this->input->post('prestasi')
            ];
            $this->db->insert('prestasi', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Prestasi baru telah ditambahkan!</div>');
            redirect('riwayatprestasi');
        }
    }
    
    
    public function edit($id)
    {
        $data['title'] = 'Edit Prestasi';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['prestasi'] = $this->RiwayatPrestasi_model->getPrestasiById($id);
        $data['atlet'] = $this->db->get('atlet')->result_array(); // Ambil daftar atlet
     
        $this->form_validation->set_rules('atlet_id', 'Atlet', 'required');
        $this->form_validation->set_rules('tahun', 'Tahun', 'required');
        $this->form_validation->set_rules('kejuaraan', 'Kejuaraan', 'required');
        $this->form_validation->set_rules('prestasi', 'Prestasi', 'required');
     
        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('riwayatprestasi/edit', $data);
            $this->load->view('templates/footer');
        } else {
            $update_data = [
                'atlet_id' => $this->input->post('atlet_id'),
                'tahun' => $this->input->post('tahun'),
                'kejuaraan' => $this->input->post('kejuaraan'),
                'prestasi' => $this->input->post('prestasi')
            ];
            $this->db->where('id', $id);
            $this->db->update('prestasi', $update_data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Prestasi telah diupdate!</div>');
            redirect('riwayatprestasi');
        }
    }
    
    
    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('prestasi');
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Prestasi telah dihapus!</div>');
        redirect('riwayatprestasi');
    }
}
