import 'package:cantwait28/items_models/items_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsRepository {
  Stream<List<ItemsModels>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemsModels(
          id: doc.id,
          title: doc['title'],
          imageUrl: doc['image_url'],
          dateTime: (doc['release_date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }



   Future<ItemsModels> get({required String id}) async {
    final doc = await FirebaseFirestore.instance.collection('items').doc(id).get();
    return ItemsModels(
          id: doc.id,
          title: doc['title'],
          imageUrl: doc['image_url'],
          dateTime: (doc['release_date'] as Timestamp).toDate(),
        );
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
    
  }

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    {
      await FirebaseFirestore.instance.collection('items').add(
        {
          'title': title,
          'image_url': imageURL,
          'release_date': releaseDate,
        },
      );
    }
  }
}
