<?php
	session_start();
	
	$compra_path = $_SERVER['DOCUMENT_ROOT'] . '/M4/xslt/compra/compra-';
	$file_path = $compra_path.session_id().".xml";
	
	
	$codigo = floatval($_POST['codi']);
	$nombre = floatval($_POST['nom']);
	$cantidad = floatval($_POST['cantidad']);
	$precio = floatval($_POST['preu']);
	$iva = floatval($_POST['iva']);
	
	$producto = $precio * $cantidad;
	 
	$total = number_format($producto, 2, ',', '.').' €';
	

	//abertura y creacion del fitxer xml
	if(!file_exists($file_path)) {
		$gestor = fopen($file_path, "w");
	
	
	fwrite($gestor, "<?xml version='1.0' encoding='UTF-8'?>");
    fwrite($gestor, PHP_EOL);
	fwrite($gestor, "<?xml-stylesheet href='carrito.xsl'	type='text/xsl'?>");
    fwrite($gestor, PHP_EOL);
	
	fwrite($gestor, '<compra>');
	fwrite($gestor, PHP_EOL);
    fwrite($gestor, "\t");
    fwrite($gestor, '<article>');
    fwrite($gestor, PHP_EOL);
    fwrite($gestor, "\t");
    fwrite($gestor, "\t");
	fwrite($gestor, '<nombre>');
    fwrite($gestor, $_POST['nom']);
    fwrite($gestor, '</nombre>');
	fwrite($gestor, PHP_EOL);
	fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '<codigo>');
    fwrite($gestor, $_POST['codi']);
    fwrite($gestor, '</codigo>');
    fwrite($gestor, PHP_EOL);
    fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '<cantidad>');
	fwrite($gestor, $_POST['cantidad']);
    fwrite($gestor, '</cantidad>');
    fwrite($gestor, PHP_EOL);
    fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '<precio>');
	fwrite($gestor, $_POST['preu']);
    fwrite($gestor, '</precio>');
	fwrite($gestor, PHP_EOL);
	fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '<total>');
	fwrite($gestor, $total);
    fwrite($gestor, '</total>');
    fwrite($gestor, PHP_EOL);
	fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '<Iva>');
	fwrite($gestor, $_POST['iva']);
    fwrite($gestor, '</Iva>');
    fwrite($gestor, PHP_EOL);
	fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    
    fwrite($gestor, PHP_EOL);
    fwrite($gestor, "\t");
    fwrite($gestor, "\t");
    fwrite($gestor, '</article>');
    fwrite($gestor, PHP_EOL);
    fwrite($gestor, '</compra>');
	
	//se cierra el archivo
	fclose($gestor);
	}
	else {
		$xml = simplexml_load_file($file_path);
		$article = $xml->xpath("//article[codigo='{$_POST['codi']}']")[0] ?? null;
	
	if ($article) {
       
        $qtat_node = $article->cantidad[0];
        $qtat_node[0] = intval($qtat_node) + $_POST['cantidad'];
        $article->total[0] = number_format(floatval($article->precio[0]) * intval($qtat_node) , 2, ',', '.').' €';
    }else{
		
		$article = $xml->addChild('article');
		$article->addChild('nombre', $_POST['nom']);
		$article->addChild('codigo', $_POST['codi']);
		$article->addChild('cantidad', $_POST['cantidad'] ?? 0);
		$article->addChild('precio', $_POST['preu']);
		$article->addChild('iva', $_POST['iva']);
		$article->addChild('total', $total);
		
		$dom = new DOMDocument("1.0");
		$dom->preserveWhiteSpace = false;
		$dom->formatOutput = true;
		$dom->loadXML($xml->asXML());
		$formatted_xml = $dom->saveXML();
		$formatted_xml = str_replace("\n", PHP_EOL, $formatted_xml);
		$formatted_xml = str_replace("\t", "  ", $formatted_xml);
		
		file_put_contents($file_path, $formatted_xml);
	}
  }
	
	//ob_end_clean();

	header('Location: tiendaM.xml');
	
?>