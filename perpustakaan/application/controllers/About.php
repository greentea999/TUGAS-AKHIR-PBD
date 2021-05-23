<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class About extends CI_Controller {
	
	public function __construct(){
	parent::__construct();
	}

	public function index()
	{
		$data['title']='Library Cerdas | About';
		$data['header']='<h1>About</h1>';
		$data['konten']='

		<p>Selamat datang di Library Cerdas, di dalam website ini! Disini kalian sebagai Administrator bisa melakukan pengolahan data terhadap user yang mendaftar, dan melakukan peminjaman serta pengembalian buku.</p>
		
		<p>
		<b><span class="glyphicon glyphicon-user"></span>  Author </b> 
		<br/>
		Marchenda Fayza Madjid
		<br/>
		Hanifa Putri Rahima
		</p>	

		<p><b><span class="glyphicon glyphicon-envelope"></span> Email </b>
		<br/>
		fayzaaa_@student.ub.ac.id
		</br>

		</p>	
		';

		$this->load->view('v_dashboard',$data);
	}
	
	
	
}
