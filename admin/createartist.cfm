
<!--- create the main artist index page --->
<cfset CR=chr(10) & chr(13)>

<cffile action="READ" file="#ExpandPath('_artistTop.txt')#" variable="Top">
<cffile action="READ" file="#ExpandPath('_artistBottom.txt')#" variable="Bottom">
	<cffile action="READ" file="#ExpandPath('_artistTop.txt')#" variable="Top">
	<cffile action="READ" file="#ExpandPath('_artistBottom.txt')#" variable="Bottom">



<cfquery name="getArtists" datasource="Bayview">
	SELECT *  FROM tblArtists ORDER BY LastName
</cfquery>

<cfset Middle = "">

<!---
    <TR>
        #CR#
        <TD VALIGN=MIDDLE>
            #CR#
            <FONT FACE="Arial,Helvetica">
                #CR#
                <A HREF="artist_#getArtists.ArtistID#.html">
                    #CR#
                    <img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"  border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5 ALIGN="left">
                    #CR#
                    <B>#getArtists.Name#</B>
                    #CR#
                </A>
                #getArtists.Blurb#
            </FONT>
            #CR#
        </TD>
        #CR#
    </TR>
    <div class="columns">
        <div class="column is-two-thirds">
            <a href="artist_#getArtists.ArtistID#.html">
                <b>#getArtists.Name#</b>
                #CR#
            </a>
            #getArtists.Blurb#
        </div>
        <div class="column">
            <div class="container">
                <img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"  border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5>
            </div>
        </div>
    </div>


    <div class="columns"><div class="column is-two-thirds"><a href="artist_#getArtists.ArtistID#.html"><b>#getArtists.Name#</b>#CR#</a>#getArtists.Blurb#</div><div class="column"><div class="container"><img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"  border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5></div></div></div>
    <div class="columns"><div class="column"><div class="container"><img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"  border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5></div></div><div class="column is-two-thirds"><a href="artist_#getArtists.ArtistID#.html"><b>#getArtists.Name#</b>#CR#</a>#getArtists.Blurb#</div></div>
--->

<cfloop query="getArtists">
	<cfquery name="getRepresentative" datasource="bayView" maxrows=1>
		SELECT ArtworkID as ImageID FROM tblArtwork WHERE ArtistID = #getArtists.ArtistID#
	</cfquery>
<!---	<cfif getArtists.CurrentRow MOD 2 eq 0> 
		<cfset Middle = Middle & '<div class="columns"><div class="column is-two-thirds"><a href="artist_#getArtists.ArtistID#.html"><b>#getArtists.Name#</b>#CR#</a>#getArtists.Blurb#</div><div class="column"><div class="container has-text-centered"><img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"  border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5></div></div></div>'>
	<cfelse> --->
		<cfset Middle = Middle & '<div class="columns"><div class="column"><div class="container has-text-centered"><img src="images/Thumb_#getArtists.ArtistID#_#getRepresentative.ImageID#.jpg"   border=0 alt="#getArtists.Name#" HSPACE=5 VSPACE=5 class="gallery-picture"></div></div><div class="column is-two-thirds"><a href="artist_#getArtists.ArtistID#.html"><b>#getArtists.Name#</b>#CR#</a><br>#getArtists.Blurb#</div></div>'>
	<!--- </cfif> --->
</cfloop>


<cffile action="WRITE" file="#ExpandPath("../Artists.html")#" output="#Top# #Middle# #Bottom#" addnewline="Yes">


<!--- create each artists pages --->

<cfloop query="getArtists">
	<cffile action="READ" file="#ExpandPath('_specificTop.txt')#" variable="Top">
	<cffile action="READ" file="#ExpandPath('_specificBottom.txt')#" variable="Bottom">
	<cfset Top = Replace(Top,'|ARTIST|',#getArtists.Name#,'all')>
	<cfquery name="getArt" datasource="bayview">
		SELECT * FROM tblArtwork WHERE ArtistID = #getArtists.ArtistID# ORDER BY Name
	</cfquery>
	<cfset Middle = "<div class='columns is-multiline'>">
	<cfset ThisArtistName = getArtists.Name>
	<cfset ThisArtistID = getArtists.ArtistID>
	<cfloop query="getArt">				
	    <cfset Middle = Middle & "<div class='column is-one-third has-text-centered'><a href='Image_#ThisArtistID#_#getArt.ArtworkID#.html'><img src='images/thumb_#ThisArtistID#_#getArt.ArtworkID#.jpg'  hspace=20 border=0 alt='#getArt.Name#' align='top' class='gallery-picture'></a><br><FONT FACE='Arial,Helvetica' size=2><a href='Image_#ThisArtistID#_#getArt.ArtworkID#.html'>#getArt.Name#</a><br>#getArt.Size#<br>#getArt.Price#</font></div>">		
	</cfloop>
	<cfset Middle = Middle & "</div>">
	<cfoutput>Creating artist page for #getArtists.Name#</cfoutput><br>
	
	<cffile action="WRITE" file="#ExpandPath('../Artist_#getArtists.ArtistID#.html')#" output="#Top# #Middle# #Bottom#">
</cfloop>

<cfquery name="getArtwork" datasource="bayview">
	SELECT tblArtists.*, tblArtists.Name as ArtistName, tblArtwork.Name as ArtName, tblArtwork.* FROM tblArtwork  LEFT JOIN tblArtists ON (tblArtwork.ArtistID = tblArtists.ArtistID)
</cfquery>

<!--- create pages for the artwork itself --->

<cfloop query="getArtwork">
	<cffile action="READ" file="#ExpandPath('_artworkTop.txt')#" variable="Top">
	<cffile action="READ" file="#ExpandPath('_artworkBottom.txt')#" variable="Bottom">
	<cfset Top = Replace(Top,'|TITLE|',"#getArtwork.ArtName#",'all')>
	<cfset Middle = "<a href='artist_#getArtwork.artistID#.html'>#CR#Back to #getArtwork.ArtistName# page#CR#</a>#CR#<br /><br /><img src='images/image_#getArtwork.ArtistID#_#getArtwork.ArtworkID#.jpg' class='gallery-picture'>#CR#<br>#CR#<font face='arial,helvetica'>#getArtwork.ArtistName#<br />#getArtwork.ArtName#<br>#getArtwork.Media#<br>#getArtwork.Size#<br>#getArtwork.Price#<br><br>#getArtwork.Location#<br>#CR#">
    
	
	<cffile action="WRITE" file="#ExpandPath('../Image_#getArtwork.ArtistID#_#getArtwork.ArtworkID#.html')#" output="#Top# #Middle# #Bottom#">
	Creating artwork  page for <cfoutput>#getArtwork.ArtName#</cfoutput><br>

</cfloop>





