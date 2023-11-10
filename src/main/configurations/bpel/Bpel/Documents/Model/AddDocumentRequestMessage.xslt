<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:document="http://www.emaxx.org/functional/cases/document"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    <xsl:param name="ZgwEnkelvoudigInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject /></xsl:param>
    
    <!-- Create/Enrich -->
    <xsl:param name="Document" as="node()"><document:document /></xsl:param>
    
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="FileName" select="''" as="xs:string" />
    <xsl:param name="MimeType" select="''" as="xs:string" />
    <xsl:param name="MimeTypeReason" select="''" as="xs:string" />
    <xsl:param name="MimeTypeVersion" select="''" as="xs:string" />
    <xsl:param name="MimeTypeActive" select="''" as="xs:string" />
    <xsl:param name="FileSize" select="''" as="xs:string" />
    <xsl:param name="ForwardExtension" select="''" as="xs:string" />
    <xsl:param name="ExpirationDate" select="''" as="xs:string" />
    <xsl:param name="BatchNumber" select="''" as="xs:string" />
    <xsl:param name="Version" select="''" as="xs:string" />
    <xsl:param name="ConfidentialityLevel" select="''" as="xs:string" />
    <xsl:param name="HashValue" select="''" as="xs:string" />
    <xsl:param name="RegistrationDate" select="''" as="xs:string" />
    <xsl:param name="CreationDate" select="''" as="xs:string" />
    <xsl:param name="ReceiptDate" select="''" as="xs:string" />
    <xsl:param name="SendDate" select="''" as="xs:string" />
    <xsl:param name="Title" select="''" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    <xsl:param name="Author" select="''" as="xs:string" />
    <xsl:param name="Format" select="''" as="xs:string" />
    <xsl:param name="Status" select="''" as="xs:string" />
    <xsl:param name="InitialDocumentIndication" select="''" as="xs:string" />
    <xsl:param name="Characteristic" select="''" as="xs:string" />
    <xsl:param name="ReceivedRegistered" select="''" as="xs:string" />
    <xsl:param name="MailRegistrationNr" select="''" as="xs:string" />
    <xsl:param name="Language" select="''" as="xs:string" />
    <xsl:param name="DocumentType" select="''" as="xs:string" />
    <xsl:param name="Case" select="''" as="xs:string" />
    <xsl:param name="Provider" select="''" as="xs:string" />
    <xsl:param name="TargetSystems" as="node()"><document:document /></xsl:param>
    <xsl:param name="SourceSystem" select="''" as="xs:string" />
    
    <xsl:variable name="language" select="zgw:WrapNullOrSkip('document:code', 'skip', zgw:FromOrderedSource(
        $Language, 
        $Document//document:language/document:code, 
        $ZgwEnkelvoudigInformatieObject//taal, 
        //document:language/document:code),
        'http://www.emaxx.org/functional/cases/document')"/>
    <xsl:variable name="case" select="zgw:WrapNullOrSkip('document:referenceNumber', 'skip', zgw:FromOrderedSource(
        $Case, 
        $Document//document:case/document:referenceNumber, 
        '', 
        //document:case/document:referenceNumber),
        'http://www.emaxx.org/functional/cases/document')"/>
    <xsl:variable name="provider" select="zgw:WrapNullOrSkip('document:citizenNumber', 'skip', zgw:FromOrderedSource(
        $Provider, 
        $Document//document:provider/document:citizenNumber, 
        '', 
        //document:provider/document:citizenNumber),
        'http://www.emaxx.org/functional/cases/document')"/>

    <xsl:template match="/">
        <document:addDocument>
            <document:documentSaveMessage>
                <document:document>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:referenceNumber', 'empty', zgw:FromOrderedSource(
                        $ReferenceNumber, 
                        $Document//document:referenceNumber, 
                        $ZgwEnkelvoudigInformatieObject//identificatie, 
                        //document:referenceNumber),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:fileName', 'skip', zgw:FromOrderedSource(
                        $FileName, 
                        $Document//document:fileName, 
                        $ZgwEnkelvoudigInformatieObject//bestandsnaam, 
                        //document:fileName),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:mimeType', 'null', zgw:FromOrderedSource(
                        $MimeType, 
                        $Document//document:mimeType, 
                        $ZgwEnkelvoudigInformatieObject//formaat, 
                        //document:mimeType),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:mimeTypeReason', 'skip', zgw:FromOrderedSource(
                        $MimeTypeReason, 
                        $Document//document:mimeTypeReason, 
                        '', 
                        //document:mimeTypeReason),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:mimeTypeVersion', 'skip', zgw:FromOrderedSource(
                        $MimeTypeVersion, 
                        $Document//document:mimeTypeVersion, 
                        '', 
                        //document:mimeTypeVersion),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:mimeTypeActive', 'skip', zgw:FromOrderedSource(
                        $MimeTypeActive, 
                        $Document//document:mimeTypeActive, 
                        '', 
                        //document:mimeTypeActive),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:fileSize', 'skip', zgw:FromOrderedSource(
                        $FileSize, 
                        $Document//document:fileSize, 
                        $ZgwEnkelvoudigInformatieObject//bestandsomvang, 
                        //document:fileSize),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:forwardExtension', 'empty', zgw:FromOrderedSource(
                        $ForwardExtension, 
                        $Document//document:forwardExtension, 
                        tokenize($ZgwEnkelvoudigInformatieObject//bestandsnaam, '.')[last()], 
                        //document:forwardExtension),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:expirationDate', 'null', zgw:FromOrderedSource(
                        $ExpirationDate, 
                        $Document//document:expirationDate, 
                        '', 
                        //document:expirationDate),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:batchNumber', 'skip', zgw:FromOrderedSource(
                        $BatchNumber, 
                        $Document//document:batchNumber, 
                        '', 
                        //document:batchNumber),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:version', 'skip', zgw:FromOrderedSource(
                        $Version, 
                        $Document//document:version, 
                        $ZgwEnkelvoudigInformatieObject//versie, 
                        //document:version),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:confidentialityLevel', 'null', zgw:FromOrderedSource(
                        $ConfidentialityLevel, 
                        $Document//document:confidentialityLevel, 
                        '', 
                        //document:confidentialityLevel),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:hashValue', 'skip', zgw:FromOrderedSource(
                        $HashValue, 
                        $Document//document:hashValue, 
                        '', 
                        //document:hashValue),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:registrationDate', 'null', zgw:FromOrderedSource(
                        $RegistrationDate, 
                        $Document//document:registrationDate, 
                        $ZgwEnkelvoudigInformatieObject//beginRegistratie, 
                        //document:registrationDate),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:creationDate', 'null', zgw:FromOrderedSource(
                        $CreationDate, 
                        $Document//document:creationDate, 
                        zgw:toZgwDateTime($ZgwEnkelvoudigInformatieObject//creatiedatum), 
                        //document:creationDate),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:receiptDate', 'null', zgw:FromOrderedSource(
                        $ReceiptDate, 
                        $Document//document:receiptDate, 
                        zgw:toZgwDateTime($ZgwEnkelvoudigInformatieObject//ontvangstdatum), 
                        //document:receiptDate),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:sendDate', 'null', zgw:FromOrderedSource(
                        $SendDate, 
                        $Document//document:sendDate, 
                        zgw:toZgwDateTime($ZgwEnkelvoudigInformatieObject//verzenddatum), 
                        //document:sendDate),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:title', 'empty', zgw:FromOrderedSource(
                        $Title, 
                        $Document//document:title, 
                        $ZgwEnkelvoudigInformatieObject//titel, 
                        //document:title),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:description', 'empty', zgw:FromOrderedSource(
                        $Description, 
                        $Document//document:description, 
                        $ZgwEnkelvoudigInformatieObject//beschrijving, 
                        //document:description),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:author', 'empty', zgw:FromOrderedSource(
                        $Author, 
                        $Document//document:author, 
                        $ZgwEnkelvoudigInformatieObject//auteur, 
                        //document:author),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:format', 'empty', zgw:FromOrderedSource(
                        $Format, 
                        $Document//document:format, 
                        tokenize($ZgwEnkelvoudigInformatieObject//formaat, '/')[last()], 
                        //document:format),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:status', 'empty', zgw:FromOrderedSource(
                        $Status, 
                        $Document//document:status, 
                        $ZgwEnkelvoudigInformatieObject//status, 
                        //document:status),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:initialDocumentIndication', 'null', zgw:FromOrderedSource(
                        $InitialDocumentIndication, 
                        $Document//document:initialDocumentIndication, 
                        '', 
                        //document:initialDocumentIndication),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:characteristic', 'skip', zgw:FromOrderedSource(
                        $Characteristic, 
                        $Document//document:characteristic, 
                        '', 
                        //document:characteristic),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:receivedRegistered', 'skip', zgw:FromOrderedSource(
                        $ReceivedRegistered, 
                        $Document//document:receivedRegistered, 
                        '', 
                        //document:receivedRegistered),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:mailRegistrationNr', 'skip', zgw:FromOrderedSource(
                        $MailRegistrationNr, 
                        $Document//document:mailRegistrationNr, 
                        '', 
                        //document:mailRegistrationNr),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:language', 'skip', zgw:ObjectFromOrderedSource(
                        $language, 
                        $Document//document:language, 
                        '', 
                        //document:language),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <document:documentType>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('document:description', 'empty', zgw:FromOrderedSource(
                            $DocumentType, 
                            $Document//document:documentType/document:description, 
                            '', 
                            //document:documentType/document:description),
                            'http://www.emaxx.org/functional/cases/document')"/>
                    </document:documentType>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:case', 'skip', zgw:ObjectFromOrderedSource(
                        $case, 
                        $Document//document:case, 
                        '', 
                        //document:case),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:provider', 'skip', zgw:ObjectFromOrderedSource(
                        $provider, 
                        $Document//document:provider, 
                        '', 
                        //document:provider),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:targetSystems', 'empty', zgw:ObjectFromOrderedSource(
                        $TargetSystems, 
                        $Document//document:targetSystems, 
                        '', 
                        //document:targetSystems),
                        'http://www.emaxx.org/functional/cases/document')"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('document:sourceSystem', 'skip', zgw:FromOrderedSource(
                        $SourceSystem, 
                        $Document//document:sourceSystem, 
                        '', 
                        //document:sourceSystem),
                        'http://www.emaxx.org/functional/cases/document')"/>
                </document:document>
            </document:documentSaveMessage>
        </document:addDocument>
    </xsl:template>
</xsl:stylesheet>