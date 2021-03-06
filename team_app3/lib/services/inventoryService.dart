import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/inventories.dart';

class FetchInventoryService {
  @override
  Future<List<Inventory>> fetchInventories() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('million_inventory').get();

    Inventories inventories = Inventories.fromSnapshot(snapshot);
    return inventories.inventories;
  }

  final invenRef = FirebaseFirestore.instance
      .collection('million_inventory')
      .withConverter<Inventory>(
          fromFirestore: (snapshot, _) => Inventory.fromJson(snapshot.data()!),
          toFirestore: (inventory, _) => inventory.toJson());

  addInventory(String lottoNum, int qty) async {
    await invenRef.add(
      Inventory(lottoNum, qty),
    );
  }

  updateInventory(String lottoNum, int qty) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('million_inventory')
        .where('lottoNum', isEqualTo: lottoNum)
        .get();
    print("lottoNum=================");
    print(lottoNum);
    print(qty);

    Inventory currentQty =
        await Inventories.fromSnapshot(snapshot).inventories[0];

    await snapshot.docs[0].reference
        .update({'qtyLotto': currentQty.qtyLotto - qty});
  }
}
