import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:intl/intl.dart';
import 'package:tracker_admin/models/user_barcode.dart';


class BarcodesPage extends StatelessWidget {
  const BarcodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersQuery = FirebaseDatabase.instance.ref('barcodes').orderByChild('name');
    return FirebaseDatabaseQueryBuilder(
      query: usersQuery,
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }
      
        return ListView.builder(
          itemBuilder: ((context, index) {
            final barcodes = UserBarcode.fromMap(snapshot.docs[index].value as Map);
            return ListTile(
              title: Row(
                children: [
                  Text(barcodes.userName ?? "", style: Theme.of(context).textTheme.bodyLarge),
                  Text(" - ${barcodes.userEmail}", style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Barcode data : ${barcodes.barcode}",style: Theme.of(context).textTheme.caption,),
                  if(barcodes.datetime != null)
                  Text(DateFormat.yMEd().add_jms().format(barcodes.datetime!))
                ],
              ),
            );
          }),
          itemCount: snapshot.docs.length,
        );
      },
    );
  }
}
