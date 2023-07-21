<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.4.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="uguz_cEGG">
<packages>
<package name="MODULE_4X8">
<pad name="P$1" x="-28.21" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$2" x="-28.21" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$3" x="-25.67" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$4" x="-25.67" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$5" x="-23.17" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$6" x="-23.17" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$7" x="-20.63" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$8" x="-20.63" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$9" x="20.55" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$10" x="20.55" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$11" x="23.09" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$12" x="23.09" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$13" x="25.63" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$14" x="25.63" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$15" x="28.17" y="-13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$16" x="28.17" y="-10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$17" x="-28.25" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$18" x="-28.25" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$19" x="-25.71" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$20" x="-25.71" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$21" x="-23.17" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$22" x="-23.17" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$23" x="-20.63" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$24" x="-20.63" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$25" x="20.55" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$26" x="20.55" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$27" x="23.09" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$28" x="23.09" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$29" x="25.63" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$30" x="25.63" y="13.17" drill="0.5" diameter="1.6764"/>
<pad name="P$31" x="28.17" y="10.63" drill="0.5" diameter="1.6764"/>
<pad name="P$32" x="28.17" y="13.17" drill="0.5" diameter="1.6764"/>
<wire x1="-32" y1="17" x2="-32" y2="-17" width="0.127" layer="51"/>
<wire x1="-32" y1="-17" x2="32" y2="-17" width="0.127" layer="51"/>
<wire x1="32" y1="-17" x2="32" y2="17" width="0.127" layer="51"/>
<wire x1="32" y1="17" x2="-32" y2="17" width="0.127" layer="51"/>
<text x="-23" y="5" size="1.27" layer="51">&gt;VALUE</text>
<text x="-23" y="2" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MODULE_4X8">
<pin name="VDD@1" x="-20.32" y="25.4" length="middle"/>
<pin name="VDD@2" x="-20.32" y="22.86" length="middle"/>
<pin name="VDD@3" x="-20.32" y="20.32" length="middle"/>
<pin name="VDD@4" x="-20.32" y="17.78" length="middle"/>
<pin name="GND@1" x="-20.32" y="12.7" length="middle"/>
<pin name="GND@2" x="-20.32" y="10.16" length="middle"/>
<pin name="GND@3" x="-20.32" y="7.62" length="middle"/>
<pin name="GND@4" x="-20.32" y="5.08" length="middle"/>
<pin name="VSS@1" x="20.32" y="25.4" length="middle" rot="R180"/>
<pin name="VSS@2" x="20.32" y="22.86" length="middle" rot="R180"/>
<pin name="VSS@3" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="VSS@4" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="GND@5" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="GND@6" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="GND@7" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="GND@8" x="20.32" y="5.08" length="middle" rot="R180"/>
<wire x1="-15.24" y1="27.94" x2="-15.24" y2="2.54" width="0.254" layer="94"/>
<wire x1="-15.24" y1="2.54" x2="15.24" y2="2.54" width="0.254" layer="94"/>
<wire x1="15.24" y1="2.54" x2="15.24" y2="27.94" width="0.254" layer="94"/>
<wire x1="15.24" y1="27.94" x2="12.7" y2="27.94" width="0.254" layer="94"/>
<wire x1="12.7" y1="27.94" x2="-15.24" y2="27.94" width="0.254" layer="94"/>
<text x="7.62" y="33.02" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="POWER_DUAL_12">
<gates>
<gate name="G$1" symbol="MODULE_4X8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MODULE_4X8">
<connects>
<connect gate="G$1" pin="GND@1" pad="P$5"/>
<connect gate="G$1" pin="GND@2" pad="P$6"/>
<connect gate="G$1" pin="GND@3" pad="P$7"/>
<connect gate="G$1" pin="GND@4" pad="P$8"/>
<connect gate="G$1" pin="GND@5" pad="P$13"/>
<connect gate="G$1" pin="GND@6" pad="P$14"/>
<connect gate="G$1" pin="GND@7" pad="P$15"/>
<connect gate="G$1" pin="GND@8" pad="P$16"/>
<connect gate="G$1" pin="VDD@1" pad="P$1"/>
<connect gate="G$1" pin="VDD@2" pad="P$2"/>
<connect gate="G$1" pin="VDD@3" pad="P$3"/>
<connect gate="G$1" pin="VDD@4" pad="P$4"/>
<connect gate="G$1" pin="VSS@1" pad="P$9"/>
<connect gate="G$1" pin="VSS@2" pad="P$10"/>
<connect gate="G$1" pin="VSS@3" pad="P$11"/>
<connect gate="G$1" pin="VSS@4" pad="P$12"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X04" urn="urn:adsk.eagle:footprint:22258/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90" urn="urn:adsk.eagle:footprint:22259/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1X04" urn="urn:adsk.eagle:package:22407/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04"/>
</packageinstances>
</package3d>
<package3d name="1X04/90" urn="urn:adsk.eagle:package:22404/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD4" urn="urn:adsk.eagle:symbol:22257/1" library_version="3">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X4" urn="urn:adsk.eagle:component:22499/4" prefix="JP" uservalue="yes" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22407/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22404/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2" urn="urn:adsk.eagle:library:372">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26990/1" library_version="2">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:27037/1" prefix="SUPPLY" library_version="2">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-coax" urn="urn:adsk.eagle:library:133">
<description>&lt;b&gt;Coax Connectors&lt;/b&gt;&lt;p&gt;
Radiall  and M/A COM.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="AMP_227161" urn="urn:adsk.eagle:footprint:6184/1" library_version="1">
<description>&lt;b&gt;JACK,  RIGHT ANGLE, 50 OHM, PCB, BNC&lt;/b&gt;&lt;p&gt;
Source: amp_227161.pdf</description>
<wire x1="-7.275" y1="-6.875" x2="7.275" y2="-6.875" width="0.2032" layer="21"/>
<wire x1="7.275" y1="-6.875" x2="7.275" y2="7.275" width="0.2032" layer="21"/>
<wire x1="7.275" y1="7.275" x2="-7.275" y2="7.275" width="0.2032" layer="21"/>
<wire x1="-7.275" y1="7.275" x2="-7.275" y2="-6.875" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="7.375" x2="-6.4" y2="16.025" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="16.025" x2="6.4" y2="16.025" width="0.2032" layer="21"/>
<wire x1="6.4" y1="16.025" x2="6.4" y2="7.35" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="16.15" x2="-4.9" y2="28.475" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="28.475" x2="4.9" y2="28.475" width="0.2032" layer="21"/>
<wire x1="4.9" y1="28.475" x2="4.9" y2="16.125" width="0.2032" layer="21"/>
<circle x="0" y="23.94" radius="1.26" width="0" layer="21"/>
<pad name="1" x="0" y="-5.08" drill="0.9" diameter="1.27"/>
<pad name="2" x="-2.54" y="-5.08" drill="0.9" diameter="1.27"/>
<text x="-6.985" y="-8.89" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-8.89" size="1.27" layer="27">&gt;VALUE</text>
<hole x="-5.08" y="0" drill="2"/>
<hole x="5.08" y="0" drill="2"/>
</package>
</packages>
<packages3d>
<package3d name="AMP_227161" urn="urn:adsk.eagle:package:6212/1" type="box" library_version="1">
<description>JACK,  RIGHT ANGLE, 50 OHM, PCB, BNC
Source: amp_227161.pdf</description>
<packageinstances>
<packageinstance name="AMP_227161"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="BU-BNC" urn="urn:adsk.eagle:symbol:6169/1" library_version="1">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="0" y1="-2.54" x2="-0.762" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.254" x2="-0.762" y2="0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="0.254" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.762" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="-0.254" x2="-2.54" y2="-0.254" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="?227161*" urn="urn:adsk.eagle:component:6239/1" prefix="X" library_version="1">
<description>&lt;b&gt;JACK,  RIGHT ANGLE, 50 OHM, PCB, BNC&lt;/b&gt;&lt;p&gt;
Source: amp_227161.pdf</description>
<gates>
<gate name="G$1" symbol="BU-BNC" x="0" y="0"/>
</gates>
<devices>
<device name="1-" package="AMP_227161">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6212/1"/>
</package3dinstances>
<technologies>
<technology name="-0">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="1-227161" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="33B3200" constant="no"/>
</technology>
<technology name="-2">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-6">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="1-227161-6" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="09H7854" constant="no"/>
</technology>
<technology name="-7">
<attribute name="MF" value="TYCO ELECTRONICS" constant="no"/>
<attribute name="MPN" value="1-227161-7" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="09H7855" constant="no"/>
</technology>
</technologies>
</device>
<device name="" package="AMP_227161">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6212/1"/>
</package3dinstances>
<technologies>
<technology name="-8">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="uguz_cEGG" deviceset="POWER_DUAL_12" device=""/>
<part name="JP2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
<part name="X2" library="con-coax" library_urn="urn:adsk.eagle:library:133" deviceset="?227161*" device="1-" package3d_urn="urn:adsk.eagle:package:6212/1" technology="-2"/>
<part name="SUPPLY11" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="X1" library="con-coax" library_urn="urn:adsk.eagle:library:133" deviceset="?227161*" device="1-" package3d_urn="urn:adsk.eagle:package:6212/1" technology="-2"/>
<part name="SUPPLY1" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="40.64" y="50.8" smashed="yes">
<attribute name="VALUE" x="48.26" y="83.82" size="1.27" layer="96"/>
</instance>
<instance part="JP2" gate="A" x="25.4" y="20.32" smashed="yes">
<attribute name="NAME" x="19.05" y="28.575" size="1.778" layer="95"/>
<attribute name="VALUE" x="19.05" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="X2" gate="G$1" x="-22.86" y="27.94" smashed="yes">
<attribute name="VALUE" x="-25.4" y="22.86" size="1.778" layer="96"/>
<attribute name="NAME" x="-25.4" y="31.242" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY11" gate="GND" x="-15.24" y="17.78" smashed="yes">
<attribute name="VALUE" x="-17.145" y="14.605" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="G$1" x="-20.32" y="53.34" smashed="yes">
<attribute name="VALUE" x="-22.86" y="48.26" size="1.778" layer="96"/>
<attribute name="NAME" x="-22.86" y="56.642" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY1" gate="GND" x="-12.7" y="43.18" smashed="yes">
<attribute name="VALUE" x="-14.605" y="40.005" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="VDD" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VDD@1"/>
<wire x1="20.32" y1="76.2" x2="12.7" y2="76.2" width="0.1524" layer="91"/>
<label x="12.7" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="22.86" y1="22.86" x2="10.16" y2="22.86" width="0.1524" layer="91"/>
<label x="5.08" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="VSS" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VSS@1"/>
<wire x1="71.12" y1="76.2" x2="60.96" y2="76.2" width="0.1524" layer="91"/>
<label x="66.04" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="22.86" y1="25.4" x2="10.16" y2="25.4" width="0.1524" layer="91"/>
<label x="7.62" y="27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GND@3"/>
<wire x1="20.32" y1="58.42" x2="12.7" y2="58.42" width="0.1524" layer="91"/>
<label x="12.7" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X2" gate="G$1" pin="2"/>
<wire x1="-20.32" y1="25.4" x2="-15.24" y2="25.4" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="25.4" x2="-15.24" y2="20.32" width="0.1524" layer="91"/>
<pinref part="SUPPLY11" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="22.86" y1="17.78" x2="10.16" y2="17.78" width="0.1524" layer="91"/>
<label x="2.54" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<wire x1="-17.78" y1="50.8" x2="-12.7" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="50.8" x2="-12.7" y2="45.72" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
</segment>
</net>
<net name="SIGNAL" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="22.86" y1="20.32" x2="10.16" y2="20.32" width="0.1524" layer="91"/>
<label x="2.54" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X2" gate="G$1" pin="1"/>
<wire x1="-20.32" y1="27.94" x2="-12.7" y2="27.94" width="0.1524" layer="91"/>
<label x="-15.24" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="-17.78" y1="53.34" x2="-10.16" y2="53.34" width="0.1524" layer="91"/>
<label x="-12.7" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
