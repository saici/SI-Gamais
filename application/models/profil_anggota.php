<?php
/**
 * Modal class untuk active record dari tabel "list_profil_anggota"
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.9
 * @package application.model.profil_anggota
 */
class Profil_anggota extends MY_Model {

    protected $tableName = 'list_profil_anggota';
    protected $primaryKey = 'id_anggota';
    
    /**
     * Mendapatkan rincian profil anggota berdasarkan id_anggota
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id int id_anggota
     **/
    public function get_by_id_anggota($id)
    {
    	$query = $this->db->get_where($this->tableName, array($this->primaryKey => $id));
    	if ($query->num_rows() > 0) {
    		return($query->row_array());
    	}
    }

 }