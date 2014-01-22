<?php
/**
 * Modal class untuk active record dari tabel "list_tipe_kelompok"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.21
 * @package application.model.tipe_kelompok
 */
class Tipe_kelompok extends MY_Model {

    protected $tableName = 'list_tipe_kelompok';
    protected $primaryKey = 'id_tipe_kelompok';
    
    /**
     * Mendapatkan rincian kelompok berdasarkan id_tipe_kelompok
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_tipe_kelompok
     **/
    public function get_by_id_tipe_kelompok($id)
    {
        $query = $this->db->get_where($this->tableName, array($this->primaryKey => $id));
        if ($query->num_rows() > 0) {
            return($query->row_array());
        }
    }
 }