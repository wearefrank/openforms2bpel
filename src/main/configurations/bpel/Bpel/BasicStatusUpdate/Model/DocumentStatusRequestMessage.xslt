<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basicstatusupdate="http://www.emaxx.org/bpel/proces/xsd/eMAXX/BasicStatusUpdate"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    xmlns:document="http://www.emaxx.org/functional/cases/document"
    xmlns:common="http://www.emaxx.org/egov/common"
    xmlns:headerproperties="http://www.emaxx.org/bpel/proces/xsd/headerproperties"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="Document" as="node()"><document:document /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="DocumentStatusRequestMessage" as="node()"><basicstatusupdate:documentStatusRequestMessage /></xsl:param>
    
    <xsl:param name="User" select="''" as="xs:string" />
    <xsl:param name="Password" select="''" as="xs:string" />
    <xsl:param name="Domain" select="''" as="xs:string" />
    <xsl:param name="CorrelationId" select="''" as="xs:string" />
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="FileName" select="''" as="xs:string" />
    <xsl:param name="DocumentType_Description" select="''" as="xs:string" />
    <xsl:param name="Author" select="''" as="xs:string" />
    <xsl:param name="Title" select="''" as="xs:string" />
    <xsl:param name="Subject" select="''" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    <xsl:param name="Language_Code" select="''" as="xs:string" />
    <xsl:param name="ContentType" select="''" as="xs:string" />
    <xsl:param name="Reference" select="''" as="xs:string" />
    <xsl:param name="Status_Code" select="''" as="xs:string" />
    <xsl:param name="Status_Clarification" select="''" as="xs:string" />

    <xsl:template match="/">
        <basicstatusupdate:documentStatusRequestMessage>
            <headerproperties:requestProperties>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:user', 'null', zgw:FromOrderedSource(
                    $User, 
                    $DocumentStatusRequestMessage//headerproperties:user, 
                    '', 
                    //headerproperties:user),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:password', 'null', zgw:FromOrderedSource(
                    $Password, 
                    $DocumentStatusRequestMessage//headerproperties:password, 
                    '', 
                    //headerproperties:password),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:domain', 'null', zgw:FromOrderedSource(
                    $Domain, 
                    $DocumentStatusRequestMessage//headerproperties:domain, 
                    '', 
                    //headerproperties:domain),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:correlationId', 'null', zgw:FromOrderedSource(
                    $CorrelationId, 
                    $DocumentStatusRequestMessage//headerproperties:correlationId, 
                    '', 
                    //headerproperties:correlationId),
                    'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
            </headerproperties:requestProperties>
            <basicstatusupdate:body>
                <xsl:copy-of select="zgw:WrapNullOrSkip('basicstatusupdate:referenceNumber', 'empty', zgw:FromOrderedSource(
                    $ReferenceNumber, 
                    $DocumentStatusRequestMessage//*:document/*:referenceNumber, 
                    '', 
                    //*:document/*:referenceNumber),
                    'http://www.emaxx.org/bpel/proces/xsd/eMAXX/BasicStatusUpdate')"/>
                <basicstatusupdate:documents>
                    <common:document>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:id', 'null', zgw:FromOrderedSource(
                            $Id, 
                            $DocumentStatusRequestMessage//common:id, 
                            '', 
                            //common:id),
                            'http://www.emaxx.org/egov/common')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:fileName', 'empty', zgw:FromOrderedSource(
                            $FileName, 
                            $DocumentStatusRequestMessage//common:fileName, 
                            $Document//document:fileName, 
                            //common:fileName),
                            'http://www.emaxx.org/egov/common')"/>
                        <common:documentType>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('common:documentType', 'empty', zgw:FromOrderedSource(
                                $DocumentType_Description, 
                                $DocumentStatusRequestMessage//common:description, 
                                $Document//document:documentType/document:description, 
                                //common:description),
                                'http://www.emaxx.org/egov/common')"/>
                        </common:documentType>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:author', 'empty', zgw:FromOrderedSource(
                            $Author, 
                            $DocumentStatusRequestMessage//common:author, 
                            $Document//document:author, 
                            //common:author),
                            'http://www.emaxx.org/egov/common')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:title', 'empty', zgw:FromOrderedSource(
                            $Title, 
                            $DocumentStatusRequestMessage//common:title, 
                            $Document//document:title, 
                            //common:title),
                            'http://www.emaxx.org/egov/common')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:subject', 'empty', zgw:FromOrderedSource(
                            $Subject, 
                            $DocumentStatusRequestMessage//common:subject, 
                            '', 
                            //common:subject),
                            'http://www.emaxx.org/egov/common')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:description', 'empty', zgw:FromOrderedSource(
                            $Description, 
                            $DocumentStatusRequestMessage//common:description, 
                            $Document//document:description, 
                            //common:description),
                            'http://www.emaxx.org/egov/common')"/>
                        <common:language>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('common:code', 'empty', zgw:FromOrderedSource(
                                $Language_Code, 
                                $DocumentStatusRequestMessage//common:language/common:code, 
                                $Document//document:language/document:code, 
                                //common:language/common:code),
                                'http://www.emaxx.org/egov/common')"/>
                        </common:language>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:contentType', 'empty', zgw:FromOrderedSource(
                            $ContentType, 
                            $DocumentStatusRequestMessage//common:contentType, 
                            '', 
                            //common:contentType),
                            'http://www.emaxx.org/egov/common')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('common:reference', 'empty', zgw:FromOrderedSource(
                            $Reference, 
                            $DocumentStatusRequestMessage//common:reference, 
                            $Document//document:referenceNumber, 
                            //common:reference),
                            'http://www.emaxx.org/egov/common')"/>
                        <common:status>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('common:code', 'empty', zgw:FromOrderedSource(
                                $Status_Code, 
                                $DocumentStatusRequestMessage//common:code, 
                                '', 
                                //common:code),
                                'http://www.emaxx.org/egov/common')"/>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('common:clarification', 'null', zgw:FromOrderedSource(
                                $Status_Clarification, 
                                $DocumentStatusRequestMessage//common:clarification, 
                                '', 
                                //common:clarification),
                                'http://www.emaxx.org/egov/common')"/>
                        </common:status>
                    </common:document>
                </basicstatusupdate:documents>
            </basicstatusupdate:body>
        </basicstatusupdate:documentStatusRequestMessage>
    </xsl:template>
</xsl:stylesheet>