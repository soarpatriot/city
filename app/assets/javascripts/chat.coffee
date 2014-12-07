$(window).bind 'page:change', ->
   client = new Faye.Client('http://106.186.22.114:8000/faye')
   $activityArea = $("#activity-area")
   if($activityArea.length > 0)

     myScroll = new IScroll('#activity-area', {
       scrollbars: true,
       mouseWheel: true,
       interactiveScrollbars: true,
       shrinkScrollbars: 'scale',
       fadeScrollbars: true

     })
     document.addEventListener('touchmove', ((e)->
       e.preventDefault()),
       false
     )
     # $("#message-toolbar .message-input").on "blur", ->
       #window.scrollTo(0, 0)

     #$("#scroll-wrapper, #messages").on "tap", (event) ->
       #$("#message-toolbar .message-input").blur();



     myName = $("#current-user-name").val()
     myAvatar = $("#current-user-avatar").val()
     userId = $("#current-user-id").val()


     client.handshake ->
         console.log(client._clientId)
         client.subscribe '/channels/'+client._clientId,   (messages) ->
               
               #$("#scroller").append(message_temp({name:message.name, avatar:message.avatar, text:message.text}))
     , this

     publication = client.publish('/channels/'+userId, {id:userId})
     publication.then ->
               console.log("success")
           , (error)->
               console.log("fail")
     subscription = client.subscribe '/channels/'+userId, (messages) ->
         _.each(messages, (message)->


           #m = message.parseJSON()
           m = eval ("(" + message + ")");
           console.log("message: "+m);
           console.log("message: "+m["name"]);
           console.log("message: "+m.avatar);
           console.log("message: "+m.text);
           console.log("creaate_at: "+m.created_at);
           $("#scroller").append(message_temp({name:m["name"], avatar:m.avatar, text:m.text, created_at: m.created_at}))
           myScroll.refresh()
           myScroll.scrollToElement('#scroller div.message:last-child')
         )
          #console.log(JSON.stringify(message))
     sampleHtml = """
                            <div class="page toolbar-fixed">
                                <div class="page-content messages-content">
                                  <div class="messages messages-auto-layout">
                                    <div class="messages-date">Sunday, Feb 9 <span>12:58</span></div>
                                    <div class="message message-sent">
                                      <div class="message-text">Hello</div>
                                    </div>
                                  </div>
                                </div>
                             </div>
                         """

     messageHtml = """

                    <div class="media message">
                       <h5 class="media-heading text-center"><%= name %>    <span class="text-muted">
                             <small><%= created_at %></small></span>
                       </h5>
                       <div class="user-avatar">
                            <a class="media-left pull-left" href="#">
                                  <img class='thumbnail-circle' src='<%= avatar %>'>
                            </a>
                       </div>

                      <div class="media-body ">

                         <div class="message-text">
                             <%= text %>
                          </div>
                      </div>
                    </div>

                   """
     message_temp =  _.template(messageHtml);
     subscription = client.subscribe '/chat',   (message) ->
       $("#scroller").append(message_temp({name:message.name, avatar:message.avatar, text:message.text, created_at: message.created_at}))
       myScroll.refresh()
       myScroll.scrollToElement('#scroller div.message:last-child')


     $("#send-message-btn").click ->

         text = $("#send-message-input").val()
         isMessageBlank =  _.str.isBlank(text)
         if(!isMessageBlank)
           $("#send-message-input").val("")
           sendTime = moment().format("YYYY-MM-DD, h:mm:ss")
           publication = client.publish('/chat', {name:myName, avatar: myAvatar, text: text, created_at:sendTime})
           publication.then ->
             myScroll.scrollToElement('#scroller div.message:last-child')
           , (error)->
             myScroll.scrollToElement('#scroller div.message:last-child')



