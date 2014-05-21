<?php
/**
 * Modal class untuk active record dari tabel "list_anggota_kelompok"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.22
 * @package application.model.anggota_kelompok
 */
class Anggota_kelompok extends MY_Model {

    protected $tableName = 'list_anggota_kelompok';
    protected $primaryKey = 'id';
    
    /**
     * Mendapatkan rincian kelompok dimana anggota dengan id_anggota bergabung
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_anggota
     **/
    public function get_by_id_anggota($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_anggota' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }

    /**
     * Mendapatkan rincian anggota kelompok berdasarkan id_kelompok
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_kelompok
     **/
    public function get_by_id_kelompok($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_kelompok' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }
    
 }