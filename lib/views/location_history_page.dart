import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:intl/intl.dart';
import 'package:tracker_admin/models/user_location.dart';

class LocationHistoryPage extends StatelessWidget {
  const LocationHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersQuery =
        FirebaseDatabase.instance.ref('locations').orderByChild('name');
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
            final userLocation = UserLocation.fromMap(snapshot.docs[index].value as Map);
            return ListTile(
              title: Row(
                children: [
                  Text(userLocation.userName ?? "", style: Theme.of(context).textTheme.bodyLarge),
                  Text(" - ${userLocation.userEmail}", style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("latitude : ${userLocation.latitude} longitude : ${userLocation.longitude}",style: Theme.of(context).textTheme.caption,),
                  if(userLocation.datetime != null)
                  Text(DateFormat.yMEd().add_jms().format(userLocation.datetime!))
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
