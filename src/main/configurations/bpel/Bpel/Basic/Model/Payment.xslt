<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:processparameters='http://www.emaxx.org/bpel/proces/xsd/processparameters'
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="Payment" as="node()"><processparameters:payment /></xsl:param>
    
    <xsl:param name="InitiatePayment" select="''" as="xs:string" />
    <xsl:param name="SubscriptionDuration" select="''" as="xs:string" />
    <xsl:param name="Price" select="''" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    <xsl:param name="AcceptUrl" select="''" as="xs:string" />
    <xsl:param name="DeclineUrl" select="''" as="xs:string" />
    <xsl:param name="ExceptionUrl" select="''" as="xs:string" />
    <xsl:param name="CancelUrl" select="''" as="xs:string" />

    <xsl:variable name="acceptUrl" select="zgw:WrapNullOrSkip('processparameters:acceptUrl', 'empty', zgw:FromOrderedSource(
        $AcceptUrl, 
        $Payment//processparameters:acceptUrl, 
        '', 
        //processparameters:acceptUrl),
        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
    
    <xsl:variable name="declineUrl" select="zgw:WrapNullOrSkip('processparameters:declineUrl', 'empty', zgw:FromOrderedSource(
        $DeclineUrl, 
        $Payment//processparameters:declineUrl, 
        '', 
        //processparameters:declineUrl),
        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
    
    <xsl:variable name="exceptionUrl" select="zgw:WrapNullOrSkip('processparameters:exceptionUrl', 'empty', zgw:FromOrderedSource(
        $ExceptionUrl, 
        $Payment//processparameters:exceptionUrl, 
        '', 
        //processparameters:exceptionUrl),
        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>

    <xsl:variable name="cancelUrl" select="zgw:WrapNullOrSkip('processparameters:cancelUrl', 'empty', zgw:FromOrderedSource(
        $CancelUrl, 
        $Payment//processparameters:cancelUrl, 
        '', 
        //processparameters:cancelUrl),
        'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
    
    <xsl:template match="/">
        <processparameters:payment>
            <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:initiatePayment', 'skip', zgw:FromOrderedSource(
                $InitiatePayment, 
                $Payment//processparameters:initiatePayment, 
                '', 
                //processparameters:initiatePayment),
                'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:subscriptionDuration', 'null', zgw:FromOrderedSource(
                $SubscriptionDuration,
                $Payment//processparameters:subscriptionDuration,
                '',
                //processparameters:subscriptionDuration),
                'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
            <processparameters:paymentInfo>
                <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:price', 'empty', zgw:FromOrderedSource(
                    replace($Price, ',', '.'),
                    $Payment//processparameters:price,
                    '',
                    //processparameters:price),
                    'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('processparameters:description', 'empty', zgw:FromOrderedSource(
                    $Description,
                    $Payment//processparameters:description,
                    '',
                    //processparameters:description),
                    'http://www.emaxx.org/bpel/proces/xsd/processparameters')"/>
            </processparameters:paymentInfo>
            <processparameters:redirection>
                <xsl:copy-of select="$acceptUrl"/>
                <xsl:copy-of select="$declineUrl"/>
                <xsl:copy-of select="$exceptionUrl"/>
                <xsl:copy-of select="$cancelUrl"/>
            </processparameters:redirection>
        </processparameters:payment>
    </xsl:template>
</xsl:stylesheet>