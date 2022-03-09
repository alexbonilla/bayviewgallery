<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Bayview Gallery offers paintings by New England's finest and most renowned artists. The artists we represent span the spectrum from contemporary American impressionists to contemporary American realists. We also display sculpture and offer original and limited-edition prints by important New England artists.">
	<meta name="title" content="Bayview Gallery">
    <meta name="author" content="Alex Bonilla">
	<meta name="keywords" content="Art of Maine, Artists, Frameshops, Art Gallery, Maine, elegant art, paintings, prints, sculptures, New England Artists, restoration, art collections, hanging prints, John Atwater, Stapleton Kearns, David Little, Scott Moore, Donald Allen Mosher, Stefan Pastuhov, Don Stone">
	<meta name="rating" content="Safe for kids">
    
    <link rel="stylesheet" href="css/styles.css">
    <title>Bayview Gallery</title>

    <!-- Mobile Sniffer -->	
    <!--	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="detectmobilebrowser.js"></script>
    <script type="text/javascript">
        if (jQuery.browser.mobile)
    {
        window.location.href = 'http://www.bayviewgallery.com/index_mobi.html';
    }
    </script> 
    -->
    <!-- !Mobile -->	
        
    <!--    GA		-->
    <script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-31832560-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

    </script>
    <!--    !GA		-->
    <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
    ga('create', 'UA-50316206-1', 'bayviewgallery.com');
    ga('send', 'pageview');
    
    </script>
    <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
    ga('create', 'UA-50316206-1', 'bayviewgallery.com');
    ga('send', 'pageview');
    
    </script>
</head>

