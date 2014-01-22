<?php
/**
 * Modal class untuk active record dari tabel "list_event"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.22
 * @package application.model.event
 */
class Event extends MY_Model {

    protected $tableName = 'list_event';
    protected $primaryKey = 'id_event';
    
    /**
     * Mendapatkan rincian event yang di handle oleh id_pj
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_pj
     **/
    public function get_by_id_pj($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_pj' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }

    /**
     * Mendapatkan rincian event dengan tipe id_tipe_event
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_tipe_event
     **/
    public function get_by_id_tipe_event($id)
    {
        $query = $this->db->get_where($this->tableName, array('id_tipe_event' => $id));
        if ($query->num_rows() > 0) {
            return($query->result_array());
        }
    }
    
 }