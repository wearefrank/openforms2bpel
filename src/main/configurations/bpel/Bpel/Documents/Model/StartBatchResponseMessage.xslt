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
    <xsl:param name="StartBatchResponse" as="node()"><document:startBatchResponse /></xsl:param>
    
    <xsl:param name="BatchNumber" select="''" as="xs:string" />

    <xsl:template match="/">
        <document:startBatchResponse>
            <document:batchStartResponseMessage>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchNumber', 'empty', zgw:FromOrderedSource(
                    $BatchNumber, 
                    $StartBatchResponse//document:batchNumber, 
                    '', 
                    //document:batchNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
            </document:batchStartResponseMessage>
        </document:startBatchResponse>
    </xsl:template>
</xsl:stylesheet>