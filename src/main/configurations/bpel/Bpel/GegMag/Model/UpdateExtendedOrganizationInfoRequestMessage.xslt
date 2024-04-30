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
        <geg:updateExtendedOrganizationInfo>
            <geg:organizationExtInfoMessage>
                <geg:organizations>
                    <xsl:apply-templates select="//*:lookUpExtendedOrganizationInfoResponse/*:organizationExtInfoMessage/*:organizations"/>
                </geg:organizations>
            </geg:organizationExtInfoMessage>
        </geg:updateExtendedOrganizationInfo>
    </xsl:template>

    <xsl:template match="*:organization">
        <geg:organization>
            <xsl:apply-templates select="@*|node()"/>
        </geg:organization>
    </xsl:template>

    <xsl:template match="*:emailAddress">
        <geg:emailAddress>
            <xsl:value-of select="replace($EmailAddress, ' ', '')"/>
        </geg:emailAddress>
    </xsl:template>

    <xsl:template match="*:telephoneNumber">
        <geg:telephoneNumber>
            <xsl:value-of select="replace($TelephoneNumber, ' ', '')"/>
        </geg:telephoneNumber>
    </xsl:template>
</xsl:stylesheet>