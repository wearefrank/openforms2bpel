<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />

        <!-- Map -->
    <xsl:param name="ZgwStatusType" as="node()"><ZgwStatusType/></xsl:param>
    <xsl:param name="ZgwZaak" as="node()"><ZgwZaak/></xsl:param>

    <xsl:param name="ZdsEinddatum" select="'Undefined'" as="xs:string"/>
    <xsl:param name="ZdsStatusDatum" select="''" as="xs:string"/>
    
        <!-- Create/Enrich -->
    <xsl:param name="ZgwStatus" as="node()"><ZgwStatus/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Uuid" select="''" as="xs:string" />
    <xsl:param name="Zaak" select="''" as="xs:string" />
    <xsl:param name="Statustype" select="''" as="xs:string" />
    <xsl:param name="DatumStatusGezet" select="''" as="xs:string" />
    <xsl:param name="Statustoelichting" select="''" as="xs:string" />

    <xsl:variable name="DatumStatusGezetFromParams" as="xs:string">
        <xsl:choose>
            <xsl:when test="$ZgwStatusType/ZgwStatusType/isEindstatus = 'true' and not($ZdsEinddatum = 'Undefined')">
                <xsl:value-of select="zgw:toZgwDatetime(concat($ZdsEinddatum,'000000'))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="zgw:toZgwDatetime($ZdsStatusDatum)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:template match="/">
        <ZgwStatus>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                    $Url, 
                    $ZgwStatus/ZgwStatus/url, 
                    '', 
                    ZgwStatus/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uuid', 'skip', zgw:FromOrderedSource(
                    $Uuid, 
                    $ZgwStatus/ZgwStatus/uuid,
                    '', 
                    ZgwStatus/uuid))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaak', 'skip', zgw:FromOrderedSource(
                    $Zaak, 
                    $ZgwStatus/ZgwStatus/zaak, 
                    $ZgwZaak/ZgwZaak/url, 
                    ZgwStatus/zaak))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('statustype', 'skip', zgw:FromOrderedSource(
                    $Statustype, 
                    $ZgwStatus/ZgwStatus/statustype,
                    $ZgwStatusType/ZgwStatusType/url, 
                    ZgwStatus/statustype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('datumStatusGezet', 'skip', zgw:FromOrderedSource(
                    $DatumStatusGezet, 
                    $ZgwStatus/ZgwStatus/datumStatusGezet,
                    $DatumStatusGezetFromParams, 
                    ZgwStatus/datumStatusGezet))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('statustoelichting', 'empty', zgw:FromOrderedSource(
                    $Statustoelichting, 
                    $ZgwStatus/ZgwStatus/statustoelichting,
                    $ZgwStatusType/ZgwStatusType/omschrijving, 
                    ZgwStatus/statustoelichting))"/>
        </ZgwStatus>
    </xsl:template>
</xsl:stylesheet>