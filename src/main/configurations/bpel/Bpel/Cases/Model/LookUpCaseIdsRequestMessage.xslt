<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <xsl:param name="CaseSearchMessage" as="node()"><cases:caseSearchMessage /></xsl:param>

    <xsl:param name="ReferenceNumber" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <cases:lookUpCaseIds>
            <cases:caseSearchMessage matchLastStatus="false" maxConfidentialityLevel="7" returnFileData="false" noArchiveSettings="false" returnCasesWithRelations="false">
                <cases:referenceNumber operator="EQUAL">
                    <xsl:copy-of select="zgw:FromOrderedSource(
                        $ReferenceNumber, 
                        $CaseSearchMessage//cases:referenceNumber, 
                        '', 
                        //cases:referenceNumber)"/>
                </cases:referenceNumber>
            </cases:caseSearchMessage>
        </cases:lookUpCaseIds>
    </xsl:template>
</xsl:stylesheet>