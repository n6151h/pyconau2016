%for d in c.db_content_news:
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
        <div class="clearfix"></div>
    </article>
%endfor
