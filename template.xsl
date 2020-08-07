<xsl:stylesheet version="1.0"
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:template match="/">
	<HTML>
		<BODY>
			<TABLE>
				<xsl:for-each select="customers/customer">
					<TR>
						<TD><xsl:value-of select="name" /></TD>
						<TD><xsl:value-of select="address" /></TD>
						<TD><xsl:call-template name="format-phone">
							<xsl:with-param name="phone" select="phone" />
						</xsl:call-template></TD>
					</TR>
				</xsl:for-each>
			</TABLE>

			<xsl:call-template name="scripts" />
		</BODY>
	</HTML>
</xsl:template>

<xsl:template name="format-phone">
	<xsl:param name="phone" />

	<xsl:value-of select="$phone" />
</xsl:template>

<xsl:template name="scripts">
<script type="text/javascript">
	alert(true);
</script>
</xsl:template>

</xsl:stylesheet>
