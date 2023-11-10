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
    <xsl:param name="AddDocumentResponse" as="node()"><document:addDocumentResponse /></xsl:param>
    
    <xsl:param name="SessionId" select="''" as="xs:string" />
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="Initiated" select="''" as="xs:string" />
    <xsl:param name="TimeToLive" select="''" as="xs:string" />
    <xsl:param name="BatchNumber" select="''" as="xs:string" />
    <xsl:param name="BatchSequenceNr" select="''" as="xs:string" />

    <xsl:template match="/">
        <document:addDocumentResponse>
            <document:documentSessionMessage>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:sessionId', 'empty', zgw:FromOrderedSource(
                    $SessionId, 
                    $AddDocumentResponse//document:sessionId, 
                    '', 
                    //document:sessionId),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:referenceNumber', 'empty', zgw:FromOrderedSource(
                    $ReferenceNumber, 
                    $AddDocumentResponse//document:referenceNumber, 
                    '', 
                    //document:referenceNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:initiated', 'empty', zgw:FromOrderedSource(
                    $Initiated, 
                    $AddDocumentResponse//document:initiated, 
                    '', 
                    //document:initiated),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:timeToLive', 'empty', zgw:FromOrderedSource(
                    $TimeToLive, 
                    $AddDocumentResponse//document:timeToLive, 
                    '', 
                    //document:timeToLive),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchNumber', 'empty', zgw:FromOrderedSource(
                    $BatchNumber, 
                    $AddDocumentResponse//document:batchNumber, 
                    '', 
                    //document:batchNumber),
                    'http://www.emaxx.org/functional/cases/document')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchSequenceNr', 'empty', zgw:FromOrderedSource(
                    $BatchSequenceNr, 
                    $AddDocumentResponse//document:batchSequenceNr, 
                    '', 
                    //document:batchSequenceNr),
                    'http://www.emaxx.org/functional/cases/document')"/>
            </document:documentSessionMessage>
        </document:addDocumentResponse>
    </xsl:template>
</xsl:stylesheet>