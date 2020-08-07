# Сервис для XSLT преобразований
Дан XML документ(./xml/in.xml), с помощью XSLT преобразований, вывести данные в HTML в виде таблицы:
![](https://github.com/tolic811/test-case/raw/master/img/tbl.png)

Формат цены сохранить из примера выше. Рубли и копейки должны склоняться.

После нажатия кнопки «Оплатить», появляется форма:
![](https://github.com/tolic811/test-case/raw/master/img/frm.png)

Необходимо реализовать проверку обязательного заполнения всех полей, если в поле пустое значение, выделить его.
В полях «Номер карты» и «Срок», предусмотреть маски ввода:
- Номер карты – 9999 9999 9999 9999
- Срок – 99 / 99
- Длинна поля CVV – 3 символа

![](https://github.com/tolic811/test-case/raw/master/img/frm-err.png)

Любой язык программирования или XSLT компилятор, в решении должен присутствовать один XSLT шаблон, в котором должно находиться решение тестового задания.

## Пример
Пример документов, представленных ниже, находятся в папке ./sample.

Входной XML:
```xml
<?xml version="1.0"?>
<customers>
   <customer>
      <name>John Smith</name>
      <address>123 Oak St.</address>
      <state>WA</state>
      <phone>(206) 123-4567</phone>
   </customer>
   <customer>
      <name>Zack Zwyker</name>
      <address>368 Elm St.</address>
      <state>WA</state>
      <phone>(206) 423-4537</phone>
   </customer>
</customers>
```

XSLT шаблон:
```xml
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

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
```
Скомпилированный файл
```html
<HTML>
<BODY>
  <TABLE>
    <TR>
      <TD>John Smith</TD>
      <TD>123 Oak St.</TD>
      <TD>(206) 123-4567</TD>
    </TR>
    <TR>
      <TD>Zack Zwyker</TD>
      <TD>368 Elm St.</TD>
      <TD>(206) 423-4537</TD>
    </TR>
  </TABLE>
  <script type="text/javascript">alert(true);</script>
</BODY>
</HTML>
```
