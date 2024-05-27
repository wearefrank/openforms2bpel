<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:document="http://www.emaxx.org/functional/cases/document"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="ZgwEnkelvoudigInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Document" as="node()"><document:document /></xsl:param>
    
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="Provider" as="node()"><document:provider /></xsl:param>
    <xsl:param name="TargetSystems" as="node()"><document:document /></xsl:param>

    <xsl:template match="/">
        <document:readDocument>
            <document:documentIdMessage>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:referenceNumber', 'empty', zgw:FromOrderedSource(
                    $ReferenceNumber,
                    $Document//document:referenceNumber,
                    $ZgwEnkelvoudigInformatieObject//identificatie,
                    //document:referenceNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                    $Provider,
                    $Document//document:provider,
                    '',
                    //document:provider)"/>
                <document:targetSystem>
                    <document:code />
                    <document:referenceNumber />
                </document:targetSystem>
            </document:documentIdMessage>
        </document:readDocument>
    </xsl:template>
</xsl:stylesheet>