<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Provider" as="node()"><Provider /></xsl:param>
    
    <xsl:param name="CitizenNumber" select="''" as="xs:string" />
    <xsl:param name="CitizenNumber_Authentic" select="''" as="xs:string" />
    <xsl:param name="EmployeeUsername" select="''" as="xs:string" />
    <xsl:param name="NnpId" select="''" as="xs:string" />
    <xsl:param name="NnpId_Authentic" select="''" as="xs:string" />
    <xsl:param name="OfficeNumber" select="''" as="xs:string" />
    <xsl:param name="OfficeNumber_Authentic" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <Provider>
            <xsl:choose>
                <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[ends-with(name(), 'DigiD')] or $CitizenNumber">
                    <Person>
                        <xsl:choose>
                            <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*/*[ends-with(name(), 'MD')] or $CitizenNumber_Authentic='true'">
                                <AuthMethod>DigiD</AuthMethod>
                            </xsl:when>
                            <xsl:otherwise>
                                <AuthMethod xsi:nil="true" />
                            </xsl:otherwise>
                        </xsl:choose>
                        <CitizenNumber>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $CitizenNumber, 
                            $Provider//Provider/Person/CitizenNumber, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'bsn')], 
                            //Provider/Person/CitizenNumber)" />
                        </CitizenNumber>
                    </Person>
                </xsl:when>
                <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[starts-with(name(), 'fieldSetBedrijf')] or $NnpId">
                    <Organization>
                        <xsl:choose>
                            <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*/*[ends-with(name(), 'MEH')] or $NnpId_Authentic='true'">
                                <AuthMethod>E-Herkenning</AuthMethod>
                            </xsl:when>
                            <xsl:otherwise>
                                <AuthMethod xsi:nil="true" />
                            </xsl:otherwise>
                        </xsl:choose>
                        <NnpId>
                        <xsl:copy-of select="zgw:FromOrderedSource(
                            $NnpId, 
                            $Provider//Provider/Organization/NnpId, 
                            $UwGegevens//*[starts-with(name(), 'gegevensBedrijfOrganisatie')]/*[starts-with(name(), 'kvKNummer')], 
                            //Provider/Organization/NnpId)" />
                        </NnpId>
                    </Organization>
                </xsl:when>
                <xsl:otherwise />
            </xsl:choose>
        </Provider>
    </xsl:template>
</xsl:stylesheet>