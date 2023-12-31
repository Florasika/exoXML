<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Catalogue du magasin</title>
            </head>
            <body>
                <h1><xsl:value-of select="magasin/nom"/></h1>
                <p><xsl:value-of select="magasin/adresse"/></p>
                <xsl:apply-templates select="magasin/article"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="article">
        <div>
            <h2><xsl:value-of select="nom"/></h2>
            <img src="{illustration}"/>
            <p>Prix de vente : <xsl:value-of select="@prix_vente"/> euros</p>
            <xsl:choose>
                <xsl:when test="qtity = 0">
                    <p>Produit indisponible</p>
                </xsl:when>
                <xsl:when test="qtity &gt; 0 and qtity &lt;= 5">
                    <p>Attention, plus que <xsl:value-of select="qtity"/> éléments en stock</p>
                </xsl:when>
                <xsl:otherwise>
                    <p>Produit disponible</p>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>    
</xsl:stylesheet>