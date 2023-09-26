<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:caseparameters='http://www.emaxx.org/bpel/proces/xsd/caseparameters'
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="CaseParameters" as="node()"><caseparameters:caseParameters /></xsl:param>
    
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    <xsl:param name="Clarification" select="''" as="xs:string" />
    <xsl:param name="Channel" select="''" as="xs:string" />
    <xsl:param name="UrgencyLevel" select="''" as="xs:string" />
    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="FileName" select="''" as="xs:string" />
    <xsl:param name="FileMimeType" select="''" as="xs:string" />
    <xsl:param name="FileData" select="''" as="xs:string" />
    <xsl:param name="AddStatus" select="''" as="xs:string" />

    <xsl:variable name="id" select="zgw:WrapNullOrSkip('caseparameters:id', 'skip', zgw:FromOrderedSource(
        $Id, 
        $CaseParameters//caseparameters:id, 
        '', 
        //caseparameters:id),
        'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>

    <xsl:variable name="fileData" select="zgw:WrapNullOrSkip('caseparameters:fileData', 'skip', zgw:FromOrderedSource(
        $FileData, 
        $CaseParameters//caseparameters:fileData, 
        '', 
        //caseparameters:fileData),
        'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
    
    <xsl:template match="/">
        <caseparameters:caseParameters>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:referenceNumber', 'skip', zgw:FromOrderedSource(
                $ReferenceNumber, 
                $CaseParameters/caseparameters:caseParameters/caseparameters:referenceNumber, 
                '', 
                caseparameters:caseParameters/caseparameters:referenceNumber),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:description', 'skip', zgw:FromOrderedSource(
                $Description, 
                $CaseParameters/caseparameters:caseParameters/caseparameters:description, 
                '', 
                caseparameters:caseParameters/caseparameters:description),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:clarification', 'skip', zgw:FromOrderedSource(
                $Clarification,
                $CaseParameters/caseparameters:caseParameters/caseparameters:clarification, 
                '', 
                caseparameters:caseParameters/caseparameters:clarification),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:channel', 'skip', zgw:FromOrderedSource(
                $Channel, 
                $CaseParameters/caseparameters:caseParameters/caseparameters:channel, 
                '', 
                caseparameters:caseParameters/caseparameters:channel),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:urgencyLevel', 'skip', zgw:FromOrderedSource(
                $UrgencyLevel, 
                $CaseParameters/caseparameters:caseParameters/caseparameters:urgencyLevel, 
                '', 
                caseparameters:caseParameters/caseparameters:urgencyLevel),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
            <xsl:if test="$id">
                <caseparameters:registrator>
                    <caseparameters:employee>
                        <xsl:copy-of select="$id"/>
                    </caseparameters:employee>
                </caseparameters:registrator>
            </xsl:if>
            <xsl:if test="$fileData">
                <caseparameters:document>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:fileName', 'skip', zgw:FromOrderedSource(
                        $FileName, 
                        $CaseParameters/caseparameters:caseParameters/caseparameters:document/caseparameters:fileName, 
                        '', 
                        caseparameters:caseParameters/caseparameters:document/caseparameters:fileName),
                        'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>

                    <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:fileMimeType', 'skip', zgw:FromOrderedSource(
                        $FileMimeType, 
                        $CaseParameters/caseparameters:caseParameters/caseparameters:document/caseparameters:fileMimeType, 
                        '', 
                        caseparameters:caseParameters/caseparameters:document/caseparameters:fileMimeType),
                        'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>

                    <xsl:copy-of select="$fileData"/>
                </caseparameters:document>
            </xsl:if>
            <xsl:copy-of select="zgw:WrapNullOrSkip('caseparameters:addStatus', 'skip', zgw:FromOrderedSource(
                $AddStatus, 
                $CaseParameters/caseparameters:caseParameters/caseparameters:addStatus, 
                '', 
                caseparameters:caseParameters/caseparameters:addStatus),
                'http://www.emaxx.org/bpel/proces/xsd/caseparameters')"/>
        </caseparameters:caseParameters>
    </xsl:template>
</xsl:stylesheet>