import 'package:assignment06/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFEFF),
      appBar: MyAppBar(),
      body: HomeScreenBody(),
    );
  }
}

// here is app bar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0XFF5D7989),
      centerTitle: true,
      title: Text(
        "Contact List",
        style: TextStyle(
            color: Colors.white
        ),
      ),
    );
  }
}
// app bar ends here

// here starts body
class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return _homeScreenBuilder();
  }
}

class _homeScreenBuilder extends State<HomeScreenBody>{

  final List<User> contact = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(10),
      width: double.infinity,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            style: TextStyle(
                fontSize: 17
            ),
            decoration: InputDecoration(
                hint: Text("Enter your name", style: TextStyle(
                  fontSize: 17,
                ),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
            validator: (value) {
              return (value == null) || (value.length < 4) ? "name must have length more than 4" : null;
            },
          ),

          const SizedBox(
            height: 10,
          ),

          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                fontSize: 17
            ),
            decoration: InputDecoration(
                hint: Text("Enter your mobile number", style: TextStyle(
                  fontSize: 17,
                ),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
            validator: (value) {
              return (value == null) || (value.length != 11) ? "Invalid phone number" : null;
            },
          ),

          const SizedBox(
            height: 16,
          ),

          ElevatedButton(onPressed: (){
            setState(() {
              User user = User(name: nameController.text, phone: phoneController.text);
              contact.add(user);
            });
          },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 46),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                backgroundColor: Color(0XFF5D7989)
            ),
            child: Text("Add", style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
          ),

          const SizedBox(
            height: 30,
          ),

          // listtile, uses expanded because the column does  not allow a listView to take infinite height, so it gives error and the items does not scrolls
          Expanded(
            child: ListView(
              children: [
                ...contact.map((user) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Color(0XFFF2F2F3),
                        leading: Icon(Icons.person, color: Color(0XFF695148), size: 45,),
                        title: Text(user.name),
                        titleTextStyle: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight(600)),
                        subtitle: Text(user.phone),
                        trailing: Icon(Icons.phone, color: Colors.blue, size: 30,),
                        horizontalTitleGap: 24,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                },).toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// body ends here
