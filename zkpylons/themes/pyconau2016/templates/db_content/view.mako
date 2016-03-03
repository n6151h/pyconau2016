<%inherit file="/base.mako" />
<%namespace file="../bookmark_submit.mako" name="bookmark_submit" inheritable="True"/>

<%

url = c.event_permalink + h.url_for()
%>

<h1>${ c.db_content.title }</h1>

% if c.db_content.is_news():
<div style="float: right;">
${ bookmark_submit.bookmark_submit(url, c.db_content.title) }
</div>
<p class="submitted">
Submitted on ${ c.db_content.creation_timestamp.strftime("%Y-%m-%d&nbsp;%H:%M") |n }
</p>
% endif

<%
body = c.html_body
%>
${ body |n}


<%def name="title()">
${ c.db_content.title } -
 ${ parent.title() }
</%def>

<%def name="big_promotion()">
<% directory = h.featured_image(c.db_content.title, big = True) %>
%if directory is not False:
			<div class = 'news_banner'>
%  if h.os.path.isfile(directory + "/3.png"):
				<div class = 'news_banner_left'>
					<a href = '/media/news/${ c.db_content.id }'><img src = '${ directory }/1.png' alt="${ c.db_content.title }" title="${ c.db_content.title }"></a>
				</div>
%  endif
%  if h.os.path.isfile(directory + "/3.png"):
				<div class = 'news_banner_right'>
					<a href = '/media/news/${ c.db_content.id }'><img src = '${ directory }/3.png' alt="${ c.db_content.title }" title="${ c.db_content.title }"></a>
				</div>
%  endif
				<a href = '/media/news/${ c.db_content.id }'>
					<img src = '${ directory }/2.png' alt="${ c.db_content.title }" title="${ c.db_content.title }">
				</a>
			</div>
  <br /><br />
%endif
</%def>

<%def name="extra_head()">
<% directory = h.featured_image(c.db_content.title, big = True) %>
%if directory is not False:
<style type="text/css">
.content
{
    background-image: url(/images/content_bg_tall.png);
}
</style>
%endif
${ c.html_headers |n}
</%def>

