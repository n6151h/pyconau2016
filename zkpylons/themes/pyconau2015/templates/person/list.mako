<%inherit file="/base.mako" />

<h2>People</h2>
<table>

% if len(c.person_collection) > 0:
  <tr>
    <th>id</th>
    <th>Email</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Created</th>
    <th>&nbsp;</th>
  </tr>
% endif

% for p in c.person_collection:
  <tr class="${ h.cycle('odd', 'even') }">
    <td>${ h.link_to(p.id, url=h.url_for(action='view', id=p.id)) }</td>
    <td><a href="mailto:${ p.email_address |h }">${ p.email_address |h }</a></td>
    <td>${ p.firstname |h }</td>
    <td>${ p.lastname |h }</td>
    <td>${ p.creation_timestamp |h }</td>

    <td>
%   for action in ['roles', 'edit']:
      ${ h.link_to(action, url=h.url_for(action=action, id=p.id)) }<br>
%   endfor
    </td>
  </tr>
% endfor
</table>

<p><a href="${ h.url_for(controller='person', action='new_incomplete') }">Create a new account</a></p>

<%def name="title()">
People -
 ${ parent.title() }
</%def>

