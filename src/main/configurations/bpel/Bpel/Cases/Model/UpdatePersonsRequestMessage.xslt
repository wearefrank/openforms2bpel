<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:zgw="http://google.com/zgw"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:cases="http://www.emaxx.org/functional/cases"
                xmlns:document="http://www.emaxx.org/functional/cases/document"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Create/Enrich -->
    <xsl:param name="EmailAddress" select="''" as="xs:string" />
    <xsl:param name="TelephoneNumber" select="''" as="xs:string" />
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">
        <cases:updatePersons>
            <cases:personSaveMessage>
                <cases:persons>
                    <xsl:apply-templates select="//*:caseDetailsMessage/*:cases/*:case/*:initiatingSubject/*:person"/>
                </cases:persons>
            </cases:personSaveMessage>
        </cases:updatePersons>
    </xsl:template>
    
    <xsl:template match="*:emailAddress">
        <cases:emailAddress>
            <xsl:value-of select="$EmailAddress"/>
        </cases:emailAddress>
    </xsl:template>
    
    <xsl:template match="*:telephoneNumber">
        <cases:telephoneNumber>
            <xsl:value-of select="$TelephoneNumber"/>
        </cases:telephoneNumber>
    </xsl:template>
</xsl:stylesheet>