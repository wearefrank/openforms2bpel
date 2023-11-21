<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:wsse="http://schemas.xmlsoap.org/ws/2003/06/secext"
    xmlns:wsu="http://schemas.xmlsoap.org/ws/2003/06/utility"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="Security" as="node()"><wsse:Security /></xsl:param>
    
    <xsl:param name="Username" select="''" as="xs:string" />
    <xsl:param name="Password" select="''" as="xs:string" />
    <xsl:param name="Created" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <wsse:Security>
            <wsse:UsernameToken wsu:Id="">
                <xsl:copy-of select="zgw:WrapNullOrSkip('wsse:Username', 'empty', zgw:FromOrderedSource(
                    $Username, 
                    $Security//wsse:Username, 
                    '', 
                    //wsse:Username),
                    'http://schemas.xmlsoap.org/ws/2003/06/secext')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('wsse:Password', 'empty', zgw:FromOrderedSource(
                    $Password, 
                    $Security//wsse:Password, 
                    '', 
                    //wsse:Password),
                    'http://schemas.xmlsoap.org/ws/2003/06/secext')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('wsu:Created', 'empty', zgw:FromOrderedSource(
                    $Created, 
                    $Security//wsu:Created, 
                    '', 
                    //wsu:Created,
                    current-dateTime()),
                    'http://schemas.xmlsoap.org/ws/2003/06/secext')"/>
            </wsse:UsernameToken>
        </wsse:Security>
    </xsl:template>
</xsl:stylesheet>