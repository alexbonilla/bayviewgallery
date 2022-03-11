<!DOCTYPE html>
<html lang="en">
<head>
    <meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Bayview Gallery offers paintings by New England's finest and most renowned artists. The artists we represent span the spectrum from contemporary American impressionists to contemporary American realists. We also display sculpture and offer original and limited-edition prints by important New England artists.">
	<meta name="title" content="Bayview Gallery">
    <meta name="author" content="Alex Bonilla">
	<meta name="keywords" content="Art of Maine, Artists, Frameshops, Art Gallery, Maine, elegant art, paintings, prints, sculptures, New England Artists, restoration, art collections, hanging prints, John Atwater, Stapleton Kearns, David Little, Scott Moore, Donald Allen Mosher, Stefan Pastuhov, Don Stone">
	<meta name="rating" content="Safe for kids">
    
    <link rel="stylesheet" href="css/styles.css">
    <title>Bayview Gallery</title>
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


    <cfif url.imageID NEQ 0>
	
        <cfquery name="exhibitionPic" datasource="bayview" dbtype="ODBC">
            SELECT tblexhibitionPic.*, tblExhibit.exhibitStatus
            FROM tblexhibitionPic, tblExhibit
            WHERE tblexhibitionPic.ImageID = <cfqueryparam value="#url.ImageID#" cfsqltype="cf_sql_integer" maxlength="10">
            AND tblexhibitionPic.exhibitID = tblExhibit.exhibitID
        </cfquery>


    <cfelse>
	    <cflocation url="exhibition.cfm" addtoken="false" >
    </cfif>

    <div class="section">
        <div class="container has-text-centered">
            <a href="/">                        
                <img src="images/BVG_web_banner_image_2014_smaller.jpg" alt="Bayview Gallery">
            </a>
        </div>
        <div class="container has-text-centered">        
            <img src="images/BVG_address_hours_bar.jpg" alt="Bayview Gallery Hours and Address">
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
                    View Inventory
                </a>
                <a class="navbar-item" href="galleries.html">
                    Find the Gallery
                </a>
                <a class="navbar-item" href="aboutus.html">
                    Learn About Us
                </a>
                <a class="navbar-item" href="currentExhibition.cfm">
                    Browse Current Exhibition
                </a>
                <a class="navbar-item" href="mailto:art@bayviewgallery.com">
                    Send Us Email
                </a>                                  
            </div>
            <div class="navbar-end">
                <div class="navbar-item">
                            
                </div>
            </div>                                
        </div>
    </nav> 
    <div class="container has-text-centered">
        <a href="Exhibition.cfm"><< Back</a>
    </div>
    <div class="section">        
        <!-- start dynamic large pic display -->
        <cfif parameterexists(url.ImageID)>
		    <cfoutput query="exhibitionPic">
							
				<!--- used to remove any pricing on past exhibits 	--->
				<cfset tempBlurb = #ReplaceNoCase(Blurb,Chr(10),"<br>","ALL")#>
				<cfif (exhibitStatus EQ "past") AND (listlen(blurb,'$') EQ 2)>
					<cfset tempBlurb = ListDeleteAt(tempBlurb, "2", "$")>
				</cfif>
                <div class="container has-text-centered mt-5">
                    <img src="images/exhibitionPic/#ImageBig#" border=0 ALT="">
                </div>
                <div class="container has-text-centered mt-3">
                    <FONT FACE="Arial,Helvetica" SIZE="2">#tempBlurb#</font>
                </div>
                <div class="container has-text-centered mt-3">
                    <a href="#cgi.HTTP_REFERER#">
                        <font FACE="Arial,Helvetica" SIZE="2">
                            <strong>Back</strong>
                        </font>
                    </a>
                </div>
            </cfoutput>					
		<cfelse>
			<div class="container has-text-centered mt-5">
                <strong>Sorry, but there is no image to show.</strong>			
            </div>	
		</cfif>
        <!-- end dynamic pics loop -->
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
                    View Inventory
                </a>
                <a class="navbar-item" href="galleries.html">
                    Find the Gallery
                </a>
                <a class="navbar-item" href="aboutus.html">
                    Learn About Us
                </a>
                <a class="navbar-item" href="currentExhibition.cfm">
                    Browse Current Exhibition
                </a>
                <a class="navbar-item" href="mailto:art@bayviewgallery.com">
                    Send Us Email
                </a>                                  
            </div>                                               
        </div>
    </nav>     
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




