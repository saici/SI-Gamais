<?php
/**
 * Modal class untuk active record dari tabel "list_kehadiran_mentoring"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.22
 * @package application.model.kehadiran_mentoring
 */
class Kehadiran_mentoring extends MY_Model {

    protected $tableName = 'list_kehadiran_mentoring';
    protected $primaryKey = 'id';
    
    /**
     * Mendapatkan rincian kehadiran pada pertemuan oleh id_pertemuan
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_pertemuan
     **/
    public function get_by_id_pertemuan($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_pertemuan' => $id));
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