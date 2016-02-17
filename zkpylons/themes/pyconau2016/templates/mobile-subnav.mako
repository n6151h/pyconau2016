<%
    # Edit the list of submenus here :-)
    submenus = h.lca_submenus

    # The current URL can be accessed as h.url()()
    url = h.url_for()
    # Hack for schedule url
    if url.startswith('/schedule'):
        url = '/programme' + url

    where = ''
    map = h.lca_menu

    for (t, u, w) in map:
        if url.startswith('/' + w):
            where = w

    def cls(part):
        if part == where:
            return 'class="now"'
        else:
            return 'class=""'

    def current(link):
        if url.startswith(link):
            return True
        else:
            return False

%>


% if submenus.has_key(where):
  <!-- Secondary navigation -->
                <div class="mobile-sub-menu">
                    <nav class="mobile-sub-nav">
%   for sub in submenus[where]:
<%
     link = sub.replace('/', '_').lower()
     link = '/'+where+'/'+link
     link = link.replace(' ', '_')
%>
%     if current(link):
                        <a href="${ link }" class="active">${ sub } <i class="fa fa-chevron-right pull-right"></i></a>
%     else:
                        <a href="${ link }" >${ sub } <i class="fa fa-chevron-right pull-right"></i></a>
%     endif
%   endfor
                    </nav>
               </div>
% endif
