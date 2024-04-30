<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:zgw="http://google.com/zgw"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:geg="http://www.emaxx.org/functional/gegmag"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <xsl:param name="Bsn" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <geg:lookUpPerson>
            <geg:personSearchMessage source="internal" details="supplementary" search="all" return="supplementary">
                <geg:bsn operator="EQUAL"><xsl:value-of select="$Bsn"/></geg:bsn>
                <geg:context>
                    <geg:name>7.0 migratieset</geg:name>
                    <geg:field>
                        <geg:code>01.01.20</geg:code>
                        <geg:name>Burgerservicenummer persoon</geg:name>
                        <geg:contextSelector>gegmag:bsn gegmag:citizenNumber gegmag:citizenNumberSupplement gegmag:emailAddress gegmag:phoneNumber gegmag:faxNumber gegmag:bankNumber gegmag:telephoneNumberHome gegmag:telephoneNumberWork gegmag:telephoneNumberMobile gegmag:prefComChannel gegmag:type gegmag:inExaminationList.gegmag:startDate gegmag:inExaminationList.gegmag:endDate gegmag:inExaminationList.gegmag:code gegmag:inExaminationList.gegmag:name</geg:contextSelector>
                    </geg:field>
                </geg:context>
            </geg:personSearchMessage>
        </geg:lookUpPerson>
    </xsl:template>
</xsl:stylesheet>