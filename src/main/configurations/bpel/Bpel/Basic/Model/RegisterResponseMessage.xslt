<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    xmlns:headerproperties="http://www.emaxx.org/bpel/proces/xsd/headerproperties"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="RegisterResponseMessage" as="node()"><basic:registerResponseMessage /></xsl:param>
    
    <xsl:param name="CorrelationId" select="''" as="xs:string" />
    <xsl:param name="ProcessId" select="''" as="xs:string" />
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <basic:registerResponseMessage>
            <headerproperties:responseProperties>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:correlationId', 'null', zgw:FromOrderedSource(
                    $CorrelationId, 
                    $RegisterResponseMessage//headerproperties:correlationId, 
                    '', 
                    //headerproperties:correlationId),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:processId', 'null', zgw:FromOrderedSource(
                    $ProcessId, 
                    $RegisterResponseMessage//headerproperties:processId, 
                    '', 
                    //headerproperties:processId),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
            </headerproperties:responseProperties>
            <basic:body>
                <basic:referenceNumber>1564654</basic:referenceNumber>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:referenceNumber', 'empty', zgw:FromOrderedSource(
                    $ReferenceNumber, 
                    $RegisterResponseMessage//basic:referenceNumber, 
                    '', 
                    //basic:referenceNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
            </basic:body>
        </basic:registerResponseMessage>
    </xsl:template>
</xsl:stylesheet>