<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:csc="http://www.emaxx.org/functional/cases/subscription/callback"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
       
    <!-- Create/Enrich -->
    <xsl:param name="UpdateStatusRequestMessage" as="node()"><csc:updateStatusRequest /></xsl:param>
    
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="ProcessData" as="node()?" />
    <xsl:param name="PaymentState_PaymentId" select="''" as="xs:string" />
    <xsl:param name="PaymentState_Date" select="''" as="xs:string" />
    <xsl:param name="PaymentState_ExtCode" select="''" as="xs:string" />
    <xsl:param name="PaymentState_ExtMessage" select="''" as="xs:string" />
    <xsl:param name="PaymentState_State_Code" select="''" as="xs:string" />
    <xsl:param name="PaymentState_State_Description" select="''" as="xs:string" />
    <xsl:param name="PaymentState_State_Clarification" select="''" as="xs:string" />

    <xsl:template match="/">
        <csc:updateStatus>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:referenceNumber', 'empty', zgw:FromOrderedSource(
                $ReferenceNumber, 
                $UpdateStatusRequestMessage//csc:referenceNumber, 
                '', 
                //csc:referenceNumber),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:processData', 'skip', zgw:ObjectFromOrderedSource(
                $ProcessData,
                $UpdateStatusRequestMessage//csc:processData, 
                '', 
                //csc:processData),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <!-- <xs:element name="caseStatuses" type="csc:tCaseStatuses"/> -->
            <csc:paymentStates>
                <xsl:call-template name="paymentState" />
            </csc:paymentStates>
            <!-- <xs:element name="documentStatuses" type="csc:tDocumentDocumentStatuses"/> -->
        </csc:updateStatus>
    </xsl:template>

    <xsl:template name="paymentState">
        <csc:paymentState>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:paymentId', 'null', zgw:FromOrderedSource(
                $PaymentState_PaymentId, 
                $UpdateStatusRequestMessage//csc:paymentId, 
                '', 
                //csc:paymentId),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:date', 'null', zgw:FromOrderedSource(
                xs:string(xs:date($PaymentState_Date)), 
                $UpdateStatusRequestMessage//csc:date, 
                '', 
                //csc:date),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:extCode', 'empty', zgw:FromOrderedSource(
                $PaymentState_ExtCode, 
                $UpdateStatusRequestMessage//csc:extCode, 
                '', 
                //csc:extCode),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('csc:extMessage', 'empty', zgw:FromOrderedSource(
                $PaymentState_ExtMessage, 
                $UpdateStatusRequestMessage//csc:extMessage, 
                '', 
                //csc:extMessage),
                'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            <csc:tState>
                <xsl:copy-of select="zgw:WrapNullOrSkip('csc:code', 'empty', zgw:FromOrderedSource(
                    $PaymentState_State_Code, 
                    $UpdateStatusRequestMessage//csc:code, 
                    '', 
                    //csc:code),
                    'http://www.emaxx.org/functional/cases/subscription/callback')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('csc:description', 'empty', zgw:FromOrderedSource(
                    $PaymentState_State_Description, 
                    $UpdateStatusRequestMessage//csc:description, 
                    '', 
                    //csc:description),
                    'http://www.emaxx.org/functional/cases/subscription/callback')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('csc:codclarificatione', 'empty', zgw:FromOrderedSource(
                    $PaymentState_State_Clarification, 
                    $UpdateStatusRequestMessage//csc:clarification, 
                    '', 
                    //csc:clarification),
                    'http://www.emaxx.org/functional/cases/subscription/callback')"/>
            </csc:tState>
        </csc:paymentState>
    </xsl:template>
</xsl:stylesheet>