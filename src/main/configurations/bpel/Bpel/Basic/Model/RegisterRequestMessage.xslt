<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    xmlns:headerproperties="http://www.emaxx.org/bpel/proces/xsd/headerproperties"
    xmlns:caseparameters='http://www.emaxx.org/bpel/proces/xsd/caseparameters'
    xmlns:processparameters='http://www.emaxx.org/bpel/proces/xsd/processparameters'
    xmlns:emailparameters='http://www.emaxx.org/bpel/proces/xsd/emailparameters'
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="InitiateResponseMessage" as="node()"><basic:initiateResponseMessage /></xsl:param>
    <xsl:param name="InitiatingSubject" as="node()"><basic:initiatingSubject /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="RegisterRequestMessage" as="node()"><basic:registerRequestMessage /></xsl:param>
    
    <xsl:param name="User" select="''" as="xs:string" />
    <xsl:param name="Password" select="''" as="xs:string" />
    <xsl:param name="Domain" select="''" as="xs:string" />
    <xsl:param name="CorrelationId" select="''" as="xs:string" />
    <xsl:param name="Bsn" select="''" as="xs:string" />
    <xsl:param name="CommercialRegistryNumber" select="''" as="xs:string" />
    <xsl:param name="Username" select="''" as="xs:string" />
    <xsl:param name="Summary" as="node()"><summary /></xsl:param>
    <xsl:param name="Parties" as="node()"><basic:parties /></xsl:param>
    <xsl:param name="EmailParameters" as="node()"><emailparameters:emailParameters /></xsl:param>
    <xsl:param name="Process" select="''" as="xs:string" />
    <xsl:param name="Payment" as="node()"><caseparameters:payment /></xsl:param>
    <xsl:param name="SendFormByMail" select="''" as="xs:string" />
    <xsl:param name="Documents" select="''" as="xs:string" />
    <xsl:param name="NumberOfDocuments" select="''" as="xs:string" />
    <xsl:param name="CloseCase" select="''" as="xs:string" />
    <xsl:param name="CaseParameters" as="node()"><caseparameters:caseParameters /></xsl:param>
    
    <xsl:variable name="bsn" select="zgw:WrapNullOrSkip('basic:bsn', 'null', zgw:FromOrderedSource(
                $Bsn,
                $RegisterRequestMessage/basic:registerRequestMessage/basic:body/basic:applicant/basic:person/basic:bsn,
                '',
                basic:registerRequestMessage/basic:body/basic:applicant/basic:person/basic:bsn),
            'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')" />
    <xsl:variable name="commercialRegistryNumber" select="zgw:WrapNullOrSkip('basic:commercialRegistryNumber', 'skip', zgw:FromOrderedSource(
                $CommercialRegistryNumber,
                $RegisterRequestMessage/basic:registerRequestMessage/basic:body/basic:applicant/basic:organization/basic:commercialRegistryNumber,
                '',
                basic:registerRequestMessage/basic:body/basic:applicant/basic:organization/basic:commercialRegistryNumber),
            'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')" />
    <xsl:variable name="username" select="zgw:WrapNullOrSkip('basic:username', 'skip', zgw:FromOrderedSource(
                $Username,
                $RegisterRequestMessage/basic:registerRequestMessage/basic:body/basic:applicant/basic:employee/basic:username,
                '',
                basic:registerRequestMessage/basic:body/basic:applicant/basic:employee/basic:username),
            'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')" />
    
    <xsl:template match="/">
        <basic:registerRequestMessage>
            <headerproperties:requestProperties>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:user', 'null', zgw:FromOrderedSource(
                    $User, 
                    $RegisterRequestMessage/basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:user, 
                    $InitiateResponseMessage/basic:initiateResponseMessage/headerproperties:responseProperties/headerproperties:user, 
                    basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:user),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:password', 'null', zgw:FromOrderedSource(
                    $Password, 
                    $RegisterRequestMessage/basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:password, 
                    $InitiateResponseMessage/basic:initiateResponseMessage/headerproperties:responseProperties/headerproperties:password, 
                    basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:password),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:domain', 'null', zgw:FromOrderedSource(
                    $Domain, 
                    $RegisterRequestMessage/basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:domain, 
                    $InitiateResponseMessage/basic:initiateResponseMessage/headerproperties:responseProperties/headerproperties:domain, 
                    basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:domain),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:correlationId', 'null', zgw:FromOrderedSource(
                    $CorrelationId, 
                    $RegisterRequestMessage/basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:correlationId, 
                    $InitiateResponseMessage/basic:initiateResponseMessage/headerproperties:responseProperties/headerproperties:correlationId, 
                    basic:registerRequestMessage/headerproperties:requestProperties/headerproperties:correlationId),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
            </headerproperties:requestProperties>
            <basic:body>
                <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                    $InitiatingSubject,
                    $RegisterRequestMessage//basic:initiatingSubject,
                    '',
                    //basic:initiatingSubject)"/>
                <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                    $Parties/basic:parties,
                    $RegisterRequestMessage//basic:parties,
                    '',
                    //basic:parties)"/>
                <basic:xml>
                    <xsl:variable name="summary">
                        <xsl:apply-templates select="$Summary/data"/>
                    </xsl:variable>
                    <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                        $summary/summary, 
                        $RegisterRequestMessage//summary, 
                        '', 
                        //summary)" />
                </basic:xml>
                <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                    $EmailParameters/emailparameters:emailParameters,
                    $RegisterRequestMessage//emailparameters:emailParameters,
                    '',
                    //emailparameters:emailParameters)"/>
                <processparameters:processParameters>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:process', 'empty', zgw:FromOrderedSource(
                        $Process,
                        $RegisterRequestMessage//processparameters:process,
                        '',
                        //processparameters:process),
                        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                    <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                        $Payment/processparameters:payment,
                        $RegisterRequestMessage//processparameters:payment,
                        '',
                        //processparameters:payment)"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:sendFormByMail', 'skip', zgw:FromOrderedSource(
                        $SendFormByMail,
                        $Payment/processparameters:processParameters/processparameters:sendFormByMail,
                        '',
                        processparameters:processParameters/processparameters:sendFormByMail),
                        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:documents', 'skip', zgw:FromOrderedSource(
                        $Documents,
                        $Payment/processparameters:processParameters/processparameters:documents,
                        '',
                        processparameters:processParameters/processparameters:documents),
                        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:numberOfDocuments', 'skip', zgw:FromOrderedSource(
                        $NumberOfDocuments,
                        $Payment/processparameters:processParameters/processparameters:numberOfDocuments,
                        '',
                        processparameters:processParameters/processparameters:numberOfDocuments),
                        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:closeCase', 'skip', zgw:FromOrderedSource(
                        $CloseCase,
                        $Payment/processparameters:processParameters/processparameters:closeCase,
                        '',
                        processparameters:processParameters/processparameters:closeCase),
                        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                </processparameters:processParameters>
                <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                    $CaseParameters/caseparameters:caseParameters, 
                    $RegisterRequestMessage/caseparameters:caseParameters,
                    '',
                    //caseparameters:caseParameters)"/>
            </basic:body>
        </basic:registerRequestMessage>
    </xsl:template>

    <xsl:template match="/data">
        <summary>
            <xsl:for-each select="/data/*">
                <xsl:element name="{name(current())}" namespace="{namespace-uri(current())}">
                    <form>
                        <xsl:for-each select="current()/*">
                            <xsl:copy-of select="."/>
                        </xsl:for-each>
                    </form>
                </xsl:element>
            </xsl:for-each>
        </summary>
    </xsl:template>
</xsl:stylesheet>