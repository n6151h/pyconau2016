<%page args="parent" />

<%
    submenus = {
        'about': ['PyCon Australia', 'Venue', 'Code of Conduct', 'Financial Assistance'],
        'melbourne': ['About', 'Sightseeing'],
        'sponsors': ['Sponsors', 'Contributor'],
        'programme': ['Call for Proposals', 'DjangoCon AU', 'Python in Education Seminar', 'Science and Data Miniconf', 'Internet of Things Miniconf'],
        #'programme': ['About', 'Social Events', 'Open Day', 'Partners Programme'], # stage 0
        'register': ['Status', 'Prices', 'Accommodation', 'Terms and Conditions'],
        #'register': ['Prices', 'Funding', 'Terms and Conditions'],
        'media': ['News','In the press','Graphics']
    }

    url = h.url_for()

    # Hack for schedule url
    if url.startswith('/schedule'):
        url = '/programme' + url

    if c.config.get('conference_status') == 'open' or h.signed_in_person().registration:
      mm_register = [('Register', '/register/prices', 'register')]
    else:
      mm_register = []

    mm = [
        #('Home', '/', 'home'),
        ('About', '/about/pycon2016.au', 'about'),
        ('News', '/media/news', 'news'),
#        ('Melbourne', '/melbourne/about', 'melbourne'),
        ('Sponsors', '/sponsors/sponsors', 'sponsors'),
        ('Programme', '/programme/about', 'programme')
	] + mm_register + [
#        ('Media', '/media/news', 'media'),
        ('Contact', '/contact', 'contact'),
#        ('Wiki', '/wiki', 'wiki'),
    ]

    where = ''
    if url == '' or url == '/':
        where = 'home'

    map = [(u, cc) for (t, u, cc) in mm]

    for (u, w) in map:
        if url.startswith('/' + w):
            where = w

    def cls(part):
        if part == where:
            return 'class="selected"'
        else:
            return 'class=""'
%>
<div id="navbar" class="navbar-collapse collapse">
  <ul class="nav navbar-nav">
% for (t, u, cc) in mm:
%   if cc == 'selected':
          <li class="active">${ t |n }</li>
%   else:
%     if submenus.has_key(cc):
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${ t }<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
%       for sub in submenus[cc]:
          <%
          link = sub.replace('/', '_')
          link = '/'+t+'/'+link
          link = link.lower()
          link = link.replace(' ', '_')
          %>
                  <li><a href="${ link }">${ sub }</a></li>
%       endfor
              </ul>
          </li>
%     else:
          <li ${ cls(cc) |n}><a href="${ u }">${ t }</a></li>
%     endif
%   endif
% endfor

  <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">

<%
    this_url = h.url_for()
    url=c.config.get("event_permalink") + this_url
%>
<%def name="make_link(title, url)">
<%
      if this_url == url:
          cls=' class="selected"'
      else:
          cls=''
%>
      <li ${cls | n}><a href="${url}"><span class="l"></span><span class="r"></span><span class="t">${title}</span></a></li>
</%def>

## Toolbox links
% if h.signed_in_person():
    <li class="nav-head">${ h.signed_in_person().firstname }'s Profile</li>
${ parent.toolbox_extra() }
%   if c.config.get("cfp_status") == 'open' or h.auth.authorized(h.auth.has_late_submitter_role):
      ${ make_link('Submit a proposal', h.url_for(controller='proposal', action='new', id=None)) }
%   endif

%   if c.config.get('conference_status') == 'open' or h.signed_in_person().registration:
      ${ make_link('Conference registration', '/register/status') }
%   endif

%   if h.signed_in_person().is_speaker():
      ${ make_link('Speakers Info', '/programme/presenter_faq') }
%   endif

## %   if h.signed_in_person().is_miniconf_org():
##       ${ make_link('Miniconf Organiser Info', '/programme/miniconf_information') }
## %   endif

%   if len(h.signed_in_person().proposals) > 0:
      ${ make_link('My proposals', h.url_for(controller='proposal')) }
%   endif
      ${ make_link('My profile', h.url_for(controller='person', action='view', id=h.signed_in_person().id)) }
      ${ make_link('Sign out', h.url_for('/person/signout')) }
% else:
      ${ make_link('Sign in', "/person/signin") }
      ${ make_link('Create an account', "/person/new") }
% endif
% if h.auth.authorized(h.auth.has_organiser_role):
<li class="nav-head">Zookeepr Administration</li>
      ${ make_link('Admin', h.url_for(controller='admin')) }
      ${ make_link('Lookup', h.url_for(controller='admin', action='lookup')) }
      ${ make_link('View People', h.url_for(controller='person')) }
      ${ make_link('Manage Pages', h.url_for(controller='db_content')) }
      ${ make_link('Manage Files', h.url_for('/db_content/list_files')) }
%   if c.db_content and not (h.url_for().endswith('/edit') or h.url_for().endswith('/new')):
      ${ make_link('Edit Page', h.url_for(controller='db_content', action='edit', id=c.db_content.id)) }
%   elif c.not_found:
      ${ make_link('Create page here', h.url_for(controller='db_content', action='new')) }
%   endif
${ parent.toolbox_extra_admin() }
% endif
% if h.auth.authorized(h.auth.has_reviewer_role):
<li class="nav-head">Propsal Reviewer</li>
${ parent.toolbox_extra_reviewer() }
      ${ make_link('How to review', '/help/review') }
      ${ make_link('Proposals to review', h.url_for(controller='proposal', action='review_index', id=None)) }
      ${ make_link("Reviews you've made", h.url_for(controller='review', action='index', id=None)) }
      ${ make_link('Summary of reviewed proposals', h.url_for(controller='proposal', action='summary', id=None)) }
      ${ make_link('Reviewer summary', h.url_for(controller='review', action='summary', id=None)) }
<li class="nav-head">List of proposals by:</li>
    %if c.config.get('cfp_hide_scores') == 'no':
        ${ make_link('Certain score / count of reviewers', h.url_for(controller='admin', action='proposals_by_strong_rank', id=None)) }
        ${ make_link('max score, min score then average', h.url_for(controller='admin', action='proposals_by_max_rank', id=None)) }
        ${ make_link('stream and score', h.url_for(controller='admin', action='proposals_by_stream', id=None)) }
    %endif
        ${ make_link('number of reviewers', h.url_for(controller='admin', action='proposals_by_number_of_reviewers', id=None)) }
        ${ make_link('submission date', h.url_for(controller='admin', action='proposals_by_date', id=None)) }
% endif
% if h.auth.authorized(h.auth.has_funding_reviewer_role):
    <li class="nav-head">Funding Reviewer</li>
${ parent.toolbox_extra_funding_reviewer() }
      ${ make_link('How to review', '/help/funding_review') }
      ${ make_link('Proposals to review', h.url_for(controller='funding', action='review_index')) }
      ${ make_link("Reviews you've made", h.url_for(controller='funding_review', action='index')) }
      ${ make_link('Summary of reviewed proposals', h.url_for(controller='funding', action='summary')) }
      ${ make_link('Reviewer summary', h.url_for(controller='funding_review', action='summary')) }
      <li class="nav-head">List of requests by:</li>
        ${ make_link('Certain score / count of reviewers', h.url_for(controller='admin', action='funding_requests_by_strong_rank')) }
        ${ make_link('max score, min score then average', h.url_for(controller='admin', action='funding_requests_by_max_rank')) }
% endif

% if h.signed_in_person():
    <li style="font-style: italic; padding-left: 7px;">${h.signed_in_person().email_address}</li>
% endif


</ul>
</li>
      </ul>
</div>
