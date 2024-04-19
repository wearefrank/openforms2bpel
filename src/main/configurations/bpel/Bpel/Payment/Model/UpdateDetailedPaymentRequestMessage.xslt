<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:payment="http://www.emaxx.org/functional/cases/payment"
    xmlns:payments="http://www.emaxx.org/functional/cases/payments"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Create/Enrich -->
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <payments:updateDetailedPayment>
            <payment:detailedPaymentSaveMessage>
                <xsl:apply-templates select="//*:paymentDetailsMessage/*:payments/*:payment"/>
            </payment:detailedPaymentSaveMessage>
        </payments:updateDetailedPayment>
    </xsl:template>

    <xsl:template match="*:payment">
        <payment:payment>
            <xsl:apply-templates select="@*|node()"/>
        </payment:payment>
    </xsl:template>

    <xsl:template match="*:referenceNumber">
        <payment:referenceNumber>
            <xsl:value-of select="$ReferenceNumber"/>
        </payment:referenceNumber>
    </xsl:template>

    <xsl:template match="*:payment/*:description">
        <payment:description>
            <xsl:value-of select="$Description"/>
        </payment:description>
    </xsl:template>
</xsl:stylesheet>