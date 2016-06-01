## -- coding: utf-8 --
<%inherit file="/base.mako" />
<h1>Welcome to ${ c.config.get('event_name') }!</h1>

% if c.db_content is not None:
  <p class="lead">
  ${ c.db_content.body | n }
  </p>
% else:
  <p>
    To put content here create a page with a URL of <u>/home</u> in the
    <a href="${ h.url_for(controller='db_content', action='new') }">page database</a>.
  </p>
% endif

<h1>News</h1>
%for d in c.db_content_news[:3]:
    <article class="homepage-news">
    <p class="date">${ d.creation_timestamp.strftime("%d&nbsp;%B&nbsp;%Y")|n}</p>
        <div class="article-body">
            <h4 class="news-title">${ h.link_to(d.title, url='/media/news/' + str(d.id)) }</h4>
            <% (teaser, read_more) = h.make_teaser(d.body) %>
            ${ teaser |n}
            % if read_more:
               &hellip; ${ h.link_to('more', url='/media/news/' + str(d.id)) }
            % endif
        </div>
    </article>
%endfor


<%def name="short_title()"><%
  return "Homepage"
%></%def>
