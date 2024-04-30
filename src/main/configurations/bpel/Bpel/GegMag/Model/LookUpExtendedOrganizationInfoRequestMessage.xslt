<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:zgw="http://google.com/zgw"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:geg="http://www.emaxx.org/functional/gegmag"
   >
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
   <xsl:include href="../../BpelFunctionsBase.xslt" />
   
   <xsl:param name="CommercialRegistryNumber" select="''" as="xs:string" />
   
   <xsl:template match="/">
      <geg:lookUpExtendedOrganizationInfo>
         <geg:organizationExtInfoSearchMessage>
            <geg:commercialRegistryNumber operator="EQUAL"><xsl:value-of select="$CommercialRegistryNumber"/></geg:commercialRegistryNumber>
         </geg:organizationExtInfoSearchMessage>
      </geg:lookUpExtendedOrganizationInfo>
   </xsl:template>
</xsl:stylesheet>