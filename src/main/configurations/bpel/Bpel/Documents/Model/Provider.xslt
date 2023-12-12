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
    <xsl:param name="UwGegevensCompleet" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Provider" as="node()"><document:provider /></xsl:param>
    
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
                <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[ends-with(name(), 'DigiD')] or $CitizenNumber">
                    <document:citizenNumber>
                        <xsl:choose>
                            <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[ends-with(name(), 'MD')] or $CitizenNumber_Authentic='true'">
                                <xsl:attribute name="authentic" select="'J'" />
                            </xsl:when>
                            <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[ends-with(name(), 'ZD')] or $CitizenNumber_Authentic='false'">
                                <xsl:attribute name="authentic" select="'N'" />
                            </xsl:when>
                            <xsl:otherwise><xsl:attribute name="xsi:nil" select="true()"/></xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $CitizenNumber, 
                            $Provider//document:provider/cases:citizenNumber, 
                            $UwGegevensCompleet//bsn, 
                            //document:provider/cases:citizenNumber)" />
                    </document:citizenNumber>
                </xsl:when>
                <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[starts-with(name(), 'fieldSetBedrijf')] or $NnpId">
                    <document:nnpId>
                        <xsl:choose>
                            <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[ends-with(name(), 'MEH')] or $NnpId_Authentic='true'">
                                <xsl:attribute name="authentic" select="'J'" />
                            </xsl:when>
                            <xsl:when test="$UwGegevensCompleet//uw-gegevenscompleet/*[ends-with(name(), 'ZEH')] or $NnpId_Authentic='false'">
                                <xsl:attribute name="authentic" select="'N'" />
                            </xsl:when>
                            <xsl:otherwise><xsl:attribute name="xsi:nil" select="true()"/></xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $NnpId, 
                            $Provider//document:provider/cases:nnpId, 
                            $UwGegevensCompleet//*[starts-with(name(), 'gegevensBedrijfOrganisatie')]/*[starts-with(name(), 'kvKNummer')], 
                            //document:provider/cases:nnpId)" />
                    </document:nnpId>
                </xsl:when>
                <xsl:otherwise>
                    <document:citizenNumber xsi:nil="true()" />
                </xsl:otherwise>
            </xsl:choose>
        </document:provider>
    </xsl:template>
</xsl:stylesheet>