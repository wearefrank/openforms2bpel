<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cases="http://www.emaxx.org/functional/cases"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <xsl:param name="CaseIdMessage" as="node()"><cases:caseIdMessage /></xsl:param>

    <xsl:param name="Id" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <cases:readCases>
            <cases:caseIdMessage maxConfidentialityLevel="7" suppressExceptions="true">
                <cases:cases>
                    <cases:case>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('cases:id', 'skip', zgw:FromOrderedSource(
                            $Id, 
                            '', 
                            $CaseIdMessage//cases:case/cases:id, 
                            //cases:case/cases:id),
                            'http://www.emaxx.org/functional/cases')" />
                    </cases:case>
                </cases:cases>
                <cases:includes>
                    <cases:include>initiatingSubject</cases:include>
                </cases:includes>
            </cases:caseIdMessage>
        </cases:readCases>
    </xsl:template>
</xsl:stylesheet>