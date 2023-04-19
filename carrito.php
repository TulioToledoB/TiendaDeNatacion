<?php
		session_start();
		header("Location: compra/compra-".session_id().".xml");
		
?>