<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    xmlns:document="http://www.emaxx.org/functional/cases/document"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <xsl:param name="DetailedCaseSaveMessage" as="node()"><cases:detailedCaseSaveMessage /></xsl:param>

    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Person" as="node()"><cases:person /></xsl:param>
    <xsl:param name="Organization" as="node()"><cases:organization /></xsl:param>

    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <cases:updateDetailedCase>
            <cases:detailedCaseSaveMessage>
                <cases:case verwerkingssoort="W">
                    <xsl:copy-of select="zgw:WrapNullOrSkip('cases:id', 'skip', zgw:FromOrderedSource(
                        $Id, 
                        '', 
                        $DetailedCaseSaveMessage//cases:case/cases:id, 
                        //cases:case/cases:id),
                        'http://www.emaxx.org/functional/cases')" />
                    <xsl:copy-of select="zgw:WrapNullOrSkip('cases:referenceNumber', 'skip', zgw:FromOrderedSource(
                        $ReferenceNumber, 
                        '', 
                        $DetailedCaseSaveMessage//cases:case/cases:referenceNumber, 
                        //cases:case/cases:referenceNumber),
                        'http://www.emaxx.org/functional/cases')" />
                    <cases:initiatingSubject verwerkingssoort="W">
                        <xsl:choose>
                            <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[ends-with(name(), 'DigiD')]">
                                <xsl:copy-of select="$Person" />
                            </xsl:when>
                            <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[starts-with(name(), 'fieldSetBedrijf')]">
                                <xsl:copy-of select="$Organization" />
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </cases:initiatingSubject>
                </cases:case>
            </cases:detailedCaseSaveMessage>
        </cases:updateDetailedCase>
    </xsl:template>
</xsl:stylesheet>