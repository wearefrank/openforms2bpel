<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:emailparameters='http://www.emaxx.org/bpel/proces/xsd/emailparameters'
    xmlns:egov='http://www.emaxx.org/egov/common'
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="UwGegevens" as="node()"><uw-gegevenscompleet /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="EmailParameters" as="node()"><emailparameters:emailParameters /></xsl:param>
    
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="Gender" select="''" as="xs:string" />
    <xsl:param name="Initials" select="''" as="xs:string" />
    <xsl:param name="FirstNames" select="''" as="xs:string" />
    <xsl:param name="MiddleName" select="''" as="xs:string" />
    <xsl:param name="LastName" select="''" as="xs:string" />
    <xsl:param name="NameOfAddress" select="''" as="xs:string" />
    
    <xsl:variable name="tussenvoegsel" select="$UwGegevens//*[starts-with(name(), 'fieldSet')]/*/*[starts-with(name(), 'tussenvoegsel')]" />
    <xsl:variable name="lastName" select="$UwGegevens//*[starts-with(name(), 'fieldSet')]/*/*[starts-with(name(), 'achternaam')]" />

    <xsl:template match="/">
        <emailparameters:emailParameters>
            <xsl:copy-of select="zgw:WrapNullOrSkip('emailparameters:emailAddress', 'empty', zgw:FromOrderedSource(
                $EmailAddress, 
                $EmailParameters//emailparameters:emailAddress, 
                $UwGegevens//*[starts-with(name(), 'eMailadres')], 
                //emailparameters:emailAddress),
                'http://www.emaxx.org/bpel/proces/xsd/emailparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('emailparameters:gender', 'skip', zgw:FromOrderedSource(
                $Gender, 
                $EmailParameters//emailparameters:gender, 
                if ($UwGegevens//*[starts-with(name(), 'aanhef')] = 'deHeer') then 'M' 
                else if($UwGegevens//*[starts-with(name(), 'aanhef')] = 'mevrouw') then 'V' 
                else 'O', 
                //emailparameters:gender,
                'O'),
                'http://www.emaxx.org/bpel/proces/xsd/emailparameters')"/>
            <emailparameters:name>
                <xsl:copy-of select="zgw:WrapNullOrSkip('egov:initials', 'null', zgw:FromOrderedSource(
                    $Initials,
                    $EmailParameters//emailparameters:initials,
                    $UwGegevens//*[starts-with(name(), 'voorletterS')], 
                    //emailparameters:initials),
                    'http://www.emaxx.org/egov/common')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('egov:firstNames', 'null', zgw:FromOrderedSource(
                    $FirstNames,
                    $EmailParameters//emailparameters:firstNames,
                    $UwGegevens//*[starts-with(name(), 'voornamen')], 
                    //emailparameters:firstNames),
                    'http://www.emaxx.org/egov/common')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('egov:middleName', 'null', zgw:FromOrderedSource(
                    $MiddleName,
                    $EmailParameters//emailparameters:middleName,
                    '', 
                    //emailparameters:middleName),
                    'http://www.emaxx.org/egov/common')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('egov:lastName', 'null', zgw:FromOrderedSource(
                    $LastName,
                    $EmailParameters//emailparameters:lastName,
                    concat($tussenvoegsel, concat('', $lastName)), 
                    //emailparameters:lastName),
                    'http://www.emaxx.org/egov/common')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('egov:nameOfAddress', 'skip', zgw:FromOrderedSource(
                    $NameOfAddress,
                    $EmailParameters//emailparameters:nameOfAddress,
                    '', 
                    //emailparameters:nameOfAddress),
                    'http://www.emaxx.org/egov/common')"/>
            </emailparameters:name>
        </emailparameters:emailParameters>
    </xsl:template>
</xsl:stylesheet>