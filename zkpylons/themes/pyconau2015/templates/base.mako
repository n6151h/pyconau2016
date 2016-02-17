<%def name="title()">${ h.lca_info["event_byline"] }</%def>
<%def name="home_link()">${ h.lca_info["event_url"] }</%def>
<%def name="short_title()">
   ## Defined in children
</%def>
<%def name="extra_head()">
    ## Defined in children
</%def>
<%def name="extra_body()">
% if c.no_theme:
  <body style="background-color: #f8f8f8">
% else:
  <body>
% endif
</%def>
<%def name="big_promotion()">
    ## Defined in children
</%def>
<%def name="toolbox_extra()">
    ## Defined in children
</%def>
<%def name="toolbox_extra_admin()">
    ## Defined in children
</%def>
<%def name="toolbox_extra_reviewer()">
    ## Defined in children
</%def>
<%def name="toolbox_extra_funding_reviewer()">
    ## Defined in children
</%def>
<%def name="contents()">
    ## Defined in children
</%def>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="prefetch" href="https://login.persona.org/include.js">
        <title>${ self.title() }</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/media/news/rss" rel="alternate" type="application/rss+xml" title="${ self.title() }">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link href='//fonts.googleapis.com/css?family=Oswald:400,700|Oxygen:400,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="/css/stylesheets/vendor/font-awesome.css">
        <link rel="stylesheet" href="/css/stylesheets/vendor/owl.carousel.css">
        <link rel="stylesheet" href="/css/stylesheets/vendor/owl.theme.css">

        <link rel="stylesheet" href="/css/stylesheets/style.css">

         <!--[if lte IE 9]>
            <link href="/css/stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
        <![endif]-->

        <script src="/js/vendor/modernizr-2.6.2.min.js"></script>
        ${self.extra_head()}
    </head>

    ${self.extra_body()}

        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <%include file="/flash.mako" />

        <header>
            <div class="nav-bg"></div>
            <div class="container">
                <a href="${home_link()}">
                    <!-- PictureFill Responsive Logo -->
                    <span data-picture data-alt="PyCon AU 2015 Logo">
                        <span data-src="/img/mobile-logo.png" class="mobile-logo"></span>
                        <span data-src="/img/logo.png" data-media="(min-width: 769px)" class="logo"></span>

                        <noscript>
                            <img src="/img/logo.png" alt="PyCon AU 2015 Logo" class="logo">
                        </noscript>
                    </span>
                </a>

                <%include file="/nav.mako" />
                <div class="clearfix"></div>

                <div class="ctas pull-right">
        % if h.signed_in_person():
                    <a class="first button block" href="${h.url_for(controller='person', action='view', id=h.signed_in_person().id)}">My Profile</a>
                    <a class="button grey block" href="/person/signout">Sign Out</a>
                % else:
                    <a class="first button block" href="/person/new">Create Account</a>
                    <a class="button grey block" href="/person/signin">Login</a>
                % endif
                </div>

                <div class="dates pull-right">
                    <h2>31<sup>st</sup> JULY - 4<sup>th</sup> AUGUST 2015</h2>
                    <p class="location">Pullman Brisbane - King George Square</p>
                </div>

                <div class="clearfix"></div>
            </div>
        </header>


        <div class="mobile-menu">
            <a href="#" class="toggle-mobile-menu">Menu<i class="fa fa-bars pull-right"></i></a>
            <%include file="/mobile-nav.mako" />
        </div>

        <%include file="/mobile-subnav.mako" />

% if h.url_for() != '/':
        <div class="internal-banner">
            <div class="container">
                <div class="cta offset-by-three">
                % if not h.signed_in_person():
                    <a href="/person/new" class="button large register">Create Account</a>
                % endif
                    <ul class="conf-dates">
                        <li><strong>Mini-Conferences</strong><br/>July 31</li>
                        <li><strong>Presentations</strong><br/>August 1-2</li>
                        <li class="last"><strong>Sprints</strong><br/>August 3-4</li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="three columns">
                <%include file="/subnav.mako" />


                <div class="sidebar-module loop">
                    <h3 class="sidebar-title">Stay in the loop</h3>
                    <%include file="/loop.mako" />
                </div>

               <div class="sidebar-module news">
                    <h3 class="sidebar-title">Latest News</h3>
                    <div class="news-titles">
                        <ul>
