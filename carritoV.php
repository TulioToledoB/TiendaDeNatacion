<?php
		session_start();
		header("Location: compraV/compra-".session_id().".xml");
		
?>