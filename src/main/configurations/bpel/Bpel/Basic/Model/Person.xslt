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
    <xsl:param name="FieldSetZonderDigiD" as="node()"><fieldSetZonderDigiD /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Person" as="node()"><basic:person /></xsl:param>
    
    <xsl:param name="Bsn" select="''" as="xs:string" />
    <xsl:param name="GenderIndication" select="''" as="xs:string" />
    <xsl:param name="Initials" select="''" as="xs:string" />
    <xsl:param name="FirstNames" select="''" as="xs:string" />
    <xsl:param name="LastNamePrefix" select="''" as="xs:string" />
    <xsl:param name="LastName" select="''" as="xs:string" />
    <xsl:param name="NameOfAddress" select="''" as="xs:string" />
    <xsl:param name="DateOfBirth" select="''" as="xs:string" />
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumber" select="''" as="xs:string" />
    <xsl:param name="FaxNumber" select="''" as="xs:string" />
    <xsl:param name="Iban" select="''" as="xs:string" />
    <xsl:param name="Bic" select="''" as="xs:string" />
    <xsl:param name="HouseNumber" select="''" as="xs:string" />
    <xsl:param name="HouseLetter" select="''" as="xs:string" />
    <xsl:param name="HouseRemark" select="''" as="xs:string" />
    <xsl:param name="Streetname" select="''" as="xs:string" />
    <xsl:param name="ZipCode" select="''" as="xs:string" />
    <xsl:param name="City" select="''" as="xs:string" />
    <xsl:param name="LocationDescription" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <basic:person>
            <basic:bsn>
                <xsl:choose>
                    <xsl:when test="$FieldSetZonderDigiD">
                        <xsl:attribute name="authentic" select="false()" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="authentic" select="true()" />
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="zgw:FromOrderedSource(
                    $Bsn,
                    $Person//basic:bsn,
                    '',
                    //basic:bsn)" />
            </basic:bsn>
            <basic:nonAuthentic>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:genderIndication', 'empty', zgw:FromOrderedSource(
                    $GenderIndication,
                    $Person//basic:genderIndication,
                    '',
                    //basic:genderIndication,
                    'O'),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:initials', 'empty', zgw:FromOrderedSource(
                    $Initials,
                    $Person//basic:initials,
                    $FieldSetZonderDigiD//voorletterSPZD,
                    //basic:initials),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:firstNames', 'empty', zgw:FromOrderedSource(
                    $FirstNames,
                    $Person//basic:firstNames,
                    '',
                    //basic:firstNames),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:lastNamePrefix', 'empty', zgw:FromOrderedSource(
                    $LastNamePrefix,
                    $Person//basic:lastNamePrefix,
                    $FieldSetZonderDigiD//tussenvoegselSPZD,
                    //basic:lastNamePrefix),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:lastName', 'empty', zgw:FromOrderedSource(
                    $LastName,
                    $Person//basic:lastName,
                    $FieldSetZonderDigiD//achternaamPZD,
                    //basic:lastName),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:nameOfAddress', 'empty', zgw:FromOrderedSource(
                    $NameOfAddress,
                    $Person//basic:nameOfAddress,
                    '',
                    //basic:nameOfAddress),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:dateOfBirth', 'null', zgw:FromOrderedSource(
                    $DateOfBirth,
                    $Person//basic:dateOfBirth,
                    '',
                    //basic:dateOfBirth),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:emailAddress', 'empty', zgw:FromOrderedSource(
                    $EmailAddress,
                    $Person//basic:emailAddress,
                    $FieldSetZonderDigiD//eMailadresPZD,
                    //basic:emailAddress),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:telephoneNumber', 'empty', zgw:FromOrderedSource(
                    $TelephoneNumber,
                    $Person//basic:telephoneNumber,
                    $FieldSetZonderDigiD//telefoonnummerPZD,
                    //basic:telephoneNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:faxNumber', 'empty', zgw:FromOrderedSource(
                    $FaxNumber,
                    $Person//basic:faxNumber,
                    '',
                    //basic:faxNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:iban', 'empty', zgw:FromOrderedSource(
                    $Iban,
                    $Person//basic:iban,
                    '',
                    //basic:iban),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:bic', 'empty', zgw:FromOrderedSource(
                    $Bic,
                    $Person//basic:bic,
                    '',
                    //basic:bic),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                <basic:residenceAddress>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseNumber', 'empty', zgw:FromOrderedSource(
                        $HouseNumber,
                        $Person//basic:houseNumber,
                        $FieldSetZonderDigiD//huisnummerPZD,
                        //basic:telephhouseNumberoneNumber),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseLetter', 'empty', zgw:FromOrderedSource(
                        $HouseLetter,
                        $Person//basic:houseLetter,
                        $FieldSetZonderDigiD//huisletterPZD,
                        //basic:houseLetter),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:houseRemark', 'empty', zgw:FromOrderedSource(
                        $HouseRemark,
                        $Person//basic:houseRemark,
                        $FieldSetZonderDigiD//huisnummertoevoegingPZD,
                        //basic:houseRemark),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:streetname', 'empty', zgw:FromOrderedSource(
                        $Streetname,
                        $Person//basic:streetname,
                        $FieldSetZonderDigiD//straatnaamPZD,
                        //basic:streetname),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:zipCode', 'empty', zgw:FromOrderedSource(
                        $ZipCode,
                        $Person//basic:zipCode,
                        upper-case(replace($FieldSetZonderDigiD//postcodePZD, ' ', '')),
                        //basic:zipCode),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:city', 'empty', zgw:FromOrderedSource(
                        $City,
                        $Person//basic:city,
                        $FieldSetZonderDigiD//woonplaatsPZD,
                        //basic:city),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:locationDescription', 'empty', zgw:FromOrderedSource(
                        $LocationDescription,
                        $Person//basic:locationDescription,
                        '',
                        //basic:clocationDescriptionity),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                </basic:residenceAddress>
            </basic:nonAuthentic>
        </basic:person>
    </xsl:template>
</xsl:stylesheet>