%                       for d in c.db_content_news:
                            <li>${ h.link_to(d.title, url='/media/news/' + str(d.id)) }<br />${ d.creation_timestamp.strftime("%d %B %Y") }</li>
%                       endfor
                        </ul>
                        <a href="/media/news">More News...</a>
                    </div>
                </div>
            </div>
            <div class="seven columns">
                <div class="internal-content">

% endif
        ${next.body()}

% if h.url_for() != '/':
                </div>
            </div>

            <div class="two columns">
% if h.signed_in_person():
                <%include file="/leftcol/toolbox.mako" args="parent=self" />
% endif

                <div class="sidebar-logos">
                    <!--
                    <a href="company url">
                        <img src="/img/logos/default-logo.png" alt="company" class="scale-with-grid" />
                    </a>
                    --!>
                </div>
          </div>
            <div class="clearfix"></div>
        </div>

% endif

        <footer>
            <div class="container">
                <ul class="footer-links">
                    <li><a href="/about/pycon-au">About PyCon Australia</a></li>
                    <li><a href="/register/prices">Prices</a></li>
                    <li><a href="/register/accommodation">Accommodation</a></li>
                    <li><a href="/about/venue">Venue</a></li>
                    <li><a href="/about/history">History</a></li>
                    <li><a href="/register/code_of_conduct">Code of Conduct</a></li>
                </ul>

                <ul class="footer-links">
                    <li><a href="/programme/about">About the Programme</a></li>
                    <li><a href="/programme/keynotes">Keynotes</a></li>
                    <li><a href="/programme/miniconfs">MiniConfs</a></li>
                    <li><a href="/programme/schedule/saturday">Schedule</a></li>
                    <li><a href="/programme/social_events">Social Events</a></li>
                </ul>

                <ul class="footer-links">
                    <li><a href="/sponsors/sponsors">Our Sponsors</a></li>
                    <li><a href="/sponsors/why_sponsor">Why Sponsor</a></li>
                    <li><a href="/media/news">Media</a></li>
                    <li><a href="/media/in_the_press">In the Press</a></li>
                    <li><a href="/media/graphics">Graphics</a></li>
                    <li><a href="/contact">Contact</a></li>
                </ul>
                <ul class="footer-conf-dates">
                    <li><strong>Mini-Conferences</strong><br/>July 31</li>
                    <li><strong>Presentations</strong><br/>August 1-2</li>
                    <li><strong>Sprints</strong><br/>August 3-4</li>
                </ul>
                <a href="${home_link()}"><img src="/img/white-logo.png" alt="PyConAu Logo" class="pull-right white-logo" /></a>
                <div class="clearfix"></div>
            </div>
        </footer>
        <div class="bottom-footer">
            <div class="container">
                <span>© 2015 <a href="http://pycon-au.org/">PyCon Australia</a> and <a href="http://linux.org.au/">Linux Australia</a></span>
                <span>Designed by <a href="http://kabucreative.com.au">Kabu Creative</a></span>
                <span class="cc-credit pull-right">
                    <span>
                        Banner image by <a href="https://secure.flickr.com/photos/richard_jones/6102827522/sizes/l/">Richard Jones</a> (<a href="https://creativecommons.org/licenses/by/2.0/">CC Attribution</a>)
                    </span>
                </span>
            </div>
            <div class="dark-bottom-footer"></div>
            <div class="bottom-footer-bg"></div>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>

        <script type="text/javascript">
           jQuery(document).ready(function() {
             jQuery("#flash > div").hide().fadeIn(3500);
             jQuery("#flash > div").fadeTo(3000, 0.3);
             jQuery("#flash > div").hover(function() {
               jQuery(this).fadeTo(250, 1);
             },function(){
               jQuery(this).fadeTo(250, 0.3);
             });
           });
        </script>

        <script src="/js/vendor/owl.carousel.min.js"></script>
        <script src="/js/vendor/picturefill.js"></script>
        <script src="/js/pycon-main.js"></script>

        <!-- TODO: Add Google Analytics -->

    </body>
</html>
