<%page args="editing" />
 <div class="container-fluid">
    <div class="row form-group">
      <label for="proposaltitle" class="col-sm-2 control-label">Title</label>
      <div class="input-group">
% if editing:
        <input type="text" id="proposaltitle" class="form-control" placeholder="${ c.title }" name="proposal.title" required />
% else:
        <input type="text" id="proposaltitle" class="form-control" placeholder="Talk title" name="proposal.title" required/>
%endif
        <span class="glyphicon form-control-feedback" ></span>
        <span class="input-group-addon" id="basic-addon2">required</span>

      </div>
    </div>

    <div class="row form-group">
      <label for="proposaltype" class="col-sm-2 control-label">The type of your proposal. </label>
      <div class="col-sm-10">
% for st in c.proposal_types:
<%
   if st.name == 'Miniconf':
       continue
%>
    <div class="radio">
      <label>
        <input type="radio" name="proposal.type" id="proposal.type_${ st.id }" value="${ st.id }">
        ${ st.name }
      </label>
    </div>
% endfor
    </div>
    </div>
    
    <div class="row form-group"> 
      <div class="textarea">
        <label for="proposalabstract" class="col-sm-2 control-label">Public Abstract</label>
        <div class="col-sm-10">This will appear in the conference programme. You will have an opportunity to update it once the proposal is accepted, but it should reasonably reflect what you will be presenting, and in any case it will appear as-is on the website in the draft programme. Up to about 300 words.</P>
          <p>
          <div class="input-group">
              <textarea class="form-control" id="proposalabstract" placeholder="public abstract" name="proposal.abstract" rows="10" cols="80" required></textarea>
              <span class="input-group-addon" id="basic-addon2">required</span>
          </div>
        </div>
      </div>
    </div>

    <div class="row form-group"> 
      <div class="textarea">
        <label for="proposalpriveate_abstract" class="col-sm-2 control-label">Private Abstract</label>
        <div class="col-sm-10">
          <p>This will only be shown to organisers and reviewers. You should provide any details about your proposal that you don't want to be public here.</p>
          <p>Please fill out an approximate timeline for the content of your presentation to help the programme committee understand the details of your proposal. 
             You are welcome to use a non-standard talk structure instead, however many authors will find this basic template helpful:</p>
          <ul style="none">
            <li>0 - 5 minutes: content
 	    <li>5 - 10 minutes: content 
	    <li>10 - 15 minutes: content
	    <li>15 - 20 minutes: content
	    <li>20 - 25 minutes: content
	    <li>25 - 30 minutes: questions
          </ul>  
          <div class="input-group">
            <textarea class="form-control" id="proposalprivate_abstract" placeholder="private abstract" name="proposal.private_abstract" rows="10" cols="80" required></textarea>
            <span class="input-group-addon" id="basic-addon2">required</span>
          </div>
        </div>
      </div>
    </div>

    <div class="row form-group"> 
      <div class="textarea">
        <label for="proposaltechnical_requirements" class="col-sm-2 control-label">Technical Requirements</label>
        <div class="col-sm-10">
          <p>Speakers will be provided with: Internet access, power, projector, audio.  If you require anything in addition, please list your technical requirements here.  Such as: a static IP address, A/V equipment or will be demonstrating security-related techniques on the conference network.</p>
          <div class="input-group">
              <textarea class="form-control" id="proposalprivate_requirements" placeholder="technical requirements" name="proposal.technical_requirements" rows="10" cols="80"></textarea>
          </div>
        </div>
      </div>
    </div>

    <div class="row form-group">
      <label for="proposalaudience" class="col-sm-2 control-label">Target audience</label>
      <div class="col-sm-10">
	% for at in c.target_audiences:
        <div class="input-group radio">
          <label>
            <input type="radio" name="proposal.audience" id="proposal.audience_${ at.id }" value="${ at.id }">
              ${ at.name }
            </label>
          </div>
	  % endfor
        </div>
      </div>

      <div class="row form-group">
	<label for="eventtargets" class="col-sm-2 control-label">Event Targets</label>
	<div class="col-sm-10" >
	  <div class="input-group">
	  <!-- event targets should go here -->
	  % for pet in c.proposal_event_targets:
           <div class="checkbox">
	    <label>
              % if c.proposal and unicode(pet.id) not in c.proposal.event_targets:
              <input type="checkbox" name="proposal.event_targets" id="proposal_event_target_${pet.id}" value="${pet.id}"/>
	      % else:
              <input type="checkbox" name="proposal.event_targets" id="proposal_event_target_${pet.id}" value="${pet.id}"  checked/> 
	      % endif
              ${pet.name} 
            </label>
	   </div>
	  % endfor
          </div>
        </div>
      </div>

    <div class="row form-group">
      <label for="proposalproject" class="col-sm-2 control-label">Project</label>
      <div class="col-sm-10">
        <input type="text" id="proposalproject" class="form-control" placeholder="The name of the project you will be talking about" name="proposal.project" />
      </div>
    </div>

    <div class="row form-group">
      <label for="proposalurl" class="col-sm-2 control-label">Project URL (Optional)</label>
      <div class="col-sm-10">
        <input type="text" id="proposalurl" class="form-control" placeholder="www" name="proposal.url" />
      </div>
    </div>

    <div class="row form-group">
      <label for="proposalabstract_video_url" class="col-sm-2 control-label">Project Video (Optional)</label>
      <div class="col-sm-10">
        <input type="text" id="proposalabstract_video_url" class="form-control" placeholder="www" name="proposal.abstract_video_url" />
      </div>
    </div>


    <div class="row form-group">
      <label for="attachment" class="col-sm-2 control-label">Attachments</label>
      <div class="col-sm-10">
