<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    xmlns:headerproperties="http://www.emaxx.org/bpel/proces/xsd/headerproperties"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="InitiateRequestMessage" as="node()"><basic:initiateRequestMessage /></xsl:param>
    
    <xsl:param name="User" select="''" as="xs:string" />
    <xsl:param name="Password" select="''" as="xs:string" />
    <xsl:param name="Domain" select="''" as="xs:string" />
    <xsl:param name="CorrelationId" select="''" as="xs:string" />
    <xsl:param name="Bsn" select="''" as="xs:string" />
    <xsl:param name="CommercialRegistryNumber" select="''" as="xs:string" />
    <xsl:param name="Username" select="''" as="xs:string" />
    <xsl:param name="Process" select="''" as="xs:string" />

    <xsl:variable name="bsn" select="zgw:WrapNullOrSkip('basic:bsn', 'skip', zgw:FromOrderedSource(
        $Bsn,
        $InitiateRequestMessage/basic:initiateRequestMessage/basic:body/basic:applicant/basic:person/basic:bsn,
        '',
        basic:initiateRequestMessage/basic:body/basic:applicant/basic:person/basic:bsn))" />
    <xsl:variable name="commercialRegistryNumber" select="zgw:WrapNullOrSkip('basic:commercialRegistryNumber', 'skip', zgw:FromOrderedSource(
        $CommercialRegistryNumber,
        $InitiateRequestMessage/basic:initiateRequestMessage/basic:body/basic:applicant/basic:organization/basic:commercialRegistryNumber,
        '',
        basic:initiateRequestMessage/basic:body/basic:applicant/basic:organization/basic:commercialRegistryNumber))" />
    <xsl:variable name="username" select="zgw:WrapNullOrSkip('basic:username', 'skip', zgw:FromOrderedSource(
        $Username,
        $InitiateRequestMessage/basic:initiateRequestMessage/basic:body/basic:applicant/basic:employee/basic:username,
        '',
        basic:initiateRequestMessage/basic:body/basic:applicant/basic:employee/basic:username))" />
    
    <xsl:template match="/">
        <basic:initiateRequestMessage>
            <headerproperties:requestProperties>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:user', 'null', zgw:FromOrderedSource(
                    $User, 
                    $InitiateRequestMessage/basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:user, 
                    '', 
                    basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:user))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:password', 'null', zgw:FromOrderedSource(
                    $Password, 
                    $InitiateRequestMessage/basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:password, 
                    '', 
                    basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:password))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:domain', 'null', zgw:FromOrderedSource(
                    $Domain, 
                    $InitiateRequestMessage/basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:domain, 
                    '', 
                    basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:domain))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:correlationId', 'null', zgw:FromOrderedSource(
                    $CorrelationId, 
                    $InitiateRequestMessage/basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:correlationId, 
                    '', 
                    basic:initiateRequestMessage/headerproperties:requestProperties/headerproperties:correlationId))"/>
            </headerproperties:requestProperties>
            <basic:body>
                <basic:applicant>
                    <!-- Choice, one of these elements must be set. -->
                    <xsl:choose>
                        <xsl:when test="$bsn">
                            <basic:person>
                                <xsl:copy-of select="$bsn"/>
                            </basic:person>
                        </xsl:when>
                        <xsl:when test="$commercialRegistryNumber">
                            <basic:organization>
                                <xsl:copy-of select="$commercialRegistryNumber"/>
                            </basic:organization>
                        </xsl:when>
                        <xsl:when test="$username">
                            <basic:employee>
                                <xsl:copy-of select="$username"/>
                            </basic:employee>
                        </xsl:when>
                        <xsl:otherwise />
                    </xsl:choose>
                </basic:applicant>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basic:process', 'empty', zgw:FromOrderedSource(
                    $Process, 
                    $InitiateRequestMessage/basic:initiateRequestMessage/basic:body/basic:process, 
                    '', 
                    basic:initiateRequestMessage/basic:body/basic:process))"/>
            </basic:body>
        </basic:initiateRequestMessage>
    </xsl:template>
</xsl:stylesheet>