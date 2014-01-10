<?php
/**
 * Modal class untuk active record dari tabel "list_profil_anggota"
 * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
 * @since 2014.1.9
 * @package application.model.profil_anggota
 */
class Profil_anggota extends CI_Model {

    private $tableName = 'list_profil_anggota';
    private $new = TRUE;

    // modals properties
    private $nama_lengkap = '';
	private $nama_panggilan = '';
	private $asal_daerah = '';
	private $alamat_asal = '';
	private $alamat_bandung = '';
	private $nim = '';
	private $id_anggota = '';
	private $password_hash = '';
	private $role = '';

    public function __construct()
    {
        // Call the Model constructor
        parent::__construct();

        $this->load->database();
    }

    /**
     * Melakukan assignment otomatis dari array asosiatif ke parameter2 model
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $temp Array 	Array asosiatif dari parameter2 model
     **/
    public function assign()
    {
    	foreach ($temp as $key => $var) {
    		if (isset($this->$key)) {
    			$this->$key = $var;
    		}
    	}
    }

    /**
     * Mendapatkan rincian profil anggota berdasarkan id_anggota
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id_anggota int id_anggota
     **/
    public function get_by_id_anggota($id_anggota)
    {
    	$query = $this->db->get_where($this->tableName, array('id_anggota' => $id_anggota));
    	if ($query->num_rows() > 0) {
    		$this->assign($query->row_array());
    		$this->new = FALSE;
    	}
    }

    /**
     * Fungsi gabungan, memasukkan seluruh parameter yang sudah terisi ke database, tergantung apakah data 
     * ini baru atau sudah ada di database. Ia akan mendeteksi parameter $this->new. Jika bernilai TRUE,
     * ia akan melakkan operasi INSERT. Sebaliknya, ia akan melakukan operasi update.
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $temp Mixed 	Jika ia berisi variable, ia akan otomatis dijadikan parameter untuk method $this->assign()
     **/
    public function save($temp = NULL)
    {
    	if ($temp != NULL) {
    		$this->assign($temp);
    	}

    	$data = array(
			'nama_lengkap' => $this->nama_lengkap,
			'nama_panggilan' => $this->nama_panggilan,
			'asal_daerah' => $this->asal_daerah,
			'alamat_asal' => $this->alamat_asal,
			'alamat_bandung' => $this->alamat_bandung,
			'nim' => $this->nim,
			'id_anggota' => $this->id_anggota,
			'password_hash' => $this->password_hash,
			'role' => $this->role,
    	);

    	if ($this->new) {
    		$this->db->insert($this->tableName, $data);
    	} else {
    		$this->id->update($this->tableName, $data, array('id_anggota' => $this->id_anggota));
    	}
    }

    /**
     * Menghapus data dari database
     *
     * @return void
     * @author Abdurrahman Shofy Adianto <azophy@gmail.com>
     * @param $id_anggota Int 	id_anggota
     **/
    public function delete($id_anggota)
    {
    	$this->db->delete($this->tableName, array('id_anggota' => $id_anggota));
    }
 }