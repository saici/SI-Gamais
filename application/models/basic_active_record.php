<?php
/**
 * Template class active record untuk semua class active record lainnya
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.21
 * @package application.model.profil_anggota
 */
class Basic_active_record extends CI_Model {

    private $tableName = 'list_profil_anggota';
    private $primaryKey = 'id_anggota';
    
    public function __construct()
    {
        // Call the Model constructor
        parent::__construct();

        $this->load->database();
    }

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

    /**
     * melakukan operasi insert
     *
     * @param $data array Pasangan key => var berisi elemen yang hendak di-insert
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     **/
    public function insert($data)
    {
        $this->db->insert($this->tableName, $data);
    }

    /**
     * update data yang telah ada
     *
     * @param $data array   Pasangan key => var berisi elemen yang hendak di-insert
     * @param $id   int     Id dari data anggota yang hendak diubah
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     **/
    public function update($data, $id)
    {
        $this->id->update($this->tableName, $data, array($this->primaryKey => $id));
    }

    /**
     * Menghapus data dari database
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id   Int     id_anggota yang hendak dihapus
     **/
    public function delete($id)
    {
        $this->db->delete($this->tableName, array($this->primaryKey => $id));
    }
 }