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
    
    <!-- Create/Enrich -->
    <xsl:param name="EmailParameters" as="node()"><emailparameters:emailParameters /></xsl:param>
    
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="Gender" select="''" as="xs:string" />
    <xsl:param name="FirstNames" select="''" as="xs:string" />
    <xsl:param name="MiddleName" select="''" as="xs:string" />
    <xsl:param name="LastName" select="''" as="xs:string" />
    <xsl:param name="NameOfAddress" select="''" as="xs:string" />

    <xsl:variable name="initials" select="zgw:WrapNullOrSkip('egov:initials', 'null', zgw:FromOrderedSource(
        $EmailAddress,
        $EmailParameters//emailparameters:emailAddress,
        '', 
        //emailparameters:emailAddress),
        'http://www.emaxx.org/egov/common')"/>

    <xsl:variable name="firstNames" select="zgw:WrapNullOrSkip('egov:firstNames', 'null', zgw:FromOrderedSource(
        $FirstNames,
        $EmailParameters//emailparameters:firstNames,
        '', 
        //emailparameters:firstNames),
        'http://www.emaxx.org/egov/common')"/>
    
    <xsl:variable name="middleName" select="zgw:WrapNullOrSkip('egov:middleName', 'null', zgw:FromOrderedSource(
        $MiddleName,
        $EmailParameters//emailparameters:middleName,
        '', 
        //emailparameters:middleName),
        'http://www.emaxx.org/egov/common')"/>

    <xsl:variable name="lastName" select="zgw:WrapNullOrSkip('egov:lastName', 'null', zgw:FromOrderedSource(
        $LastName,
        $EmailParameters//emailparameters:lastName,
        '', 
        //emailparameters:lastName),
        'http://www.emaxx.org/egov/common')"/>

    <xsl:variable name="nameOfAddress" select="zgw:WrapNullOrSkip('egov:nameOfAddress', 'skip', zgw:FromOrderedSource(
        $NameOfAddress,
        $EmailParameters//emailparameters:nameOfAddress,
        '', 
        //emailparameters:nameOfAddress),
        'http://www.emaxx.org/egov/common')"/>

    <xsl:template match="/">
        <emailparameters:emailParameters>
            <xsl:copy-of select="zgw:WrapNullOrSkip('emailparameters:emailAddress', 'skip', zgw:FromOrderedSource(
                $EmailAddress, 
                $EmailParameters//emailparameters:emailAddress, 
                '', 
                //emailparameters:emailAddress),
                'http://www.emaxx.org/bpel/proces/xsd/emailparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('emailparameters:gender', 'null', zgw:FromOrderedSource(
                $Gender, 
                $EmailParameters//emailparameters:gender, 
                '', 
                //emailparameters:gender),
                'http://www.emaxx.org/bpel/proces/xsd/emailparameters')"/>
            <xsl:if test="$initials or $firstNames or $middleName or $lastName or $nameOfAddress">
                <emailparameters:name>
                    <xsl:copy-of select="$initials"/>
                    <xsl:copy-of select="$firstNames"/>
                    <xsl:copy-of select="$middleName"/>
                    <xsl:copy-of select="$lastName"/>
                    <xsl:copy-of select="$nameOfAddress"/>
                </emailparameters:name>
            </xsl:if>
        </emailparameters:emailParameters>
    </xsl:template>
</xsl:stylesheet>