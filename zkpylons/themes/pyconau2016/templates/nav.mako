<%
    submenus = {
        'about': ['Pycon Australia', 'Venue', 'History', 'Harassment'],
        'melbourne': ['About', 'Sightseeing'],
        'sponsors': ['Sponsors', 'Why Sponsor'],
        'programme': ['About', 'Call for Proposals'],
        #'programme': ['About', 'Social Events', 'Open Day', 'Partners Programme'], # stage 0
        'register': ['Prices', 'Terms and Conditions'],
        #'register': ['Prices', 'Funding', 'Terms and Conditions'],
        'media': ['News','In the press','Graphics']
    }

    url = h.url_for()

    # Hack for schedule url
    if url.startswith('/schedule'):
        url = '/programme' + url

    mm = [
        ('Home', '/', 'home'),
        ('About', '/about/pycon2016.au', 'about'),
#        ('Melbourne', '/melbourne/about', 'melbourne'),
        ('Sponsors', '/sponsors/sponsors', 'sponsors'),
        ('Programme', '/programme/about', 'programme'),
#        ('Register', '/register/prices', 'register'),
#        ('Media', '/media/news', 'media'),
        ('Contact', '/contact', 'contact'),
#        ('Wiki', '/wiki', 'wiki'),
    ]

    where = ''
    if url == '' or url == '/':
        where = 'home'

    map = [(u, c) for (t, u, c) in mm]

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
% for (t, u, c) in mm:
%   if c == 'selected':
          <li class="active">${ t |n }</li>
%   else:
%     if submenus.has_key(c):
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${ t }<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
%       for sub in submenus[c]:
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
          <li ${ cls(c) |n}><a href="${ u }">${ t }</a></li>
%     endif
%   endif
% endfor
      </ul>
</div>
