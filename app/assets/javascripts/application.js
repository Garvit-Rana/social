// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


window.addEventListener('load',function(){


var userEmail=$('#current_user_email').html();
if (userEmail){

	var socket= io.connect('http://localhost:8000');
       
    socket.on('connect',function(){
       console.log('handshake completed connected to node');     
    //console.log(socket);

    socket.emit('join_chat_room',{
      'chatroom_name': 'android_room',
      'user_email': userEmail

    });
    socket.on('new_user_joined',function(data){

    	console.log('new user :',data);
    });
    $('#send-message').unbind('click');
    $('#send-message').click(function(){
       
      let msg=$('#chat-message-input').val();  
      if (msg!=''){

      	socket.emit('send_message',{
         'message':msg,
         'user_email':userEmail,
         'chatroom_name':'android_room'   


      	});
      
       $('#chat-message-input').val('');
      } 
      


    });
    socket.on('receive_message',function(data){
     console.log(data);
       var messageType='self-message';

         if (data.user_email!=userEmail){
    	messageType='other-message';
    
    } 

     var newMessage=$('<li>',{
       'class':messageType
     });

    var messageText=$('<span>',{
    	'html':data.message+'<br>'+data.user_email
    });
    newMessage.append(messageText);
    $('#chat-messages-list').append(newMessage);


    });  




    });


}


});