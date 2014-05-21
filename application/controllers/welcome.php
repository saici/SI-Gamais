<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		//$this->load->view('welcome_message');
		$this->model_driver();
	}

	/**
	 * Driver for all basic active record classes & methods
	 *
	 * @return void
	 * @author @author Abdurrahman Shofy Adianto <azophy@gmail.com>
	 **/
	public function model_driver()
	{

		echo 
		$this->load->model('profil_anggota');
		$this->load->model('amanah_anggota');
		$this->load->model('kontak_anggota');

		$this->load->model('kelompok');
		$this->load->model('anggota_kelompok');
		$this->load->model('tipe_kelompok');

		$this->load->model('pertemuan_mentoring');
		$this->load->model('kehadiran_mentoring');
		$this->load->model('event');
		$this->load->model('kehadiran');

		$profil_anggota = $this->profil_anggota->get_by_id_anggota(1);
		$amanah_anggota = $this->amanah_anggota->get_by_id_anggota($profil_anggota['id_anggota']);
		$kontak_anggota = $this->kontak_anggota->get_by_id_anggota($profil_anggota['id_anggota']);

		$list_kelompok = $this->kelompok->get_by_id_tipe_kelompok(1);
		$kelompok = $this->kelompok->get_by_id_kelompok($list_kelompok[0]['id_kelompok']);
		$anggota_kelompok = $this->anggota_kelompok->get_by_id_kelompok($list_kelompok[0]['id_kelompok']);

		$kelompok2 = $this->kelompok->get_by_id_mentor(1);
		$pertemuan_mentoring = $this->pertemuan_mentoring->get_by_id_kelompok($kelompok2[0]['id_kelompok']);
		$kehadiran_mentoring = $this->kehadiran_mentoring->get_by_id_pertemuan($pertemuan_mentoring[0]['id_pertemuan']);

		$event = $this->event->get_by_id_pj(1);
		$event2 = $this->event->get_by_id_tipe_event(0);
		$kehadiran_event = $this->kehadiran->get_by_id_event($event[1]['id_event']);

		echo '<style>table, tr, td {border:1px solid #000;}</style>';
		echo '<table><tr><td><pre>';
		print_r($profil_anggota);
		print_r($amanah_anggota);
		print_r($kontak_anggota);
		echo "</pre></td><td><pre>";
		print_r($profil_anggota);
		print_r($amanah_anggota);
		print_r($kontak_anggota);
		echo "</pre></td><td><pre>";
		print_r($kelompok2);
		print_r($pertemuan_mentoring);
		print_r($kehadiran_mentoring);
		echo "</pre></td><td><pre>";
		print_r($event);
		print_r($event2);
		print_r($kehadiran_event);
		echo '</pre></td></tr></table>';
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */