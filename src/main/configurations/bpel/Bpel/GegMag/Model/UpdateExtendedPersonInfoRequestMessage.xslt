<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:geg="http://www.emaxx.org/functional/gegmag"
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
        <geg:updateExtendedPersonInfo>
            <geg:personExtInfoMessage>
                <geg:persons>
                    <xsl:apply-templates select="//*:lookUpPersonResponse/*:personDetailsMessage/*:persons/*:person/*:supplementary"/>
                </geg:persons>
            </geg:personExtInfoMessage>
        </geg:updateExtendedPersonInfo>
    </xsl:template>

    <xsl:template match="*:supplementary">
        <geg:person>
            <xsl:apply-templates select="@*|node()"/>
        </geg:person>
    </xsl:template>

    <xsl:template match="*:emailAddress">
        <geg:emailAddress>
            <xsl:value-of select="replace($EmailAddress, ' ', '')"/>
        </geg:emailAddress>
    </xsl:template>

    <xsl:template match="*:telephoneNumberHome">
        <geg:telephoneNumberHome>
            <xsl:value-of select="replace($TelephoneNumber, ' ', '')"/>
        </geg:telephoneNumberHome>
    </xsl:template>
</xsl:stylesheet>