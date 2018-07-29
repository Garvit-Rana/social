console.log("server....");
const http=require('http');

const hostname='localhost';
const port='8000';
console.log('fetching port...');
const server=http.createServer().listen(port,hostname);

console.log('yay! chat server is up and running on '+hostname+':'+port);

var socketList=require('socket.io').listen(server);

socketList.sockets.on('connection',function(sock){
console.log('new connection');

sock.on('disconnect',function(){
console.log('disconnected');

})
//console.log(sock);
sock.on('join_chat_room', function(data){
console.log('chat room joining',data);

sock.join(data.chatroom_name);

socketList.in(data.chatroom_name).emit('new_user_joined',data);


});
sock.on('send_message',function(data){
socketList.in(data.chatroom_name).emit('receive_message',data);

});

});

