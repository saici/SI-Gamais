<?php
/**
 * Modal class untuk active record dari tabel "list_kehadiran"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.22
 * @package application.model.kehadiran
 */
class Kehadiran extends MY_Model {

    protected $tableName = 'list_kehadiran';
    protected $primaryKey = 'id';
        
    /**
     * Mendapatkan rincian kehadiran pada pertemuan oleh id_event
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_event
     **/
    public function get_by_id_event($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_event' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }
    
    /**
     * Mendapatkan riwayat kehadiran pertemuan dari id_anggota
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