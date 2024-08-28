<xsl:stylesheet exclude-result-prefixes="#all" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="#all" />
    <xsl:mode on-no-match="deep-copy" on-multiple-match="fail"/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="/">
        <formdata>
            <xsl:apply-templates select="//record/data/data/*" />
            <xsl:apply-templates select="//record/data/extraVars" />
        </formdata>
    </xsl:template>
</xsl:stylesheet>