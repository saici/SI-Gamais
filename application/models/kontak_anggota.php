<?php
/**
 * Modal class untuk active record dari tabel "list_kontak_anggota"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.21
 * @package application.model.kontak_anggota
 */
class Kontak_anggota extends MY_Model {

    protected $tableName = 'list_kontak_anggota';
    protected $primaryKey = 'id';
    
    /**
     * Mendapatkan rincian kontak anggota berdasarkan id_anggota
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

 }