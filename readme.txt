KML Widget 
Version 1.0
Luke Berndt – luke.berndt@dhs.gov
-------------------------------------------------------------------------------------------------

This widget allows for KML files to be loaded and in viewed in the ESRI Sample Flex Viewer. It is capable of rendering KML & KMZ files from a provided URL. It is based on the GeoRSS feed, so it is configured the same way. In the config.xml file for the Flex Viewer, you describe the particular feed and point to an XML file that provides the properties for the feed. The widget allows for you to selectively turn on and off a given feature by clicking on the checkbox next to all of the features.  To zoom in and focus on a feature, simply click on it in the tree. This only works on Placemarks. Click on a shape drawn on the map we give a pop-up box with more information. Sometimes it can pop-up offscreen if you are zoomed in a lot and the center for the shape is offscreen. 


Instructions:
-------------------------------------------------------------------------------------------------
1. Copy and paste KMLWidget.mxml and the zip & kmlparser folders into the src\com\esri\solutions\flexviewer\widgets\ folder.

2. Open your Project - Properties, goto Flex Modules and add this from src\com\esri\solutions\flexviewer\widgets\KMLWidget.mxml.

3. Update your config.xml file to include a KML feed. They are designed the same way GeoRSS feeds are, except that they take in KML files.

5. Cross fingers.

4. Recompile.

-------------------------------------------------------------------------------------------------

KMLWidget.mxml   File
KMLWidget.xml    File     ----->    src/com/esri/solutions/flexviewer/widgets   Folder
zip              Folder
kmlparser        Folder

-------------------------------------------------------------------------------------------------

Example line for config .xml:
<widget label="KML Oil Spill" icon="com/esri/solutions/flexviewer/assets/images/icons/i_flag.png" menu="menuFeeds" config="com/esri/solutions/esa/feeds/OilSpill.xml">com/esri/solutions/flexviewer/widgets/KMLWidget.swf</widget>

Example XML for the KML file:
(com/esri/solutions/esa/feeds/OilSpill.xml)
<?xml version="1.0" ?> 
<configuration>
<source>http://localhost/oil_spill.kml</source> 
<query /> 
<fields>description</fields> 
<titlefield>title</titlefield> 
<linkfield>link</linkfield> 
<refreshrate>300</refreshrate> 
<zoomscale>150000</zoomscale> 
</configuration>


Supported:
-------------------------------------------------------------------------------------------------
Currently the widget supports many of the features describe in the KML 2.2 specifications.

Placemark – Can handle many different geometries; Point, Polygon (both innerboundary & outerboundary), Linestring, Multigeometry

Folder & Document – Provides a way to group different placemarks together. The widget allows you to turn on and off all of the features in a folder or document.

Style – The widget supports styling features. LineStyle, ColorStyle and IconStyle are supported, allowing for line color, line weight, and fill color to be specified. Additional custom icons can be used for Placemarks. Currently only icons available on the web are supported, not ones embedded in KMZ files.

NetworkLink – This allows for a portion of a KML file to be pulled dynamically from the web


Things that are not supported:
-------------------------------------------------------------------------------------------------
Overlays – I could not figure out how to do a geolocated, scaled image using the Graphics component in the Flex Viewer. If anyone has any ideas I will try to add this in. It is possible to have image layers if they come from an ESRI server, I am just not sure if it is possible to dynamically add this.


Troubleshooting:
-------------------------------------------------------------------------------------------------
 - Check the proxy. Check it again. Flex/Flash is really a pain when it comes to loading things from the website other than the one the flash file was loaded from. To get around this, you need to use a proxy on the same site that will go out and get those files. The one that comes with the Flex Viewer will only download files from sites that have been specified in advance. If you are pulling down KML or Icons from a remote site, you will have to add the URL paths for those files. The icons are often stored in a separate spot, so make sure  you include them.
 - I have that the Flex Viewer can sometimes get cached in the browser, so you sometimes need to clear the browser cache in order to get the most recent version. The same thing sometimes happens when you make changes to the config.xml file or the xml files for the feeds.


This widget was built using code from:
-------------------------------------------------------------------------------------------------
 - GeoRSS widget in the Sample Flex Viewer
 - Google Maps API for Flash Utility Library: http://code.google.com/p/gmaps-utility-library-flash/ They have an initial KML parser built using flex.
 - AS3 Zip Library: http://nochump.com/blog/archives/15 This is used to uncompress the KMZ files into KML files. I had to make some small changes so it would take in buffers instead of files. There was also a bug if a small file got sent in.




