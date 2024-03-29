<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:str="http://xsltsl.sourceforge.net/string.html"
	xmlns:xalan="http://xml.apache.org/xalan"
	>

	<xsl:import href="../../../../xsltsl-1.1/stdlib.xsl"/>
	<xsl:import href="../inc_pagedimensions.xslt"/>


	<!--
====================================
====================================
	TEMPLATE - VIEW SKILLS NUMBER

	Returns the number of skills that can
	be shown on the front page
====================================
====================================-->
	<xsl:template name="view.skills.num">
		<xsl:variable name="featureheight">
			<xsl:call-template name="features.right">
				<xsl:with-param name="features" select="/character/class_features/*"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="floor( (200-$featureheight) div 3.6) - 2"/>
	</xsl:template>


<!-- Begin Skills -->
	<xsl:template name="skills.empty">
		<xsl:param name="pos"/>

		<xsl:variable name="shade">
			<xsl:choose>
				<xsl:when test="$pos mod 2 = 0">darkline</xsl:when>
				<xsl:otherwise>lightline</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:table-row height="9pt">
											<xsl:message>Test</xsl:message>
			<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('skills.', $shade)"/></xsl:call-template>
			<fo:table-cell/>
			<fo:table-cell/>
			<fo:table-cell number-columns-spanned="2"/>
			<fo:table-cell/>
			<fo:table-cell number-columns-spanned="2"/>
			<fo:table-cell>
				<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('skills.', $shade, '.total')"/></xsl:call-template>
			</fo:table-cell>
			<fo:table-cell number-columns-spanned="2">
				<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">=</fo:block>
			</fo:table-cell>
			<fo:table-cell/>
			<fo:table-cell number-columns-spanned="2">
				<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">+</fo:block>
			</fo:table-cell>
			<fo:table-cell/>
			<fo:table-cell number-columns-spanned="2">
				<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">+</fo:block>
			</fo:table-cell>
			<fo:table-cell/>
		</fo:table-row>
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - SKILLS TABLE
====================================
====================================-->
	<xsl:template match="skills">
		
		<xsl:param name="first_skill" select="0"/>
		<xsl:param name="last_skill" select="0"/>
		<xsl:param name="column_width" select="0.55 * $pagePrintableWidth"/>
		<!-- begin skills table -->
		
			<xsl:variable name="columns">
				<fo:table-column column-width="4mm"/>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:value-of select="$column_width - 42" />mm</xsl:attribute>
				</fo:table-column>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="6mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="6mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="5mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="5mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="6mm"/>	
			</xsl:variable>

			<fo:table table-layout="fixed" border-collapse="collapse" padding="0.5pt">
				<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'skills.border'"/></xsl:call-template>
				<xsl:copy-of select="$columns"/>
				<fo:table-body>
					<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
						<fo:table-cell/>
					</fo:table-row>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'skills.header'"/></xsl:call-template>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell number-columns-spanned="8">
							<fo:block text-align="end" line-height="10pt" font-weight="bold" font-size="10pt">SKILLS</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'skills.header'"/></xsl:call-template>
						<fo:table-cell></fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block font-weight="bold" font-size="8pt">
								SKILL NAME
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-size="3pt">
								KEY ABILITY
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block text-align="center" font-size="3pt">
								SKILL MODIFIER
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block text-align="center" font-size="3pt">
								ABILITY MODIFIER
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block text-align="center" font-size="3pt">
								PROF MODIFIER
							</fo:block>
						</fo:table-cell>	
						<fo:table-cell number-columns-spanned="2">
							<fo:block text-align="center" font-size="3pt">
								MISC MODIFIER
							</fo:block>
						</fo:table-cell>	
					</fo:table-row>
				</fo:table-body>
			</fo:table>

			<fo:table table-layout="fixed" border-collapse="collapse" padding="0.5pt">
				<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'skills.border'"/></xsl:call-template>
				<xsl:copy-of select="$columns"/>
				<fo:table-body>
					<xsl:for-each select="skill">
						<xsl:if test="position() &gt;= $first_skill and position() &lt;= $last_skill">
							<xsl:variable name="shade">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 0">darkline</xsl:when>
									<xsl:otherwise>lightline</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<fo:table-row>
											<xsl:message>Test</xsl:message>
								<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('skills.', $shade)"/></xsl:call-template>
								<fo:table-cell>
									<fo:block font-size="6pt" font-family="ZapfDingbats">
										<xsl:if test="ranks >0">
											&#x2713;
										</xsl:if>	
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<xsl:choose>
									<!-->	<xsl:when test="string-length(name) &lt; 40">-->
										<xsl:when test="not(contains(type, 'SkillUse')) and string-length(name) &lt; 40">
											<fo:block space-before.optimum="1pt" font-size="7pt">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:when>
										<xsl:when test="contains(type, 'SkillUse') and string-length(name) &lt; 40">
											<fo:block space-before.optimum="1pt" font-size="7pt" font-style="italic">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:when>
										<xsl:when test="not(contains(type, 'SkillUse')) and string-length(name) &lt; 45">
											<fo:block space-before.optimum="1pt" font-size="6pt">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:when>
										<xsl:when test="contains(type, 'SkillUse') and string-length(name) &lt; 45">
											<fo:block space-before.optimum="1pt" font-size="6pt" font-style="italic">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:when>
										<xsl:when test="contains(type, 'SkillUse') and string-length(name) &gt; 44">
											<fo:block space-before.optimum="1pt" font-size="4pt" font-style="italic">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block space-before.optimum="1pt" font-size="4pt">
												<xsl:value-of select="name"/>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2"/>
								<fo:table-cell>
									<fo:block space-before.optimum="1pt" font-size="8pt">
										<xsl:value-of select="ability"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2"/>
								<fo:table-cell>
									<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('skills.', $shade, '.total')"/></xsl:call-template>
									<fo:block text-align="center" space-before.optimum="1pt" font-size="8pt">
										<xsl:choose>
											<xsl:when test="contains($skillmastery,name)">
												<xsl:value-of select="concat(skill_mod,'*')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="skill_mod"/>
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">=</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" space-before.optimum="1pt" font-size="8pt">
										<xsl:value-of select="ability_mod"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">
										<xsl:if test="ranks &gt; 0">+</xsl:if>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" space-before.optimum="1pt" font-size="8pt">
										<xsl:if test="ranks>0">
											<xsl:value-of select="ranks"/>
										</xsl:if>
									</fo:block>
								</fo:table-cell>	
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" space-before.optimum="3pt" line-height="6pt" font-size="6pt">
										<xsl:if test="misc_mod!=0">+</xsl:if>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" space-before.optimum="1pt" font-size="8pt">
										<xsl:if test="misc_mod!=0">
											<xsl:value-of select="misc_mod"/>
										</xsl:if>
									</fo:block>
								</fo:table-cell>	
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<fo:table-cell number-columns-spanned="17" padding-top="1pt">
							<fo:block text-align="center" font-size="6pt">
								<fo:inline font-family="ZapfDingbats">&#x2713;</fo:inline>: Proficient Skill.
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		
		<!-- END Skills table-->
	</xsl:template>

