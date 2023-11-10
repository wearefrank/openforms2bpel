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
    <xsl:param name="EndBatch" as="node()"><document:endBatch /></xsl:param>
    
    <xsl:param name="BatchNumber" select="''" as="xs:string" />
    <xsl:param name="Case" select="''" as="xs:string" />
    <xsl:param name="Provider" select="''" as="xs:string" />
    
    <xsl:variable name="case" select="zgw:WrapNullOrSkip('document:referenceNumber', 'skip', zgw:FromOrderedSource(
        $Case, 
        $EndBatch//document:case/document:referenceNumber, 
        '', 
        //document:case/document:referenceNumber),
        'http://www.emaxx.org/functional/cases/document')"/>
    <xsl:variable name="provider" select="zgw:WrapNullOrSkip('document:citizenNumber', 'skip', zgw:FromOrderedSource(
        $Provider, 
        $EndBatch//document:provider/document:citizenNumber, 
        '', 
        //document:provider/document:citizenNumber),
        'http://www.emaxx.org/functional/cases/document')"/>

    <xsl:template match="/">
        <document:endBatch>
            <document:batchEndMessage>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchNumber', 'skip', zgw:FromOrderedSource(
                    $BatchNumber, 
                    $EndBatch//document:batchNumber, 
                    '', 
                    //document:batchNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:case', 'skip', zgw:ObjectFromOrderedSource(
                    $case, 
                    $EndBatch//document:case, 
                    '', 
                    //document:case),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:provider', 'skip', zgw:ObjectFromOrderedSource(
                    $provider, 
                    $EndBatch//document:provider, 
                    '', 
                    //document:provider),
                    'http://www.emaxx.org/functional/cases/document')"/>
            </document:batchEndMessage>
        </document:endBatch>
    </xsl:template>
</xsl:stylesheet>