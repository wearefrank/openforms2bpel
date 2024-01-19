<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Person" as="node()"><basic:person /></xsl:param>
    <xsl:param name="Organization" as="node()"><basic:organization /></xsl:param>
    
    <xsl:template match="/">
        <basic:initiatingSubject>
            <xsl:choose>
                <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[ends-with(name(), 'DigiD')]">
                    <xsl:copy-of select="$Person" />
                </xsl:when>
                <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[starts-with(name(), 'fieldSetBedrijf')]">
                    <xsl:copy-of select="$Organization" />
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </basic:initiatingSubject>
    </xsl:template>
</xsl:stylesheet>