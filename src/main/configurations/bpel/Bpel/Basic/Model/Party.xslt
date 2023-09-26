<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="Party" as="node()"><basic:party /></xsl:param>
    
    <xsl:param name="RoleCode" select="''" as="xs:string" />
    <xsl:param name="Bsn" select="''" as="xs:string" />

    <xsl:template match="/">
        <basic:party>
            <xsl:copy-of select="zgw:WrapNullOrSkip('basic:roleCode', 'skip', zgw:FromOrderedSource(
                $RoleCode, 
                $Party//basic:roleCode, 
                '', 
                //basic:roleCode),
                'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
            <basic:subject>
                <basic:person>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('basic:bsn', 'skip', zgw:FromOrderedSource(
                        $Bsn, 
                        $Party//basic:bsn, 
                        '', 
                        //basic:bsn),
                        'http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic')"/>
                </basic:person>
            </basic:subject>
        </basic:party>
    </xsl:template>
</xsl:stylesheet>