<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:document="http://www.emaxx.org/functional/cases/document"
    xmlns:mtom="http://www.emaxx.org/functional/documents/mtom"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="AddDocument" as="node()"><mtom:AddDocumentRequest /></xsl:param>
    
    <xsl:param name="SessionId" select="''" as="xs:string" />
    <xsl:param name="ContentType" select="''" as="xs:string" />
    <xsl:param name="Document" select="''" as="xs:string" />
    


    <xsl:template match="/">
        <mtom:AddDocumentRequest>
            <xsl:copy-of select="zgw:WrapNullOrSkip('mtom:sessionId', 'skip', zgw:ObjectFromOrderedSource(
                $SessionId, 
                $AddDocument//mtom:sessionId, 
                '', 
                //mtom:sessionId),
                'http://www.emaxx.org/functional/documents/mtom')"/>
            <mtom:document contentType="{$ContentType}"><xsl:copy-of select="$Document"/></mtom:document>
        </mtom:AddDocumentRequest>
    </xsl:template>
</xsl:stylesheet>