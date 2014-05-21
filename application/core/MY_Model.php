<?php
/**
 * Template class active record untuk semua class active record lainnya
 *
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.21
 * @package application.model.profil_anggota
 */
class MY_Model extends CI_Model {

    protected $tableName = '';
    protected $primaryKey = 'id';
    
    public function __construct()
    {
        // Call the Model constructor
        parent::__construct();

        $this->load->database();
    }

    /**
     * melakukan operasi insert
     *
     * @param $data     array   Pasangan key => var berisi elemen yang hendak di-insert
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
     * @param $id   int     Id dari record yang hendak diubah
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
     * @param $id   Int     id dari record yang hendak dihapus
     **/
    public function delete($id)
    {
        return $this->db->delete($this->tableName, array($this->primaryKey => $id));
    }
 }