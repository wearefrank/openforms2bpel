<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:param name="callbackURL" />
    <xsl:param name="authorization" />
    <xsl:param name="producttype" />

    <xsl:template match="/">
        <item>
            <callbackUrl>
                <xsl:value-of select="$callbackURL" />
            </callbackUrl>
            <auth>
                <xsl:value-of select="$authorization" />
            </auth>
            <kanalen>
                <filters>
                    <producttype>
                        <xsl:value-of select="$producttype" />
                    </producttype>
                </filters>
                <!-- TODO D4: Check if channel is correct. -->
                <naam>objecten</naam>
            </kanalen>
        </item>
    </xsl:template>
</xsl:stylesheet>