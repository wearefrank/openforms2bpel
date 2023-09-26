<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:zgw="http://google.com/zgw"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:basic="http://www.emaxx.org/bpel/proces/xsd/eMAXX/Basic"
    xmlns:headerproperties="http://www.emaxx.org/bpel/proces/xsd/headerproperties"
    xmlns:faultproperties="http://www.emaxx.org/bpel/proces/xsd/faultproperties"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../BpelFunctionsBase.xslt" />
    
    <!-- Map -->
    
    <!-- Create/Enrich -->
    <xsl:param name="Error" as="node()"><basic:error /></xsl:param>
    
    <xsl:param name="CorrelationId" select="''" as="xs:string" />
    <xsl:param name="ProcessId" select="''" as="xs:string" />
    <xsl:param name="Source" select="''" as="xs:string" />
    <xsl:param name="Code" select="''" as="xs:string" />
    <xsl:param name="Message" select="''" as="xs:string" />
    <xsl:param name="Stacktrace" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <SOAP-ENV:Fault>
            <faultcode>SOAP-ENV:Server</faultcode>
            <xsl:copy-of select="zgw:WrapNullOrSkip('faultstring', 'empty', zgw:FromOrderedSource(
                $Message, 
                $Error//faultproperties:message, 
                '', 
                //faultproperties:message))"/>
            <detail>
                <basic:error>
                    <headerproperties:responseProperties>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:correlationId', 'null', zgw:FromOrderedSource(
                            $CorrelationId, 
                            $Error//headerproperties:correlationId, 
                            '', 
                            //headerproperties:correlationId),
                            'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                        <xsl:copy-of select="zgw:WrapNullOrSkip('headerproperties:processId', 'null', zgw:FromOrderedSource(
                            $ProcessId, 
                            $Error//headerproperties:processId, 
                            '', 
                            //headerproperties:processId),
                            'http://www.emaxx.org/bpel/proces/xsd/headerproperties')"/>
                    </headerproperties:responseProperties>
                    <basic:body>
                        <faultproperties:faultDetails>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('faultproperties:source', 'null', zgw:FromOrderedSource(
                                $Source, 
                                $Error//faultproperties:source, 
                                '', 
                                //faultproperties:source),
                                'http://www.emaxx.org/bpel/proces/xsd/faultproperties')"/>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('faultproperties:code', 'null', zgw:FromOrderedSource(
                                $Code, 
                                $Error//faultproperties:code, 
                                '', 
                                //faultproperties:code),
                                'http://www.emaxx.org/bpel/proces/xsd/faultproperties')"/>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('faultproperties:message', 'null', zgw:FromOrderedSource(
                                $Message, 
                                $Error//faultproperties:message, 
                                '', 
                                //faultproperties:message),
                                'http://www.emaxx.org/bpel/proces/xsd/faultproperties')"/>
                            <xsl:copy-of select="zgw:WrapNullOrSkip('faultproperties:stacktrace', 'null', zgw:FromOrderedSource(
                                $Stacktrace, 
                                $Error//faultproperties:stacktrace, 
                                '', 
                                //faultproperties:stacktrace),
                                'http://www.emaxx.org/bpel/proces/xsd/faultproperties')"/>
                        </faultproperties:faultDetails>
                        
                    </basic:body>
                </basic:error>
            </detail>
        </SOAP-ENV:Fault>
        
    </xsl:template>
</xsl:stylesheet>