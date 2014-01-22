<?php
/**
 * Modal class untuk active record dari tabel "list_kelompok"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.21
 * @package application.model.kelompok
 */
class Kelompok extends MY_Model {

    protected $tableName = 'list_kelompok';
    protected $primaryKey = 'id_kelompok';
    
    /**
     * Mendapatkan rincian kelompok berdasarkan id_mentor
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_mentor
     **/
    public function get_by_id_mentor($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_mentor' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }

    /**
     * Mendapatkan rincian kelompok berdasarkan id_kelompok
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_kelompok
     **/
    public function get_by_id_kelompok($id)
    {
        $query = $this->db->get_where($this->tableName, array($this->primaryKey => $id));
        if ($query->num_rows() > 0) {
            return($query->row_array());
        }
    }
    
    /**
     * Mendapatkan rincian kelompok berdasarkan id_tipe_kelompok
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_tipe_kelompok
     **/
    public function get_by_id_tipe_kelompok($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_tipe_kelompok' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }

 }