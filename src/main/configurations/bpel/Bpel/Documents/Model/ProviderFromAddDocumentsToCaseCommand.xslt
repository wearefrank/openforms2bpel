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
    <xsl:param name="AddDocumentsToCaseCommand" as="node()?"></xsl:param>

    <!-- Create/Enrich -->
    <xsl:param name="Provider" as="node()?"></xsl:param>
    
    <xsl:param name="CitizenNumber" select="''" as="xs:string" />
    <xsl:param name="CitizenNumber_Authentic" select="''" as="xs:string" />
    <xsl:param name="EmployeeUsername" select="''" as="xs:string" />
    <xsl:param name="NnpId" select="''" as="xs:string" />
    <xsl:param name="NnpId_Authentic" select="''" as="xs:string" />
    <xsl:param name="OfficeNumber" select="''" as="xs:string" />
    <xsl:param name="OfficeNumber_Authentic" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <document:provider>
            <xsl:choose>
                <xsl:when test="string-length($AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Person/CitizenNumber) gt 0 or $CitizenNumber">
                    <document:citizenNumber>
                        <xsl:choose>
                            <xsl:when test="$AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Person/AuthMethod = 'DigiD' or $CitizenNumber_Authentic='true'">
                                <xsl:attribute name="authentic" select="'J'" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="authentic" select="'N'" />
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $CitizenNumber, 
                            $Provider//document:provider/cases:citizenNumber, 
                            $AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Person/CitizenNumber, 
                            //document:provider/cases:citizenNumber)" />
                    </document:citizenNumber>
                </xsl:when>
                <xsl:when test="string-length($AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Organization/NnpId) gt 0 or $NnpId">
                    <document:nnpId>
                        <xsl:choose>
                            <xsl:when test="$AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Organization/AuthMethod = 'E-Herkenning' or $NnpId_Authentic='true'">
                                <xsl:attribute name="authentic" select="'J'" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="authentic" select="'N'" />
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $NnpId, 
                            $Provider//document:provider/cases:nnpId, 
                            $AddDocumentsToCaseCommand/AddDocumentsToCaseCommand/Provider/Organization/NnpId, 
                            //document:provider/cases:nnpId)" />
                    </document:nnpId>
                </xsl:when>
                <xsl:otherwise>
                    <document:citizenNumber xsi:nil="true" />
                </xsl:otherwise>
            </xsl:choose>
        </document:provider>
    </xsl:template>
</xsl:stylesheet>