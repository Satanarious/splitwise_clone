import 'package:flutter/material.dart';
import '../widgets/group_list_widget.dart';
import '../widgets/my_flutter_app_icons.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        fixedColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.grey,
            ),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              color: Colors.grey,
            ),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo,
              color: Colors.grey,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin_sharp,
              color: Colors.grey,
            ),
            label: 'Account',
          ),
        ],
      ),
      floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
              color: Colors.green,
              height: 50,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.receipt,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Add Expenses',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ))),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(MyFlutterApp.add_friend),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              const Text(
                'Overall, you owe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 3),
              const Text(
                '\$12.5',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: height * 0.4,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: ((context, index) {
                return const GroupListWidget(
                  image:
                      'https://media.istockphoto.com/photos/multi-ethnic-guys-and-girls-taking-selfie-outdoors-with-backlight-picture-id1368965646?b=1&k=20&m=1368965646&s=170667a&w=0&h=9DO-7OKgwO8q7pzwNIb3aq2urlw3DNTmpKQyvvNDWgY=',
                  groupName: 'Group Name',
                  debtPeek: [
                    {'type': DebtType.owe, 'user': 'Aman', 'amount': 32.5},
                    {'type': DebtType.owe, 'user': 'Karan', 'amount': 32.5}
                  ],
                  debtType: DebtType.owe,
                  amount: 12.5,
                );
              }),
            ),
          ),
          const GroupListWidget(
            image:
                'http://hivesociety.weebly.com/uploads/8/4/5/6/8456920/6694465.png',
            groupName: 'Non-Group Expenses',
            debtType: DebtType.settled,
            amount: 12.5,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your other settled up groups will\nshow under here',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 2.0, color: Colors.green),
            ),
            child: const Text('Show 1 settled-up group'),
          )
        ]),
      ),
    );
  }
}
