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
    <xsl:param name="LookUpPaymentsMessage" as="node()"><payments:lookUpPayments /></xsl:param>
    
    <xsl:param name="Id" select="''" as="xs:string" />
    <xsl:param name="Id_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="CaseId" select="''" as="xs:string" />
    <xsl:param name="CaseId_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="ReferenceNumber_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="Description" select="''" as="xs:string" />
    <xsl:param name="Description_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="Price" select="''" as="xs:string" />
    <xsl:param name="Price_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="SetDate" select="''" as="xs:string" />
    <xsl:param name="SetDate_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="EndDate" select="''" as="xs:string" />
    <xsl:param name="EndDate_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="ExtReferenceNumber" select="''" as="xs:string" />
    <xsl:param name="ExtReferenceNumber_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="ExtSystem_Code" select="''" as="xs:string" />
    <xsl:param name="ExtSystem_Code_Operator" select="'EQUAL'" as="xs:string" />
    <xsl:param name="ExtSystem_Description" select="''" as="xs:string" />
    <xsl:param name="ExtSystem_Description_Operator" select="'EQUAL'" as="xs:string" />
    
    <xsl:template match="/">
        <payments:lookUpPayments>
            <payment:paymentSearchMessage>
                <payment:referenceNumber operator="EQUAL">
                    <xsl:copy-of select="zgw:FromOrderedSource(
                        $ReferenceNumber, 
                        $LookUpPaymentsMessage//payment:referenceNumber, 
                        '', 
                        //payment:referenceNumber)"/>
                </payment:referenceNumber>
            </payment:paymentSearchMessage>
        </payments:lookUpPayments>
    </xsl:template>
</xsl:stylesheet>