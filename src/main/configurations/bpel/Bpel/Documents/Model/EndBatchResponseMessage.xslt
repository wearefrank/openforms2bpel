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
    
    <!-- Create/Enrich -->
    <xsl:param name="EndBatchResponse" as="node()"><document:startBatchResponse /></xsl:param>
    
    <xsl:param name="BatchNumber" select="''" as="xs:string" />
    <xsl:param name="BatchSize" select="''" as="xs:string" />

    <xsl:template match="/">
        <document:endBatchResponse>
            <document:batchEndResponseMessage>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchNumber', 'empty', zgw:FromOrderedSource(
                    $BatchNumber, 
                    $EndBatchResponse//document:batchNumber, 
                    '', 
                    //document:batchNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchSize', 'empty', zgw:FromOrderedSource(
                    $BatchSize, 
                    $EndBatchResponse//document:batchSize, 
                    '', 
                    //document:batchSize),
                    'http://www.emaxx.org/functional/cases/document')"/>
            </document:batchEndResponseMessage>
        </document:endBatchResponse>
    </xsl:template>
</xsl:stylesheet>