<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Tienda Vintage</title>
        <style>
		  body{
		  color:black;
		  background-image: url(https://img.freepik.com/foto-gratis/resumen-superficie-agua-piscina-fondo-reflejo-luz-sol_74190-8510.jpg);
		  }
          .nombre-pagina {
            text-align: center;
			color: black;
			font-family: sans-serif;
			background-color:  #70E7F1;
			border-radius:10px;
			margin: 10px; 200px; 10px; 200px;
			padding: 10px;
          }
		  

          table {
            text-align: justify;
			margin:auto;
			font-family: serif;
			font-size: 30px;
			background-color: #70E7F1;
          }
		  .encabezado{
		  background-color: #44898F;
		  }
		  
		  .btn{
		background-color: #70E7F1;
		color: black;
		text-align: justify;
		border: none;
		}
		
		.btn:hover{
		background-color: #44898F;
		}
		.cart-icon {
					  background-size: contain;
					  width: 60px;
					  height: 60px;
					  position: fixed;
					  top: 20px;
					  right: 20px;
					  background-color: white
					}

        </style>
      </head>
      <body>
	  <form method="POST" action="carrito.php">
		<a href="carritoV.php">
			<img class="cart-icon" src="https://cdn.pixabay.com/photo/2015/10/22/16/42/icon-1001596_640.png" alt="carro donde podemos ver las compras agregadas">
			</img>
		</a>
		</form>
        <div class="nombre-pagina">
          <h1>Artículos de Natacion</h1>
        </div>
        <table>
          <tr class="encabezado">
            <th>Código</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>IVA</th>
            <th>Tipo</th>
			<th>Cantidad</th>
          </tr>
          <xsl:for-each select="Articulos/Articulo">
            <tr>
              <td><xsl:value-of select="codigo"/></td>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="descripcion"/></td>
              <td><xsl:value-of select="precio"/></td>
              <td><xsl:value-of select="iva"/></td>
		      <td><xsl:value-of select="tipo"/></td>
			 <td>
				 <form method="POST" action="compraV.php">
				<input type="hidden" name="codi">
					<xsl:attribute name="value">
					<xsl:value-of select="codigo"/>
					</xsl:attribute>
				</input>
				<input type="hidden" name="nom">
					<xsl:attribute name="value">
					<xsl:value-of select="nombre"/>
					</xsl:attribute>
				</input>
				<input type="number" value="cantidad" name="cantidad" min="1">
					<xsl:attribute name="max">
					<xsl:value-of select="cantidad"/>
					</xsl:attribute>
				</input>
				<input type="hidden" name="preu">
					<xsl:attribute name="value">
					<xsl:value-of select="precio"/>
					</xsl:attribute>
				</input>
				
				<input type="submit" class="btn" value="Agregar al carrito"/>
			</form>
			  </td>
		    </tr>
		  </xsl:for-each>
		</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
