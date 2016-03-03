## -- coding: utf-8 --
<%inherit file="/base.mako" />

% if c.db_content is not None:
  ${ c.db_content.body | n }
% else:
    <div class="banner">
        <div class="container">
            <div class="cta">
                <div class="padding">
                    <h1>PyCon Australia is the national conference for users of the Python programming language</h1>
                    <ul class="conf-dates">
                        <li><strong>Mini-Conferences</strong><br/>July 31</li>
                        <li><strong>Presentations</strong><br/>August 1-2</li>
                        <li><strong>Sprints</strong><br/>August 3-4</li>
                    </ul>
                % if h.signed_in_person():
                %   if h.lca_info["cfp_status"] == 'open' or h.auth.authorized(h.auth.has_late_submitter_role):
                    <a href="/programme/submit_a_proposal" class="button large">Submit a proposal</a>
                %   endif
                % else:
                    <a href="/person/new" class="button large">Create Account</a>
                    <a href="/person/signin" class="button large grey">Login</a>
                % endif
                </div>
            </div>
        </div>
        <span data-picture data-alt="Banner Image" class="banner-bg">

            <span data-src="img/banner-768.png" data-media="(min-width: 401px)"></span>
            <span data-src="img/banner-900.png" data-media="(min-width: 769px)"></span>
            <span data-src="img/banner-1170.png" data-media="(min-width: 901px)"></span>
            <span data-src="img/banner-default.png" data-media="(min-width: 1171px)"></span>

            <noscript>
                <img src="/img/banner-default.jpg" alt="PyCon AU 2014">
            </noscript>
        </span>
    </div>

    % if h.lca_info["cfp_status"] == 'open' or h.auth.authorized(h.auth.has_late_submitter_role):
        <div class="important-news">
            <div class="container">
                <h2>Call for proposals is open!</h2>
                <a href="/cfp" class="button">Find out More</a>
            </div>
        </div>
    % elif h.lca_info["conference_status"] == 'open':
        <div class="important-news">
            <div class="container">
                <h2>Early bird registrations are now open!</h2>
                <a href="/register/prices" class="button">Find out More</a>
            </div>
        </div>
    % endif

% endif

        <div class="container">

% if False:
            <!-- speakers -->
            <h2 class="home-h2">Speakers</h2>

            <div id="speakers" class="owl-carousel">
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
                <div class="item">
                    <img src="http://placehold.it/280x250" alt="" class="scale-with-grid" />
                    <p>
                        <a href="speaker">Speaker Name</a>
                        Speaker Company, position, etc.
                    </p>
                </div>
            </div>

            <div class="content-cta centered">
                <a href="#" class="button large">View Full Programme</a>
            </div>
% endif

            <!-- Sponsors -->
            <h2 class="home-h2">Sponsors</h2>

            <div id="sponsors" class="owl-carousel">
                <div class="item">
                    <a href="http://www.asd.gov.au/">
                        <img src="img/logos/asd.jpg" alt="Australian Signals Directorate" class="scale-with-grid" />
                        <span>Gold</span>
                    </a>
                    <a href="/sponsors/why_sponsor">
                        <img src="img/logos/default-logo.png" alt="Become a sponsor!" class="scale-with-grid" />
                        <span>Become a sponsor!</span>
                    </a>
                </div>

                <div class="item">
                    <a href="http://www.openstack.org/">
                        <img src="img/logos/openstack.png" alt="Openstack" class="scale-with-grid" />
                        <span>Standard</span>
                    </a>
                    <a href="/web/20150324055746/http://python.org/psf">
                        <img src="img/logos/python.png" alt="Python Software Foundation" class="scale-with-grid" />
                        <span class="standard">Standard</span>
                    </a>
                </div>

                <div class="item">
                    <a href="/web/20150324055746/http://www.djangoproject.com/foundation/">
                        <img src="img/logos/django.png" alt="Django Software Foundation" class="scale-with-grid" />
                        <span>Standard</span>
                    </a>
                    <a href="/web/20150324055746/http://biarri.com/">
                        <img src="img/logos/biarri.png" alt="Biarri Commercial Mathematics" class="scale-with-grid" />
                        <span>Standard</span>
                    </a>
                </div>

                <div class="item">
                    <a href="http://kabucreative.com.au">
                        <img src="img/logos/kabu.png" alt="Kabu Creative" class="scale-with-grid" />
                        <span>In-Kind</span>
                    </a>
                    <a href="http://edgeqld.org.au/">
                        <img src="img/logos/the_edge.png" alt="The Edge" class="scale-with-grid" />
                        <span>In-Kind</span>
                    </a>
                </div>

                <div class="item">
                    <a href="http://www.humbug.org.au/">
                        <img src="img/logos/humbug.png" alt="Humbug" class="scale-with-grid" />
                        <span>In-Kind</span>
                    </a>
                    <a href="/sponsors/why_sponsor">
                        <img src="img/logos/default-logo.png" alt="Become a sponsor!" class="scale-with-grid" />
                        <span>Become a sponsor!</span>
                    </a>
                </div>
            </div>
            <div class="content-cta centered">
                <a href="/sponsors/sponsors" class="button large">Sponsor PyCon Australia</a>
            </div>

            <!-- News-->
            <h2 class="home-h2">News</h2>

            <div class="nine columns">
                <%include file="/leftcol/news.mako" />
            </div>

            <div class="three columns">
                <%include file="/loop.mako" />
            </div>
            <div class="clearfix"></div>

            <!-- Location -->
            <h2 class="home-h2">Location</h2>

            <div class="six columns">
                <div id="map-canvas"></div>
            </div>

            <div class="three columns pullman-images">
                <span data-picture data-alt="Pullman Hotel" class="pullman-img">
                    <span data-src="/img/8784_ho_02_p_1024x768.jpg" data-media="(min-width: 1171px)"></span>
                </span>
                <span data-picture data-alt="Pullman Hotel" class="pullman-img">
                    <span data-src="/img/8784_sm_00_p_1024x768.jpg" data-media="(min-width: 1171px)"></span>
                </span>
            </div>

            <div class="three columns about-pullman">
                <div class="padding">
                    <p class="pullman-address">
                        <span>Pullman Hotel</span><br/>
                        King George Square<br/>
                        Brisbane QLD 4000
                    </p>
                    <p>The <a href="http://www.pullmanbrisbanekgs.com.au/">Pullman Hotel</a> is located in the Brisbane CBD, 
                    just across from the Brisbane City Hall which contain the 
                    <a href="http://www.museumofbrisbane.com.au/">Musuem of Brisbane</a>. </p>
                    The Pullman is a combined hotel and conference facility, the largest of its type in Brisbane. 
                    The Pullman is right next to the retail precinct and public transport.
                </div>
            </div>

            <div class="clearfix"></div>
        </div>



<%def name="short_title()"><%
  return "Homepage"
%></%def>
