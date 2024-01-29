<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:payment="http://www.emaxx.org/functional/cases/payment"
    xmlns:payments="http://www.emaxx.org/functional/cases/payments"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
       
    <!-- Create/Enrich -->
    <xsl:param name="AddPaymentStatesMessage" as="node()"><payments:addPaymentStates /></xsl:param>
    
    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="PaymentId" select="''" as="xs:string" />
    <xsl:param name="StateCode" select="''" as="xs:string" />
    <xsl:param name="ExtCode" select="''" as="xs:string" />
    <xsl:param name="ExtMessage" select="''" as="xs:string" />
    <xsl:param name="SetDate" select="''" as="xs:string" />

    <xsl:template match="/">
        <payments:addPaymentStates>
         <payment:paymentStateSaveMessage>
            <payment:paymentStates>
                <xsl:call-template name="paymentState" />
            </payment:paymentStates>
         </payment:paymentStateSaveMessage>
      </payments:addPaymentStates>
    </xsl:template>

    <xsl:template name="paymentState">
        <payment:paymentState>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:id', 'null', zgw:FromOrderedSource(
                $Id, 
                $AddPaymentStatesMessage//payment:id, 
                '', 
                //payment:id),
                'http://www.emaxx.org/functional/cases/payment')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:paymentId', 'null', zgw:FromOrderedSource(
                $PaymentId, 
                $AddPaymentStatesMessage//payment:paymentId, 
                '', 
                //payment:paymentId),
                'http://www.emaxx.org/functional/cases/payment')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:stateCode', 'empty', zgw:FromOrderedSource(
                $StateCode, 
                $AddPaymentStatesMessage//payment:stateCode, 
                '', 
                //payment:stateCode),
                'http://www.emaxx.org/functional/cases/payment')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:extCode', 'empty', zgw:FromOrderedSource(
                $ExtCode, 
                $AddPaymentStatesMessage//payment:extCode, 
                '', 
                //payment:extCode),
                'http://www.emaxx.org/functional/cases/payment')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:extMessage', 'empty', zgw:FromOrderedSource(
                $ExtMessage, 
                $AddPaymentStatesMessage//payment:extMessage, 
                '', 
                //payment:extMessage),
                'http://www.emaxx.org/functional/cases/payment')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('payment:setDate', 'null', zgw:FromOrderedSource(
                xs:string(xs:date($SetDate)), 
                $AddPaymentStatesMessage//payment:SetDate, 
                '', 
                //payment:setDate),
                'http://www.emaxx.org/functional/cases/payment')"/>
        </payment:paymentState>
    </xsl:template>
</xsl:stylesheet>