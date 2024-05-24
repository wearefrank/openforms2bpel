<xsl:stylesheet exclude-result-prefixes="xs xsl xsi" version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:mode on-no-match="deep-skip" on-multiple-match="fail" />
    <xsl:strip-space elements="*"/>

    <xsl:template match="/formdata">
        <formdata>
            <xsl:variable name="injectionPass">
                <xsl:apply-templates mode="injection-pass" />
            </xsl:variable>
            <!-- <xsl:copy-of select="$injectionPass" /> -->
            <xsl:apply-templates select="$injectionPass/*" />
        </formdata>
    </xsl:template>

    <xsl:template match="/">
        <xsl:apply-templates select="/formdata" />
    </xsl:template>

    <xsl:template match="@*|node()" mode="#all" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <!-- 1st level of depth elements get their child elementen wrapped in <form> a element. -->
    <xsl:template match="*[count(ancestor::*) = 1]" mode="injection-pass" priority="-1">
        <xsl:element name="{name(current())}" namespace="{namespace-uri(current())}">
            <form>
                <xsl:apply-templates mode="#current" />
            </form>
        </xsl:element>
    </xsl:template>

    <!-- Exclude 'extraVars' from <form> injection. -->
    <xsl:template match="extraVars" mode="injection-pass">
        <xsl:element name="{name(current())}" namespace="{namespace-uri(current())}">
            <xsl:apply-templates mode="#current" />
        </xsl:element>
    </xsl:template>

    <!-- Transform element names containing '-' to camelCase. -->
    <xsl:template match="*[contains(name(), '-')]">
        <xsl:variable name="pascalCase" select="string-join(tokenize(name(current()), '-') ! (upper-case(substring(., 1, 1)) || substring(., 2)))" />

        <xsl:element name="{lower-case(substring($pascalCase, 1, 1)) || substring($pascalCase, 2)}" namespace="{namespace-uri(current())}">
            <xsl:apply-templates mode="#current" />
        </xsl:element>
        <xsl:element name="{name(current())}" namespace="{namespace-uri(current())}">
            <xsl:apply-templates mode="#current" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>