<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Productos</title>
        <style>
          body {
            font-family: Arial, Helvetica, sans-serif;
			text-align:center;
			background-image: url(https://m.media-amazon.com/images/I/71EQGktK-VL._AC_UF894,1000_QL80_.jpg);
          }
		  h1{
			font-family: sans-serif;
			color:White;
            margin-top: 40px;
            text-align: center;
			font-size: 40px;
		  }
          .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
            gap: 1em;
          }
          .product-card {
			background-color: #6AB4BA ;
		
			height:700px;
			width: 80%;
			text-align: center;
            color: #063B3F;
            margin: 25px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
          }
		  
		  .product-card img {
		  width: 100%;
		  height: 50%;
		  object-fit: cover;
		  
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
		.product-card {
	  border: 3px solid #ddd;
	  padding: 10px;
	  margin: 10px;
	  transition: box-shadow 0.2s ease-in-out;
	}

	.product-card:hover {
	  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
	  color: #F3E55D;
	}



		.title-container {
  border: 1px solid black;
  background-color: white;
  padding: 10px;
  display: inline-block;
}

.title-container h1 {
  font-family: sans-serif;
  color: white;
  margin: 0;
  text-align: center;
  font-size: 40px;
  border: 2px solid black;
  padding: 10px;
  background-color: black;
}
		
         
		 
		  
         
        </style>
      </head>
	    <body>
		<form method="POST" action="carrito.php">
		<a href="carrito.php">
			<img class="cart-icon" src="https://cdn.pixabay.com/photo/2015/10/22/16/42/icon-1001596_640.png" alt="carro donde podemos ver las compras agregadas">
			</img>
		</a>
		</form>
	  <div class="title-container">
		<h1>ARTICULOS DE NATACION</h1>
	  </div>
        <div class="product-container">
          <xsl:for-each select="Articulos/Articulo">
            <div class="product-card">
              <img src="{imagen/@src}" alt="{nombre/@alt}"/>
              <h2><xsl:value-of select="nombre"/></h2>
              <p><xsl:value-of select="descripcion"/></p>
              <p class="precio">Precio: <xsl:value-of select="precio"/> EU</p>
              <p><span>IVA:</span> <xsl:value-of select="iva"/></p>
			  <p><xsl:value-of select="tipo"/></p>
			  <p>Stock:<xsl:value-of select="cantidad"/></p>
		    <form method="POST" action="compra.php">
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
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>