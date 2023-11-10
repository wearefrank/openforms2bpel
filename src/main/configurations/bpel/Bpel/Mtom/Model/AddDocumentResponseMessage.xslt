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
    <xsl:param name="AddDocument" as="node()"><mtom:AddDocumentResponse /></xsl:param>


    <xsl:template match="/">
        <mtom:AddDocumentResponse/>
    </xsl:template>
</xsl:stylesheet>