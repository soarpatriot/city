$(window).bind 'page:change', ->
   client = new Faye.Client('http://localhost:8000/faye')

   $activityArea = $("#activity-area")

   if($activityArea)
     myName = $("#current-user-name").val()
     myAvatar = $("#current-user-avatar").val()
     console.log(myName)
     console.log(myAvatar)

     messageHtml = """

                            <div class="media">
                              <a class="media-left pull-left" href="#">
                                 <img class='thumbnail-circle' src='<%= avatar %>'>
                              </a>
                              <div class="media-body">
                                <h5 class="media-heading"><%= name %>    <span class="text-muted">
                                     <small>2014-11-11 12:22:40</small></span>
                                </h5>
                                <%= text %>
                              </div>
                            </div>

                           """
     message_temp =  _.template(messageHtml);
     subscription = client.subscribe '/chat',   (message) ->
         $activityArea.append(message_temp({name:message.name, avatar:message.avatar, text:message.text}))
         # console.log(message_temp({text:message.text}))


     #publication = client.publish('/chat', {text: 'Hi there'})

     #publication.then ->
        #alert('Message received by server!')
     #, (error) ->
        #alert('There was a problem: ' + error.message)
     $("#send-message-btn").click ->
         text = $("#send-message-input").val()
         $("#send-message-input").val("")
         publication = client.publish('/chat', {name:myName, avatar: myAvatar, text: text})



