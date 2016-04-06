<%inherit file="/base.mako" />

<h1>Submit a Proposal</h1>
<p class="lead">Please read the <a href="${ h.url_for("/programme/call_for_proposals") }">Call for Proposals</a> page before submitting a proposal.</p>
<p>You will be able to modify your proposal as many times as you need, up until the call for proposals closes.</p>
<br>
<form action="/proposal/new" method="post" data-toggle="validator" class="form-horizontal" enctype="multipart/form-data">

<%include file="form.mako" args="editing=False" />

<div class="container-fluid">
  <div class="form-group">
    <button type="submit" class="btn btn-primary">Submit talk proposal</button>
  </div>
</div>
${ h.end_form() }

<%def name="short_title()"><%
  return "Submit a Proposal"
%></%def>
<%def name="title()" >
Submit a Paper - ${ parent.title() }
</%def>