% if not editing:
        <input type="file" id="attachment" name="attachment">
        <p class="help-block">Any additional information, image, etc. You can attach and delete more files later by editing this submission.</p>
% else:
% if len(c.proposal.attachments) > 0:
    <table class="table sortable">
      <tr>
        <th>Filename</th>
        <th>Size</th>
        <th>Date uploaded</th>
        <th>&nbsp;</th>
      </tr>
% for a in c.proposal.attachments:
      <tr>
        <td> ${ h.link_to(h.util.html_escape(a.filename), url=h.url_for(controller='attachment', action='view', id=a.id)) }</td>
        <td>
%if len(a.content) >= (1024*1024):
${ round(len(a.content)/1024.0/1024.0, 1) } MB
%elif len(a.content) >= (1024):
${ round(len(a.content)/1024.0, 1) } kB
%else:
${ len(a.content) } B
%endif
        </td>
        <td>  ${ a.creation_timestamp.strftime("%Y-%m-%d %H:%M") } </td>
        <td>  ${ h.link_to('delete', url=h.url_for(controller='attachment', action='delete', id=a.id)) } </td>
      <tr>
% endfor
    </table>
% endif
    <a class="btn btn-default" href="./attach">Attach multiple files</a>
    <p class="help-block">Making changes to attachments from this screen will force you to leave this form. Either open the attachment links in a new tab, or complete the changes <b>after</b> submitting this form.</p>
% endif
      </div>
    </div>

    <div class="row">
      <h2>Financial Assistance</h2>
      <p>Speakers will be required to register for the conference,
but will be offered the Early Bird registration rate. We request that speakers pay for full registration if they are able.</p>

      <p><a href="${ h.url_for("/about/financial_assistance") }">Financial Assistance</a> <em>may</em> be available in circumstances where necessary.
    </div>

<!-- About the speaker -->
    <div class="row">
      <h2>About yourself</h2>

      <p><em>Note: These settings are common for all your proposals: presentations and tutorials.</em></p>

      <p>If two or more people are presenting together, this information should for the primary speaker; mention the other speakers in the Abstract, eg. "(with Bob Vaxhacker and Eve Duo)".</p>
    </div>

    <div class="row form-group"> 
      <label for="name" class="col-sm-2 control-label">Speakers name</label>
      ${ h.hidden('person_to_edit', value=c.person.id) }
      <div class="input-group col-sm-10">
        <input class="form-control" id="name" readonly name="name" required></input>
        <span class="input-group-addon" id="basic-addon2">See user profile</span>
      </div>
    </div>

    <div class="row form-group"> 
      <label for="name" class="col-sm-2 control-label">Speakers phone</label>
      <div class="input-group col-sm-10u">
      <div class="input-group">
        <input class="form-control" id="personphone" name="person.phone" required></input>
        <span class="input-group-addon" id="basic-addon2">required</span>
        ${h.hidden('person.mobile')}
        ${h.hidden('proposal.travel_assistance', value="-1")}
        ${h.hidden('proposal.accommodation_assistance', value="-1")}
      </div>
      <p class="help-block">The conference team will need this to contact you during the conference week. If you don't have one, or do not wish to provide it, then enter NONE in this field</p>
      </div>
    </div>

    <div class="row form-group"> 
      <label for="personurl" class="col-sm-2 control-label">Speakers homepage</label>
      <div class="input-group col-sm-10">
        <input type="text" class="form-control" id="personurl" name="person.url" placeholder="www" ></input>
      </div>
    </div>

    <div class="row form-group"> 
      <div class="textarea">
        <label for="personbio" class="col-sm-2 control-label">Biography</label>
        <div class="input-group col-sm-10">
            <textarea class="form-control" id="personbio" placeholder="This will appear on the conference website and in the programme.  Please write in the third person, eg Alice is a KVM hacker..., 150-200 words." name="person.bio" rows="10" cols="80" required></textarea>
            <span class="input-group-addon" id="basic-addon2">required</span>
        </div>
      </div>
    </div>

    <div class="row form-group"> 
      <div class="textarea">
        <label for="personexperience" class="col-sm-2 control-label">Speaking Experience</label>
        <div class="input-group col-sm-10">
            <textarea class="form-control" id="personexperience" placeholder="Have you had any experience presenting elsewhere? If so, we'd like to know. Anything you put here will only be seen by the organisers and reviewers; use it to convince them why they should accept your proposal." name="person.experience" rows="10" cols="80" required></textarea>
            <span class="input-group-addon" id="basic-addon2">required</span>
        </div>
      </div>
    </div>
      
      
    <div class="input-group">
      <div class="checkbox">
      <label>
        <input type="checkbox" id="proposalvideo_release" name="proposal.video_release">
        I allow ${ c.config.get("event_parent_organisation") } to release any recordings of my presentations, tutorials and minconfs under the <a href="${ c.config.get("media_license_url") }">${ c.config.get("media_license_name") }</a>
      </label>
      </div>
    </div>

    <div class="input-group">
      <div class="checkbox">
      <label>
        <input type="checkbox" id="proposalslides_release" name="proposal.slides_release">
        I allow ${ c.config.get("event_parent_organisation") } to release any other material (such as slides) from my presentations, tutorials and minconfs under the <a href="${ c.config.get("media_license_url") }">${ c.config.get("media_license_name") }</a>
      </label>
      </div>
    </div>

    <hr />

    <p>The special events are a part of the call for proposals. The programme committee and special event organisers reserve the right to include submissions in any of the events selected by the author to best support the conference.</p>

  </div>
