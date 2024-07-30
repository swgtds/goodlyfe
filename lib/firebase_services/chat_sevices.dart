import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodlyfe/models/message.dart';

class ChatService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future <void> sendMessage(String receiverId, String message) async{
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      timestamp: timestamp,
      message: message,
    );

    List<String> ids =[currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messeges').add(newMessage.toMap());

    Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
      List<String> ids = [userId, otherUserId];
      ids.sort();
      String chatRoomId = ids.join("_");
      return _firestore.collection('chat_rooms').doc
      (chatRoomId).collection('messeges').orderBy
      ('timestamp', descending: false).snapshots();
    }
  }

  // Add your chat service methods here
}

