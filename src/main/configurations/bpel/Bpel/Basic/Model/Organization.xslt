<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Organization" as="node()"><basic:organization /></xsl:param> 

    <xsl:param name="CommercialRegistryNumber" select="''" as="xs:string" />
    <xsl:param name="CommercialRegistryNumber_Authentic" select="''" as="xs:string" />
    <xsl:param name="StatutoryName" select="''" as="xs:string" />
    <xsl:param name="FoundingDate" select="''" as="xs:string" />
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumber" select="''" as="xs:string" />
    <xsl:param name="FaxNumber" select="''" as="xs:string" />
    <xsl:param name="Iban" select="''" as="xs:string" />
    <xsl:param name="Bic" select="''" as="xs:string" />
    <xsl:param name="HouseNumber" select="''" as="xs:string" />
    <xsl:param name="HouseLetter" select="''" as="xs:string" />
    <xsl:param name="HouseRemark" select="''" as="xs:string" />
    <xsl:param name="FreePost" select="''" as="xs:string" />
    <xsl:param name="POBox" select="''" as="xs:string" />
    <xsl:param name="Streetname" select="''" as="xs:string" />
    <xsl:param name="ZipCode" select="''" as="xs:string" />
    <xsl:param name="City" select="''" as="xs:string" />
    <xsl:param name="LocationDescription" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <basic:organization>
            <basic:commercialRegistryNumber>
                <xsl:choose>
                    <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[ends-with(name(), 'MEH')] or $CommercialRegistryNumber_Authentic='true'">
                        <xsl:attribute name="authentic" select="true()" />
                    </xsl:when>
                    <xsl:when test="$UwGegevens//*[starts-with(name(), 'uw-gegevens')]/*[ends-with(name(), 'ZEH')] or $CommercialRegistryNumber_Authentic='false'">
                        <xsl:attribute name="authentic" select="false()" />
                    </xsl:when>
                    <xsl:otherwise />
                </xsl:choose>
                <xsl:copy-of select="zgw:FromOrderedSource(
                    $CommercialRegistryNumber, 
                    $Organization/basic:commercialRegistryNumber, 
                    $UwGegevens//*[starts-with(name(), 'gegevensBedrijfOrganisatie')]/*[starts-with(name(), 'kvKNummer')],
                    //basic:commercialRegistryNumber)" />
            </basic:commercialRegistryNumber>
            <basic:nonAuthentic>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:statutoryName', 'empty', zgw:FromOrderedSource(
                    $StatutoryName,
                    $Organization/basic:statutoryName,
                    $UwGegevens//*[starts-with(name(), 'gegevensBedrijfOrganisatie')]/*[starts-with(name(), 'naamBedrijfOrganisatie')],
                    //basic:statutoryName),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:foundingDate', 'null', zgw:FromOrderedSource(
                    $FoundingDate,
                    $Organization/basic:foundingDate,
                    '',
                    //basic:foundingDate),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:emailAddress', 'empty', zgw:FromOrderedSource(
                    $EmailAddress,
                    $Organization/basic:emailAddress,
                    $UwGegevens//*[starts-with(name(), 'communicatie')]/*[starts-with(name(), 'eMailadres')],
                    //basic:emailAddress),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:telephoneNumber', 'empty', zgw:FromOrderedSource(
                    $TelephoneNumber,
                    $Organization/basic:telephoneNumber,
                    $UwGegevens//*[starts-with(name(), 'communicatie')]/*[starts-with(name(), 'telefoonnummer')],
                    //basic:telephoneNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:faxNumber', 'empty', zgw:FromOrderedSource(
                    $FaxNumber,
                    $Organization/basic:faxNumber,
                    '',
                    //basic:faxNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:iban', 'empty', zgw:FromOrderedSource(
                    $Iban,
                    $Organization/basic:iban,
                    '',
                    //basic:iban),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:bic', 'empty', zgw:FromOrderedSource(
                    $Bic,
                    $Organization/basic:bic,
                    '',
                    //basic:bic),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <basic:correspondenceAddress>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseNumber', 'empty', zgw:FromOrderedSource(
                        $HouseNumber,
                        $Organization//basic:correspondenceAddress/basic:houseNumber,
                        $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'huisnummer') and not(starts-with(name(), 'huisnummertoevoeging'))],
                        //basic:correspondenceAddress/basic:houseNumber),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseLetter', 'empty', zgw:FromOrderedSource(
                        $HouseLetter,
                        $Organization//basic:correspondenceAddress/basic:houseLetter,
                        $UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'huisletter')],
                        //basic:correspondenceAddress/basic:houseLetter),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseRemark', 'empty', zgw:FromOrderedSource(
                        $HouseRemark,
                        $Organization//basic:correspondenceAddress/basic:houseRemark,
                        $UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'huisnummertoevoeging')],
                        //basic:correspondenceAddress/basic:houseRemark),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:freePost', 'skip', zgw:FromOrderedSource(
                        $FreePost,
                        $Organization//basic:correspondenceAddress/basic:freePost,
                        '',
                        //basic:correspondenceAddress/basic:freePost),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:POBox', 'skip', zgw:FromOrderedSource(
                        $POBox,
                        $Organization//basic:correspondenceAddress/basic:POBox,
                        $UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'postbusnummer')],
                        //basic:correspondenceAddress/basic:POBox),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:streetname', 'empty', zgw:FromOrderedSource(
                        $Streetname,
                        $Organization//basic:correspondenceAddress/basic:streetname,
                        $UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'straatnaam')],
                        //basic:correspondenceAddress/basic:streetname),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:zipCode', 'empty', zgw:FromOrderedSource(
                        $ZipCode,
                        $Organization//basic:correspondenceAddress/basic:zipCode,
                        upper-case(replace($UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'postcode')], ' ', '')),
                        //basic:correspondenceAddress/basic:zipCode),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:city', 'empty', zgw:FromOrderedSource(
                        $City,
                        $Organization//basic:correspondenceAddress/basic:city,
                        $UwGegevens//*[starts-with(name(), 'bezoekadres')]/*[starts-with(name(), 'plaats')],
                        //basic:correspondenceAddress/basic:city),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:locationDescription', 'empty', zgw:FromOrderedSource(
                        $LocationDescription,
                        $Organization//basic:correspondenceAddress/basic:locationDescription,
                        '',
                        //basic:correspondenceAddress/basic:locationDescription),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                </basic:correspondenceAddress>                
            </basic:nonAuthentic>
        </basic:organization>
    </xsl:template>
</xsl:stylesheet>