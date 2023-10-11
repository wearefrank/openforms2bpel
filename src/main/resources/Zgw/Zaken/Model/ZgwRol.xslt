<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />

    <!-- Map -->
    <xsl:param name="ZdsHeeft" as="node()"><ZdsHeeft/></xsl:param>

    <!-- Create/Enrich -->
    <xsl:param name="ZgwRol" as="node()"><ZgwRol/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Uuid" select="''" as="xs:string" />
    <xsl:param name="Zaak" select="''" as="xs:string" />
    <xsl:param name="Betrokkene" select="''" as="xs:string" />
    <xsl:param name="BetrokkeneType" select="''" as="xs:string" />
    <xsl:param name="Roltype" select="''" as="xs:string" />
    <xsl:param name="Omschrijving" select="''" as="xs:string" />
    <xsl:param name="OmschrijvingGeneriek" select="''" as="xs:string" />
    <xsl:param name="Roltoelichting" select="''" as="xs:string" />
    <xsl:param name="Registratiedatum" select="''" as="xs:string" />
    <xsl:param name="IndicatieMachtiging" select="''" as="xs:string" />
    <xsl:param name="BetrokkeneIdentificatie" as="node()"><betrokkeneIdentificatie /></xsl:param>

    <xsl:param name="TypeRolOmschrijving"/>

    <xsl:variable name="ZdsBetrokkeneIdentificatie">
        <xsl:apply-templates select="$ZdsHeeft//medewerker[@entiteittype='MDW']"/>
        <xsl:apply-templates select="$ZdsHeeft//natuurlijkPersoon[@entiteittype='NPS']"/>
        <xsl:apply-templates select="$ZdsHeeft//nietNatuurlijkPersoon[@entiteittype='NNP']"/>
        <xsl:apply-templates select="$ZdsHeeft//vestiging[@entiteittype='VES']"/>
        <!-- <xsl:apply-templates select="$ZdsHeeft//organisatorischeeenheid"/> -->
    </xsl:variable>
    
	<xsl:template match="/">
        <ZgwRol>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                $Url, 
                $ZgwRol//url, 
                '', 
                //url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uuid', 'skip', zgw:FromOrderedSource(
                $Uuid, 
                $ZgwRol//uuid, 
                '', 
                //uuid))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaak', 'skip', zgw:FromOrderedSource(
                $Zaak, 
                $ZgwRol//zaak, 
                '', 
                //zaak))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('betrokkene', 'empty', zgw:FromOrderedSource(
                $Betrokkene, 
                $ZgwRol//betrokkene, 
                '', 
                //betrokkene))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('betrokkeneType', 'skip', zgw:FromOrderedSource(
                $BetrokkeneType, 
                $ZgwRol//betrokkeneType, 
                $ZdsBetrokkeneIdentificatie//betrokkeneType, 
                //betrokkeneType))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('roltype', 'skip', zgw:FromOrderedSource(
                $Roltype, 
                $ZgwRol//roltype, 
                '', 
                //roltype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('omschrijving', 'skip', zgw:FromOrderedSource(
                $Omschrijving, 
                $ZgwRol//omschrijving, 
                '', 
                //omschrijving))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('omschrijvingGeneriek', 'skip', zgw:FromOrderedSource(
                $OmschrijvingGeneriek, 
                $ZgwRol//omschrijvingGeneriek, 
                '', 
                //omschrijvingGeneriek))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('roltoelichting', 'skip', zgw:FromOrderedSource(
                $Roltoelichting, 
                $ZgwRol//roltoelichting, 
                $ZdsBetrokkeneIdentificatie//roltoelichting, 
                //roltoelichting))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('registratiedatum', 'skip', zgw:FromOrderedSource(
                $Registratiedatum, 
                $ZgwRol//registratiedatum, 
                $ZdsHeeft//registratiedatum, 
                //registratiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('indicatieMachtiging', 'skip', zgw:FromOrderedSource(
                $IndicatieMachtiging, 
                $ZgwRol//indicatieMachtiging, 
                $ZdsHeeft//indicatieMachtiging, 
                //indicatieMachtiging))"/>
            <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                $BetrokkeneIdentificatie//betrokkeneIdentificatie, 
                $ZgwRol//betrokkeneIdentificatie, 
                //betrokkeneIdentificatie,
                $ZdsBetrokkeneIdentificatie//betrokkeneIdentificatie)"/>
        </ZgwRol>
    </xsl:template>
	
    <xsl:template match="//medewerker[@entiteittype='MDW']">
        <betrokkeneType>medewerker</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(achternaam) > 0">
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', achternaam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', identificatie)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <achternaam><xsl:value-of select="achternaam"/></achternaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="//natuurlijkPersoon[@entiteittype='NPS']">
        <betrokkeneType>natuurlijk_persoon</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', geslachtsnaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <inpBsn><xsl:value-of select="inp.bsn"/></inpBsn>
            <geslachtsnaam><xsl:value-of select="geslachtsnaam"/></geslachtsnaam>
            <voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></voorvoegselGeslachtsnaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
            <voornamen><xsl:value-of select="voornamen"/></voornamen>
            <geslachtsaanduiding><xsl:value-of select="lower-case(geslachtsaanduiding)"/></geslachtsaanduiding>
            <geboortedatum><xsl:value-of select="zgw:toZgwDate(geboortedatum)"/></geboortedatum>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="//nietNatuurlijkPersoon[@entiteittype='NNP']">
        <betrokkeneType>niet_natuurlijk_persoon</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', statutaireNaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <innNnpId><xsl:value-of select="inn.nnpId"/></innNnpId>
            <statutaireNaam><xsl:value-of select="statutaireNaam"/></statutaireNaam>
            <innRechtsvorm><xsl:value-of select="zgw:convertZdsRechtsvormToZgwRechtsvorm(inn.rechtsvorm)"/>
            </innRechtsvorm>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="//vestiging[@entiteittype='VES']">
        <betrokkeneType>vestiging</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', handelsnaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <vestigingsNummer><xsl:value-of select="vestigingsNummer"/></vestigingsNummer>
            <handelsnaam><xsl:value-of select="handelsnaam"/></handelsnaam>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <!-- <xsl:template match="//organisatorischeeenheid">
        <betrokkeneType>organisatorische_eenheid</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(naam) > 0">
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', naam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', identificatie)"/>
                <xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <naam><xsl:value-of select="naam"/></naam>
            <isGehuisvestIn><xsl:value-of select="isGehuisvestIn"/></isGehuisvestIn>
        </betrokkeneIdentificatie>
    </xsl:template> -->

    <xsl:template match="verblijfsadres">
        <verblijfsadres>
            <aoaIdentificatie><xsl:value-of select="aoa.identificatie"/></aoaIdentificatie>
            <!-- <authentiek><xsl:value-of select="authentiek"/></authentiek> -->
            <wplWoonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></wplWoonplaatsNaam>
            <gorOpenbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></gorOpenbareRuimteNaam>
            <aoaPostcode><xsl:value-of select="aoa.postcode"/></aoaPostcode>
            <aoaHuisnummer><xsl:value-of select="aoa.huisnummer"/></aoaHuisnummer>
            <aoaHuisletter><xsl:value-of select="aoa.huisletter"/></aoaHuisletter>
            <aoaHuisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></aoaHuisnummertoevoeging>
            <inpLocatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></inpLocatiebeschrijving>
        </verblijfsadres>
    </xsl:template>

</xsl:stylesheet>