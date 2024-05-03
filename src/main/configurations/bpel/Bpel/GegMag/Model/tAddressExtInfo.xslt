<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:zgw="http://google.com/zgw"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:geg="http://www.emaxx.org/functional/gegmag"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />

    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="AddressExtInfo" as="node()"><geg:address /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Type" select="''" as="xs:string" />
    <xsl:param name="Street" select="''" as="xs:string" />
    <xsl:param name="HouseNumber" select="''" as="xs:string" />
    <xsl:param name="HouseLetter" select="''" as="xs:string" />
    <xsl:param name="HouseRemark" select="''" as="xs:string" />
    <xsl:param name="HouseIndication" select="''" as="xs:string" />
    <xsl:param name="ZipCode" select="''" as="xs:string" />
    <xsl:param name="City" select="''" as="xs:string" />
    <xsl:param name="FreePost" select="''" as="xs:string" />
    <xsl:param name="POBox" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <geg:address>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:type', 'null', zgw:FromOrderedSource(
                $Type, 
                $AddressExtInfo//*:address/*:type, 
                '', 
                //*:address/*:type,
                'residence'),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:street', 'null', zgw:FromOrderedSource(
                $Street, 
                $AddressExtInfo//*:address/*:street, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'straatnaam')], 
                //*:address/*:street),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:houseNumber', 'null', zgw:FromOrderedSource(
                $HouseNumber, 
                $AddressExtInfo//*:address/*:houseNumber, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'huisnummer') and not(starts-with(name(), 'huisnummertoevoeging'))], 
                //*:address/*:houseNumber),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:houseLetter', 'null', zgw:FromOrderedSource(
                $HouseLetter, 
                $AddressExtInfo//*:address/*:houseLetter, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'huisletter')], 
                //*:address/*:houseLetter),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:houseRemark', 'null', zgw:FromOrderedSource(
                $HouseRemark, 
                $AddressExtInfo//*:address/*:houseRemark, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'huisnummertoevoeging')], 
                //*:address/*:houseRemark),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:houseIndication', 'null', zgw:FromOrderedSource(
                $HouseIndication, 
                $AddressExtInfo//*:address/*:houseIndication, 
                '', 
                //*:address/*:houseIndication),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:zipCode', 'null', zgw:FromOrderedSource(
                $ZipCode, 
                $AddressExtInfo//*:address/*:zipCode, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'postcode')], 
                //*:address/*:zipCode),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:city', 'null', zgw:FromOrderedSource(
                $City, 
                $AddressExtInfo//*:address/*:city, 
                $UwGegevens//*[starts-with(name(), 'adresgegevens')]/*[starts-with(name(), 'woonplaats')], 
                //*:address/*:city),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:freePost', 'null', zgw:FromOrderedSource(
                $FreePost, 
                $AddressExtInfo//*:address/*:freePost, 
                '', 
                //*:address/*:freePost),
                'http://www.emaxx.org/functional/gegmag')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('geg:POBox', 'null', zgw:FromOrderedSource(
                $POBox, 
                $AddressExtInfo//*:address/*:POBox, 
                '', 
                //*:address/*:POBox),
                'http://www.emaxx.org/functional/gegmag')"/>
        </geg:address>
    </xsl:template>
</xsl:stylesheet>