<body>
<cfparam name="eID" default="1">
<cfparam name="eStat" default="c">
<cfif NOT isNumeric(#eID#)><cfset eID = 0></cfif>
<cfif NOT eStat IS "c" AND NOT eStat IS "f" AND NOT eStat IS "p"><cfset eStat = "c"></cfif>

<cfif isDefined("URL.eID")>
	<!-- If a particular exhibit is being requested, retrieve it -->
	<!-- Note: This is basically the original query -->
	<cfquery name="ExhibitionPic" datasource="bayview" dbtype="ODBC">
		SELECT * 
		FROM tblExhibit t1 LEFT OUTER JOIN tblExhibitionPic t2 ON t1.exhibitID = t2.exhibitID LEFT OUTER JOIN tblexhibitionText t3 ON t2.exhibitID = t3.exhibitID AND 
		t3.ExTextID =  (SELECT     MAX(exTextID)
		FROM          tblexhibitionText
		WHERE      exhibitID = t2.exhibitID) 
		WHERE t1.exhibitID = <cfqueryparam value="#eID#" cfsqltype="cf_sql_integer" maxlength="5">
		ORDER BY Lname ASC
	</cfquery>
<cfelse>
	<cfswitch expression="#eStat#">
		<cfcase value="c">
			<!-- If the current exhibit is being requrested retrieve it -->
			<!-- Note: This is basically the original query -->
			<cfquery name="ExhibitionPic" datasource="bayview" dbtype="ODBC">
				SELECT * 
				FROM tblExhibit t1 LEFT OUTER JOIN tblExhibitionPic t2 ON t1.exhibitID = t2.exhibitID
					LEFT OUTER JOIN tblexhibitionText t3 ON t2.exhibitID = t3.exhibitID AND 
					t3.ExTextID =  (SELECT     MAX(exTextID)
			                            FROM          tblexhibitionText
			                            WHERE      exhibitID = t2.exhibitID) 
				WHERE exhibitStatus = 'Current'
				ORDER BY Lname ASC
			</cfquery>
		</cfcase>
		<cfcase value="p">
			<cfquery name="ExhibitionPic" datasource="bayview" dbtype="ODBC">
				SELECT * FROM tblExhibit WHERE exhibitStatus = 'Past'
			</cfquery>
		</cfcase>
		<cfcase value="f">
			<cfquery name="ExhibitionPic" datasource="bayview" dbtype="ODBC">
				SELECT * FROM tblExhibit WHERE exhibitStatus = 'Upcoming'
			</cfquery>
		</cfcase>
	</cfswitch>
</cfif>

<div class="section">
    <div class="container">
        <a href="/">                        
            <img src="images/BVG_web_banner_image_2014_smaller.jpg" alt="Bayview Gallery">
        </a>
    </div>                
</div>
<nav class="navbar is-transparent" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">                
        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarMain">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </a>
    </div>              
    <div id="navbarMain" class="navbar-menu">
        <div class="navbar-start">
            <a class="navbar-item" href="/">
                Home
            </a>              
            <a class="navbar-item" href="artists.html">
                View<br>Inventory
            </a>
            <a class="navbar-item" href="galleries.html">
                Find<br>the Gallery
            </a>
            <a class="navbar-item" href="aboutus.html">
                Learn<br>About Us
            </a>
            <a class="navbar-item" href="currentExhibition.cfm">
                Browse<br>Current Exhibition
            </a>
            <a class="navbar-item" href="mailto:art@bayviewgallery.com">
                Send<br>Us Email
            </a>                                  
        </div>
        <div class="navbar-end">
            <div class="navbar-item">
                        
            </div>
        </div>                                
    </div>
</nav> 

<div class="section">    
    <div class="container columns is-centered mt-5">
        <div class="column is-one-third has-text-centered">
            <a href="Exhibition.cfm?estat=p">Past Exhibitions</a>
        </div>
        <div class="column is-one-third has-text-centered">
            <a href="Exhibition.cfm">Current Exhibitions</a>
        </div>
        <div class="column is-one-third has-text-centered">
            <a href="Exhibition.cfm?estat=f">Upcoming Exhibitions</a>
        </div>
    </div>
<cfif eStat EQ 'c'>
    <div class="container has-text-centered">
        <H1>
            <cfoutput>#ExhibitionPic.ExhibitStatus#</cfoutput> Exhibition 
            <br>
            <cfoutput>#ExhibitionPic.ExhibitName#</cfoutput> 
        </H1>
    </div>
	<cfoutput query="ExhibitionPic" maxrows="1">
        <div class="container has-text-left">
            #ReplaceNoCase(Text,Chr(10),"<br>","ALL")#	           
        </div>
	</cfoutput>
<cfelse>		
			<cfif ExhibitionPic.recordcount GT 0>
				<div class="container has-text-centered">
                        <h1><cfoutput>#ExhibitionPic.ExhibitStatus#</cfoutput> Exhibition
                            <cfif exhibitionpic.recordcount GT 1>s</cfif>
                        </h1>                    
                </div>
				<cfoutput query="exhibitionpic" group="exhibitname">
                    <div class="container has-text-centered">
                        <a href="exhibition.cfm?eid=#exhibitID#">#exhibitname#</a>
                    </div>
				</cfoutput>
			<cfelse>
				<div class="container has-text-centered">
                    <h1>No Exhibitions Found</h1>
                </div>
			</cfif>		
</cfif>

<cfif eStat EQ 'c'>
	<div class="columns is-multiline is-centered">
	    <div class="column is-full has-text-centered">            
            <FONT FACE="Arial,Helvetica" SIZE="1">images below can be enlarged</font>            
        </div>	    
	<!-- start dynamic pics loop -->
	<cfoutput query="ExhibitionPic" maxrows="1">
	
		<cfloop query="ExhibitionPic">
		<cfif len(imageid) GT 1>
			<!--- used to remove any pricing on past exhibits --->
			<cfset tempBlurb = #ReplaceNoCase(Blurb,Chr(10),"<br>","ALL")#>
			<cfif (exhibitStatus EQ "past") AND (listlen(blurb,'$') EQ 2)>
				<cfset tempBlurb = ListDeleteAt(tempBlurb, "2", "$")>
			</cfif>
				<div class="column is-one-quarter has-text-centered">
					<div class="container">
                        <a href="Show_Exhibition_Picture.cfm?ImageID=#ImageID#"><img src="images/ExhibitionPic/#ImageThumb#" border=0 ALT=""></a>
                    </div>
                    <div class="container">
						<font FACE="Arial,Helvetica" SIZE="2">#tempBlurb#</font>
					</div>
				</div>			
			
		</cfif>		
		</cfloop>	
	</cfoutput>	
	<!-- end dynamic pics loop -->
	</div>
</cfif>    
</div>		
<div class="section">
        <div class="container has-text-centered">
            <FONT FACE="Arial, Helvetica" SIZE="2">
            <B>Bayview Gallery</B><BR>
            <A HREF="mailto:art@bayviewgallery.com">art@bayviewgallery.com</A><BR><BR>            
            58 Maine Street, Brunswick, Maine 04011<BR>
	        207-729-5500 or  800-244-3007 
        </FONT>
        </div>
    </div>
    <nav class="navbar is-transparent footer-menu" role="navigation" aria-label="footer navigation">                         
        <div id="navbarFooter" class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item" href="/">
                    Home
                </a>              
                <a class="navbar-item" href="artists.html">
                    View<br>Inventory
                </a>
                <a class="navbar-item" href="galleries.html">
                    Find<br>the Gallery
                </a>
                <a class="navbar-item" href="aboutus.html">
                    Learn<br>About Us
                </a>
                <a class="navbar-item" href="currentExhibition.cfm">
                    Browse<br>Current Exhibition
                </a>
                <a class="navbar-item" href="mailto:art@bayviewgallery.com">
                    Send<br>Us Email
                </a>                                  
            </div>                                               
        </div>
    </nav> 
	<!-- BEGIN: Constant Contact Basic Opt-in Email List Form -->
    <div class="container">            
        <table border="0" cellspacing="0" cellpadding="3" bgcolor="#ffffcc" class="newsletter-form">
                    <tr>
                        <td align="center" style="font-weight: bold; font-family:Verdana,Geneva,Arial,Helvetica,sans-serif; font-size:12px; color:#000000;">Sign up for our Email Newsletter</td>
                    </tr>
                    <tr>
                        <td align="center" style="border-top:2px solid #000000">
                            <form name="ccoptin" action="https://visitor.constantcontact.com/d.jsp" target="_blank" method="post" style="margin-bottom:2;">
                                <input type="hidden" name="m" value="1101873900008">
                                <input type="hidden" name="p" value="oi">
                                <font style="font-weight: normal; font-family:Verdana,Geneva,Arial,Helvetica,sans-serif; font-size:12px; color:#000000;">Your Email:</font> 
                                <input type="text" name="ea" size="20" value="" style="font-size:10pt; border:1px solid #999999;">
                                <input type="submit" name="go" value="Go" class="submit" style="font-family:Verdana,Geneva,Arial,Helvetica,sans-serif; font-size:10pt;">
                            </form>
                        </td>
                    </tr>
        </table>                                          
    </div>
    <!-- END: Constant Contact Basic Opt-in Email List Form -->
    <!-- BEGIN: SafeSubscribe -->
    <div class="container has-text-centered">
        <a href="http://www.constantcontact.com/safesubscribe.jsp" target="_blank">
            <img src="https://img.constantcontact.com/ui/images1/safe_subscribe_logo.gif" border="0" width="168" height="14" alt=""/>
        </a>
    </div>
    <!-- END: SafeSubscribe -->
</body>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', () => {

        // Get all "navbar-burger" elements
        const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

        // Check if there are any navbar burgers
        if ($navbarBurgers.length > 0) {

        // Add a click event on each of them
        $navbarBurgers.forEach( el => {
            el.addEventListener('click', () => {

            // Get the target from the "data-target" attribute
            const target = el.dataset.target;
            const $target = document.getElementById(target);

            // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
            el.classList.toggle('is-active');
            $target.classList.toggle('is-active');

            });
        });
        }

    });
</script>
</html>