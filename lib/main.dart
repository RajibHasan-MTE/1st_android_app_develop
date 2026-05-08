import 'package:flutter/material.dart';

void main() {
  runApp(ListGridApp());
}

class ListGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List & Grid Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items =
  List.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists & Grids Playground"),
        centerTitle: true,
      ),

      body: ListView(
        padding: EdgeInsets.all(10),
        children: [

          // ================= LISTVIEW BUILDER =================
          sectionTitle("1. ListView.builder"),

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.all(8),
                  color: Colors.blue[100],
                  child: Center(
                    child: Text(items[index]),
                  ),
                );
              },
            ),
          ),

          divider(),

          // ================= LISTVIEW + LISTTILE =================
          sectionTitle("2. ListView + ListTile"),

          ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(items[index]),
                subtitle: Text("Subtitle for ${items[index]}"),
                trailing: Icon(Icons.arrow_forward_ios),
                tileColor: index % 2 == 0
                    ? Colors.grey[200]
                    : Colors.white,
                dense: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Clicked ${items[index]}")),
                  );
                },
              );
            },
          ),

          divider(),

          // ================= LISTVIEW SEPARATED =================
          sectionTitle("3. ListView.separated"),

          ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                Divider(color: Colors.black),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Separated Item $index"),
              );
            },
          ),

          divider(),

          // ================= GRIDVIEW COUNT =================
          sectionTitle("4. GridView.count"),

          SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.orange[200],
                  child: Center(child: Text("Grid $index")),
                );
              }),
            ),
          ),

          divider(),

          // ================= GRIDVIEW BUILDER =================
          sectionTitle("5. GridView.builder"),

          GridView.builder(
            itemCount: 12,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),

            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Grid Clicked $index")),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Item $index",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  // ================= HELPER UI =================

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(thickness: 2);
  }
}