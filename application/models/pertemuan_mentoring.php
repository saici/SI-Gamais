<?php
/**
 * Modal class untuk active record dari tabel "list_pertemuan_mentoring"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.compact(varname)m>
 * @since 2014.1.22
 * @package application.model.pertemuan_mentoring
 */
class Pertemuan_mentoring extends MY_Model {

    protected $tableName = 'list_pertemuan_mentoring';
    protected $primaryKey = 'id_pertemuan';
    
    /**
     * Mendapatkan rincian pertemuan oleh id_kelompok
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