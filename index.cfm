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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="detectmobilebrowser.js"></script>
    <script type="text/javascript">
        if (jQuery.browser.mobile)
    {
        window.location.href = 'http://www.bayviewgallery.com/index_mobi.html';
    }
    </script> 
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

</head>
<body>
    <cfquery name="IndexPic" datasource="bayview" dbtype="ODBC">
        SELECT * 
        FROM tblIndexPic
        
    </cfquery>
    <div class="section">
        <div class="container">
            <a href="/">                        
                <img src="images/BVG_web_banner_image_2014_smaller.jpg" alt="Bayview Gallery">
            </a>
        </div>        
    </div>
    <div class="columns is-desktop">
            <div class="column is-one-quarter has-text-centered">
                <div class="container">
                    <a href="http://www.facebook.com/pages/Bayview-Gallery/183780655000860">
                        <img src="images/facebook-icon.gif" width="133" height="37" alt="facebook icon">
                    </a>                            
                </div>
            </div>
            <div class="column is-half has-text-centered">
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
            <div class="column is-one-quarter has-text-centered">                            
                <div class="container">
                    <a href="https://twitter.com/#!/Bayview_Gallery">
                        <img src="images/twitter-icon.gif" width="122" height="39" alt="twitter icon">
                    </a>                          
                </div>                            
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
        <div class="container">
            <div class="columns is-desktop">
                <div class="column is-two-thirds">
                    <a href="artists.html">
                        <cfoutput query="IndexPic">
                            <cfif #DisplayOrder# IS '1'><img src="images/indexPic/#Image#" border=0 alt="#ArtistName#" HSPACE=10 BORDER="0">
                            </cfif>
                        </cfoutput>
                    </a>
                </div>
                <div class="column is-one-third">
                    Welcome to BayviewGallery.com!<br><br>
                    Enjoy your visit to our website and come see all of our beautiful artwork in person at 58 Maine Street in Brunswick, Maine!
                </div>
            </div>
            <div class="columns is-desktop">                
                <div class="column is-two-thirds">
                    <a href="artists.html">
                        <cfoutput query="IndexPic">
                            <cfif #DisplayOrder# IS '2'><img src="images/indexPic/#Image#" border=0 alt="#ArtistName#" HSPACE=10>
                            </cfif>
                        </cfoutput>
                    </a>
                </div>
                <div class="column is-one-third">
                    Bayview Gallery offers paintings by New England's finest and most renowned <A HREF="artists.html">artists</A>. The artists we represent span the spectrum from contemporary American Impressionists to Realists.
                </div>
            </div>
            <div class="columns is-desktop">   
                <div class="column is-one-third">
                    Thanks for visiting, come and see us when you're in Maine.
                </div>             
                <div class="column is-two-thirds">
                    <a href="artists.html">
                        <cfoutput query="IndexPic">
                            <cfif #DisplayOrder# IS '3'><img src="images/indexPic/#Image#" border=0 alt="#ArtistName#" HSPACE=10>
                            </cfif>
                        </cfoutput>
                    </a>
                </div>                
            </div>
        </div>                                  
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