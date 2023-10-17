<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="Add" as="node()*" />
    <xsl:param name="AddValue" as="node()*" />
    <xsl:param name="Type" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <xsl:element name="{name(*)}" namespace="{namespace-uri(*)}">
            <!-- <xsl:copy select="/*"/> -->
            <xsl:for-each select="$AddValue">
                <xsl:element name="{$Type}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>