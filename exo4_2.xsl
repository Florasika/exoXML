<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <stock_entreprise>
            <xsl:for-each select="liste/item">
                <xsl:variable name="filiale" select="nom"/>
                <xsl:for-each select="document(path)/shop/article">
                    <xsl:variable name="nomArticle" select="nom"/>
                    <xsl:variable name="articles" select="//item[nom != $filiale]/document(path)/shop/article[nom = $nomArticle]"/>
                    <xsl:variable name="stockTotal" select="sum(($articles/qtity, qtity))"/>
                    <xsl:variable name="ventesTotal" select="sum(($articles/ventes, ventes))"/>
                    <article>
                        <nom><xsl:value-of select="$nomArticle"/></nom>
                        <qtity><xsl:value-of select="$stockTotal"/></qtity>
                        <ventes><xsl:value-of select="$ventesTotal"/></ventes>
                    </article>
                </xsl:for-each>
            </xsl:for-each>
        </stock_entreprise>
    </xsl:template>
</xsl:stylesheet>