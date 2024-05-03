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
    <xsl:param name="PersonExtInfoMessage" as="node()"><geg:personExtInfoMessage /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="ANumber" select="''" as="xs:string" />
    <xsl:param name="Bsn" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumberHome" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumberWork" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumberMobile" select="''" as="xs:string" />
    <xsl:param name="FaxNumber" select="''" as="xs:string" />
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="DateOfBirth" select="''" as="xs:string" />
    <xsl:param name="CityOfBirth" select="''" as="xs:string" />
    <xsl:param name="GenderIndication" select="''" as="xs:string" />
    <xsl:param name="LastName" select="''" as="xs:string" />
    <xsl:param name="Initials" select="''" as="xs:string" />
    <xsl:param name="FirstNames" select="''" as="xs:string" />
    <xsl:param name="LastNamePrefix" select="''" as="xs:string" />
    <xsl:param name="BankNumber" select="''" as="xs:string" />
    <xsl:param name="PrefComChannel" select="''" as="xs:string" />
    <xsl:param name="Address" as="node()"><geg:address /></xsl:param>
    
    <xsl:template match="/">
        <geg:addExtendedPersonInfo>
            <geg:personExtInfoMessage>
                <geg:persons>
                    <geg:person>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:aNumber', 'null', zgw:FromOrderedSource(
                            $ANumber, 
                            $PersonExtInfoMessage//*:person/*:aNumber, 
                            '', 
                            //*:person/*:aNumber),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:bsn', 'null', zgw:FromOrderedSource(
                            $Bsn, 
                            $PersonExtInfoMessage//*:person/*:bsn, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'bsn')], 
                            //*:person/*:bsn),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:telephoneNumberHome', 'null', zgw:FromOrderedSource(
                            $TelephoneNumberHome, 
                            $PersonExtInfoMessage//*:person/*:telephoneNumberHome, 
                            $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'telefoonnummer') and not(starts-with(name(), 'telefoonnummerWerk')) and not(starts-with(name(), 'telefoonnummerMobiel'))], 
                            //*:person/*:telephoneNumberHome),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:telephoneNumberWork', 'null', zgw:FromOrderedSource(
                            $TelephoneNumberWork, 
                            $PersonExtInfoMessage//*:person/*:telephoneNumberWork, 
                            $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'telefoonnummerWerk')], 
                            //*:person/*:telephoneNumberWork),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:telephoneNumberMobile', 'null', zgw:FromOrderedSource(
                            $TelephoneNumberMobile, 
                            $PersonExtInfoMessage//*:person/*:telephoneNumberMobile, 
                            $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'telefoonnummerMobiel')], 
                            //*:person/*:telephoneNumberMobile),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:faxNumber', 'null', zgw:FromOrderedSource(
                            $FaxNumber, 
                            $PersonExtInfoMessage//*:person/*:faxNumber, 
                            '', 
                            //*:person/*:faxNumber),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:emailAddress', 'null', zgw:FromOrderedSource(
                            $EmailAddress, 
                            $PersonExtInfoMessage//*:person/*:emailAddress, 
                            $UwGegevens//*[starts-with(name(), 'contactgegevens')]/*[starts-with(name(), 'eMailadres')], 
                            //*:person/*:emailAddress),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:dateOfBirth', 'null', zgw:FromOrderedSource(
                            $DateOfBirth, 
                            $PersonExtInfoMessage//*:person/*:dateOfBirth, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'geboortedatum')], 
                            //*:person/*:dateOfBirth),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:cityOfBirth', 'null', zgw:FromOrderedSource(
                            $CityOfBirth, 
                            $PersonExtInfoMessage//*:person/*:cityOfBirth, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'geboorteplaats')], 
                            //*:person/*:cityOfBirth),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:genderIndication', 'null', zgw:FromOrderedSource(
                            $GenderIndication, 
                            $PersonExtInfoMessage//*:person/*:genderIndication, 
                            if ($UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'aanhef')] = 'deHeer') then 'M' 
                            else if ($UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'aanhef')] = 'mevrouw') then 'V' 
                            else 'O', 
                            //*:person/*:genderIndication,
                            'O'),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:lastName', 'null', zgw:FromOrderedSource(
                            $LastName, 
                            $PersonExtInfoMessage//*:person/*:lastName, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'achternaam')], 
                            //*:person/*:lastName),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:initials', 'null', zgw:FromOrderedSource(
                            $Initials, 
                            $PersonExtInfoMessage//*:person/*:initials, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'voorletterS')], 
                            //*:person/*:initials),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:firstNames', 'null', zgw:FromOrderedSource(
                            $FirstNames, 
                            $PersonExtInfoMessage//*:person/*:firstNames, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'voornamen')], 
                            //*:person/*:firstNames),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:lastNamePrefix', 'null', zgw:FromOrderedSource(
                            $LastNamePrefix, 
                            $PersonExtInfoMessage//*:person/*:lastNamePrefix, 
                            $UwGegevens//*[starts-with(name(), 'persoonsgegevens')]/*[starts-with(name(), 'tussenvoegselS')], 
                            //*:person/*:lastNamePrefix),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:bankNumber', 'null', zgw:FromOrderedSource(
                            $BankNumber, 
                            $PersonExtInfoMessage//*:person/*:bankNumber, 
                            '', 
                            //*:person/*:bankNumber),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('geg:prefComChannel', 'null', zgw:FromOrderedSource(
                            $PrefComChannel, 
                            $PersonExtInfoMessage//*:person/*:prefComChannel, 
                            '', 
                            //*:person/*:prefComChannel),
                            'http://www.emaxx.org/functional/gegmag')"/>
                        <geg:addresses>
                            <xsl:variable name="address" select="zgw:ObjectFromOrderedSource(
                                $Address, 
                                $PersonExtInfoMessage//*:person/*:addresses/*:address, 
                                '', 
                                //*:person/*:addresses/*:address)"/>
                            <xsl:if test="$address">
                                <xsl:copy-of select="$address"/>
                            </xsl:if>
                        </geg:addresses>
                    </geg:person>
                </geg:persons>
            </geg:personExtInfoMessage>
        </geg:addExtendedPersonInfo>
    </xsl:template>
</xsl:stylesheet>