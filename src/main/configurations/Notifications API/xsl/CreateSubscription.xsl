<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2">
    <xsl:param name="callbackURL" select="''" as="xs:string" />
    <xsl:param name="authorization" select="''" as="xs:string" />
    <xsl:param name="producttype" select="''" as="xs:string" />

    <xsl:template match="/">
        <ZgwAbonnement>
            <callbackUrl>
                <xsl:value-of select="$callbackURL" />
            </callbackUrl>
            <auth>
                <xsl:value-of select="$authorization" />
            </auth>
            <kanalen>
                <xsl:if test="$producttype">
                    <filters>
                        <producttype>
                            <xsl:value-of select="$producttype" />
                        </producttype>
                    </filters>
                </xsl:if>
                <naam>objecten</naam>
            </kanalen>
        </ZgwAbonnement>
    </xsl:template>
</xsl:stylesheet>