var myApp = new Framework7();

var $$ = Dom7;

// Conversation flag
var conversationStarted = false;

// Handle message
$$('.messagebar .link').on('click', function () {
  var textarea = $$('.messagebar textarea');
  // Message text
  var messageText = textarea.val().trim();
  // Exit if empy message
  if (messageText.length === 0) return;

  // Empty textarea
  textarea.val('').trigger('change');

  // Random message type
  var messageType = (['sent', 'received'])[Math.round(Math.random())];

  // Avatar and name for received message
  var avatar, name;
  if(messageType === 'received') {
    avatar = 'http://lorempixel.com/output/people-q-c-100-100-9.jpg';
    name = 'Kate';
  }
  // Add message
  myApp.addMessage({
    // Message text
    text: messageText,
    // Random message type
    type: messageType,
    // Avatar and name:
    avatar: avatar,
    name: name,
    // Day
    day: !conversationStarted ? 'Today' : false,
    time: !conversationStarted ? (new Date()).getHours() + ':' + (new Date()).getMinutes() : false
  })