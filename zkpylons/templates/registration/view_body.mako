        <blockquote>
        <p>
        ${ c.registration.person.firstname } ${ c.registration.person.lastname }
%if c.config.get('personal_info', category='rego')['home_address'] == 'yes':
        <br/>${ c.registration.person.address1 }
% if c.registration.person.address2:
        <br/>${ c.registration.person.address2 }
% endif
% if c.registration.person.state:
        <br/>${ c.registration.person.city }
        <br/>${ c.registration.person.state }, ${ c.registration.person.postcode }
% else:
        <br/>${ c.registration.person.city }, ${ c.registration.person.postcode }
% endif
%endif
        <br/>${ c.registration.person.country }
        </p>
        </blockquote>
%if c.registration.person.phone:
        <label><b>Phone number:</b> ${ c.registration.person.phone }</label>
	<br>
%endif
%if c.registration.person.mobile:
        <label><b>Mobile/Cell number:</b> ${ c.registration.person.mobile }</label>
	<br>
%endif
%if c.registration.person.company:
        <label><b>Company:</b> ${ c.registration.person.company }</label>
	<br>
%endif

% for category in c.product_categories:

<%  category_printed = False %>

%if not (category.name == 'Accommodation' and (len(category.products) == 0 or (len(category.products) == 1 and category.products[0].cost == 0))):

%   for product in category.products:
%       for rproduct in c.registration.products:
%           if rproduct.product == product:
%               if not category_printed:
        <h2>${ category.name.title() }</h2>
<%                category_printed = True %>
%               endif
%               if category.display == 'qty':
        <p>${ rproduct.qty } x ${ product.description } - ${ h.integer_to_currency(product.cost) }</p>
%               elif category.display == 'checkbox':
          ${ h.yesno(rproduct.qty) + ' ' + product.description |n}
%                   if product.cost != 0:
          - ${ h.integer_to_currency(product.cost) }
%                   endif
        <br />
%               else:
        <p>${ product.description } - ${ h.integer_to_currency(product.cost) }</p>
%               endif
%           endif
%       endfor
%   endfor
%   if category.name == 'Accommodation' and not (len(category.products) == 0 or (len(category.products) == 1 and category.products[0].cost == 0)):

%   elif category.name == 'Partners Programme':
%     if c.registration.partner_name:
        <label><b>Your partner's name:</b> ${ c.registration.partner_name }</label>
 	<br>
%     endif
%     if c.registration.partner_email:
        <label><b>Your partner's email address:</b> ${ c.registration.partner_email }</label>
	<br>
%     endif
%     if c.registration.partner_mobile:
        <label><b>Your partner's mobile number:</b> ${ c.registration.partner_mobile }</label>
	<br>
%     endif
%   endif
%endif
% endfor

        <h2>Further Information</h2>

        <p>${ h.yesno(c.registration.over18) |n } Over 18 year old</p>

%if c.registration.voucher_code:
        <label><b>Voucher Code:</b> ${ c.registration.voucher_code }</label>
%endif
%if c.registration.diet:
        <label><b>Dietary requirements:</b> ${ c.registration.diet }</label>
	<br>
%endif
%if c.registration.special:
        <label><b>Other special requirements:</b> ${ c.registration.special }</label>
 	<br>
%endif


	<label><b>Gender:</b> ${c.registration.gender}</label>
	<br>


          <label><label for="registration.prevlca"><b>Previous ${ c.config.get('event_generic_name') } attendance:</b></label></label>
          <p class="entries">
% for (year, desc) in c.config.get('past_confs', category='rego'):
            <br>
            ${ h.yesno(year in (c.registration.prevlca or [])) |n }
            ${ desc }
% endfor
          </p>

%if c.registration.shell:
          <label><b>Your favourite shell:</b> ${ c.registration.shell }</label>
%endif
%if c.registration.editor:
          <label><b>Your favourite editor:</b> ${ c.registration.editor }</label>
%endif
%if c.registration.distro:
          <label><b>Your favourite distro:</b> ${ c.registration.distro }</label>
%endif
%if c.registration.nick:
          <label><b>Superhero name:</b> ${ c.registration.nick }</label>
%endif
%if c.config.get('pgp_collection', category='rego') != 'no' and c.registration.keyid:
          <label><b>GnuPG/PGP Keyid:</b> ${ c.registration.keyid }</label>
%endif
%if c.registration.planetfeed:
          <label><b>Planet Feed:</b> ${ c.registration.planetfeed }</label>
%endif
% if c.registration.silly_description:
          <label><label for="registration.silly_description"><b>Description:</b> ${ c.registration.silly_description }</label>
          <p class="note">This is a randomly chosen description for your name badge</p>
% endif
          <h2>Subscriptions</h2>

          <p>${ h.yesno('linuxaustralia' in (c.registration.signup or [])) |n } I want to sign up for (free) Linux Australia membership!</p>

          <p>${ h.yesno('announce' in (c.registration.signup or [])) |n } I want to sign up to the low traffic conference announcement mailing list!</p>

          <p>${ h.yesno('chat' in (c.registration.signup or [])) |n } I want to sign up to the conference attendees mailing list!</p>
