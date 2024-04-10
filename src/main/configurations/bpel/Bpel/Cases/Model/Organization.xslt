<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Organization" as="node()"><cases:organization /></xsl:param>
    
    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumber" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <cases:organization>
            <xsl:copy-of select="zgw:WrapNullOrSkip('cases:id', 'empty', zgw:FromOrderedSource(
                $Id, 
                $Organization//cases:id,
                '', 
                //cases:id),
                'http://www.emaxx.org/functional/cases')" />
            <xsl:copy-of select="zgw:WrapNullOrSkip('cases:emailAddress', 'empty', zgw:FromOrderedSource(
                $EmailAddress,
                $Organization//cases:emailAddress,
                $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'eMailadres')],
                //cases:emailAddress),
                'http://www.emaxx.org/functional/cases')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('cases:telephoneNumber', 'empty', zgw:FromOrderedSource(
                $TelephoneNumber,
                $Organization//cases:telephoneNumber,
                $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'telefoonnummer')],
                //cases:telephoneNumber),
                'http://www.emaxx.org/functional/cases')"/> 
        </cases:organization>
    </xsl:template>
</xsl:stylesheet>