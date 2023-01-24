import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chatsWidgets extends StatelessWidget {
  const chatsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Center(child: Text("Something went wrong....")),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading...."));
          }
          if (snapshot.hasData) {
            // ignore: prefer_const_constructors
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: true, // it will remain during scroll

                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Chats'),
                  ),
                ),
                /************************************************************************************************************************************************* */
                // Container(
                //   color: Colors.white,
                //   child: SliverList(
                //     key: centerKey,
                //     delegate: SliverChildListDelegate(
                //         snapshot.data!.docs.map((var data) {
                //       Map<String, dynamic> data1 = data.data();
                //       return ListTile(
                //         title: Text(data1['title']),
                //       );
                //     }).toList()),
                //   ),
                // )
                /************************************************************************************************************************************************* */
              ],
            );
          }
          return Container();
        });
  }
}
