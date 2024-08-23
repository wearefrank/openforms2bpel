<xsl:stylesheet exclude-result-prefixes="#all" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    >
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:mode on-no-match="deep-skip" on-multiple-match="fail" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="Alpha2" select="''" as="xs:string" />
    <xsl:param name="Alpha3" select="''" as="xs:string" />

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$Alpha3 = 'eng'"><xsl:value-of select="'en_GB'" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="concat(concat($Alpha2, '_'), upper-case($Alpha2))" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>