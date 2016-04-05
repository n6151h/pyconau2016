<%def name="title()">${ c.config.get("event_byline") }</%def>
<%def name="short_title()">
   ## Defined in children
</%def>
<%def name="extra_head()">
    ## Defined in children
</%def>
<%def name="extra_body()">
  <body>
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
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/x-icon" href="/favicon.ico">

    <title>${ self.title() }</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <link href="/css/pyconau.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container-fluid">
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/">${ c.config.get('event_name') }</a>
            </div>
	    <%include file="nav.mako" args="parent=self" />
          </div>
        </nav>
      </div>
    </div>

  <div class="container">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10"><div class="wrapper">
        <%include file="/flash.mako" />
        ${next.body()}
      </div></div>
      <div class="col-md-1 wrapper text-center">
        <h4>Sponsors</h4>
        <br><b>Platinum</b>
        <br><img class="img-responsive center-block" title="Centric Web Estate" src="/img/logos/dev-demand.png">
        <br><img class="img-responsive center-block" title="Iress" src="/img/logos/iress.png">
        <br><b>Gold</b>
        <br><img class="img-responsive center-block" title="Google" src="/img/logos/google.png">
        <br><img class="img-responsive center-block" title="Optiver" src="/img/logos/optiver.png">
      </div>
    </div>
  </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/validator.min.js"></script>
    <script src="/js/sorttable.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/js/ie10-viewport-bug-workaround.js"></script>
    
    <!-- Sidebar Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
  </body>
</html>

