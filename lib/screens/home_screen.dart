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
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(10),
      width: double.infinity,
      child: Column(
        children: [
          TextFormField(
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
          SizedBox(
            height: 10,
          ),
          TextFormField(
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
          SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: (){},
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
          SizedBox(
            height: 30,
          ),
          // listtile
          ListTile(
            tileColor: Color(0XFFF2F2F3),
            leading: Icon(Icons.person, color: Color(0XFF695148), size: 45,),
            title: Text("Hasib"),
            titleTextStyle: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight(600)),
            subtitle: Text("01521716060"),
            trailing: Icon(Icons.phone, color: Colors.blue, size: 30,),
            horizontalTitleGap: 24,
          )
        ],
      ),
    );
  }
}
