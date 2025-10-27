import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Application entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      //color: Color.blue,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("ROBOTICS WITH RAJIB", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        titleSpacing: 0,
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){MySnackBar("I am Comments", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("I am Search", context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MySnackBar("I am Setting", context);}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){MySnackBar("I am email", context);}, icon: Icon(Icons.email)),
          IconButton(onPressed: (){MySnackBar("Facebook profile", context);}, icon: Icon(Icons.facebook)),
        ],
      ),

      /***************************************** Floating Action Button **************************************
       * Floating Action button is button that is placed at the right bottom corner by default.
       * Floating Action Button is an Icon button tha floats over ther context of the screen at a fixed placed.
       ********************************************************************************************************/
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.green,
        onPressed: (){
          MySnackBar("I am floating action button", context);
        },
        child: Icon(Icons.add),
      ),

      /**************************************** Bottom Navigation Bar *******************************************
       * Bottom Navigation Bar is a bar that is placed at the bottom of the screen.
       * Bottom Navigation Bar is used to navigate between different screens.
       * Manu at the bottom of the Scaffold.
       * We have seen this Navigation bar in most of the application.
       * 1st call bottomNavigationBar properties then call BottomNavigationBarItem class
       * then object: items
       * onTap: property is used to navigate between different screens.
       **********************************************************************************************************/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        //elevation: 0,
        //backgroundColor: Colors.amber,
        //selectedItemColor: Colors.green,
        //unselectedItemColor: Colors.black,
        //showUnselectedLabels: true,
        //showSelectedLabels: true,
        //type: BottomNavigationBarType.fixed,
        //onTap: (index){
        //MySnackBar("I am index $index", context);
        // },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index){
          if(index == 0){
            MySnackBar("I am home bottom manu", context);
          }
          if(index == 1){
            MySnackBar("I am contact bottom manu", context);
          }
          if(index == 2){
            MySnackBar("I am profile botton manu", context);
          }
        },
      ),

      /********************************** Navigation drawer *************************************************
       * Navigation drawer is a drawer that is placed on the left side of the screen.
       * Navigation drawer is used to navigate between different screens.
       * Drawer is used to navigate between different screens.
       * drawer has two parts: header and body.
       * header is used to display the logo and the name of the app.
       * body is used to display the menu items.
       * title: property is used to display the title of the menu item.
       * leading: property is used to display the icon of the menu item.
       * trailing: property is used to display the icon of the menu item.
       * onTap: property is used to navigate between different screens.
       *
       ******************************************************************************************************/
      //endDrawer: Drawer(
      endDrawer: Drawer(
        child: ListView(
          children: [
            /*
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                  accountName: Text("Rajib Hasasn", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  accountEmail: Text("rajibhasan.mte@gmail.com"),
                  currentAccountPicture: Image.network("https://avatars.githubusercontent.com/u/207505410?s=400&u=2ca2167fb01cf553acca36a0ee9ce7131deea653&v=4", width: 200, height: 200)
              ),
            ),
             */
            UserAccountsDrawerHeader(
              accountName: const Text("Rajib Hasan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              accountEmail: const Text("Studies BSc in Mechatronics engineering", style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/207505410?s=400&u=2ca2167fb01cf553acca36a0ee9ce7131deea653&v=4",
                ),
              ),
            ),

            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Home", context);
                }
            ),
            ListTile(
                title: Text("Email"),
                leading: Icon(Icons.email),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Email", context);
                }
            ),
            ListTile(
                title: Text("Phone"),
                leading: Icon(Icons.phone),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Phone", context);
                }
            ),

          ],
        ),


      ),
      drawer: Drawer(
        child: ListView(
          children: [
            /*
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                  accountName: Text("Rajib Hasasn", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  accountEmail: Text("rajibhasan.mte@gmail.com"),
                  currentAccountPicture: Image.network("https://avatars.githubusercontent.com/u/207505410?s=400&u=2ca2167fb01cf553acca36a0ee9ce7131deea653&v=4", width: 200, height: 200)
              ),
            ),
             */
            UserAccountsDrawerHeader(
              accountName: const Text("Rajib Hasan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              accountEmail: const Text("Studies BSc in Mechatronics engineering", style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/207505410?s=400&u=2ca2167fb01cf553acca36a0ee9ce7131deea653&v=4",
                ),
              ),
            ),

            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Home", context);
                }
            ),
            ListTile(
                title: Text("Email"),
                leading: Icon(Icons.email),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Email", context);
                }
            ),
            ListTile(
                title: Text("Phone"),
                leading: Icon(Icons.phone),
                //trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  MySnackBar("Phone", context);
                }
            ),

          ],
        ),


      ),
      body: Center(
        //child: Text("Welcome in Inventory App"),
        //child: Image.network("https://pal-robotics.com/wp-content/uploads/2025/01/TIAGoPro_Sided1_Mobile-Manipulator_PAL-Robotics-921x1024.webp"),
        child: Image.network("https://pal-robotics.com/wp-content/uploads/2025/01/Kangaroo-Pro-frontal-image-PAL-Robotics-legged-humanoid-scaled-e1760631086520-703x1024.png"),
      ),

    );
  }
}