<!-- This is a Separate Skill Info
====================================
====================================
	TEMPLATE - Skills Info TABLE
====================================
====================================-->
	<xsl:template match="skillinfo">
		<!-- BEGIN Skills table -->
		<xsl:if test="count(conditional_modifiers/skillbonus) &gt; 0">
<!-->	Attempting to get shading to work. So far, nothing.
		<xsl:variable name="shade">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 0">darkline</xsl:when>
				<xsl:otherwise>lightline</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('skills.', $shade)"/></xsl:call-template>
-->
		<fo:table table-layout="fixed" space-before="2mm" padding="0.5pt">
			<fo:table-column column-width="86mm"/>
			<fo:table-column column-width="10mm"/>
			<fo:table-column column-width="30mm"/>
				<fo:table-body>
					<fo:table-row>
											<xsl:message>Test END</xsl:message>
						<fo:table-cell padding-top="1pt" border-width="0.5pt" border-style="solid">
							<fo:block text-align="center" font-size="8pt" font-weight="bold">Conditional Skill Modifiers:</fo:block>
								<xsl:for-each select="conditional_modifiers/skillbonus">
									<fo:block font-size="8pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
								</xsl:for-each>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
		</fo:table>
		</xsl:if>
		<!-- END Skills table -->
	</xsl:template>


</xsl:stylesheet>