import 'package:canillok_b4/loginscreen.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboardhome(),
    );
  }
}

class Dashboardhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height*0.30,

           child:  DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,

                    ),
                    Text('Kenneth A. Canillo'),
                    Text('thefox919292@gmail.com'),
                  ],
                ),
            ),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.power_settings_new),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)
                =>LoginScreen()));

              }

            )
          ],
        ),

      ),

      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.black54,
        flexibleSpace: Center(
          child: Text(
            'Lab Examination',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Card(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'images/misa.webp',
                  ),
                ),
                SizedBox(height: 30),
                Text('Kenneth A. Canillo'),
                Text('Bachelor of Science in Information Technology') ,
                Text('at') ,
                Text('South East Asian Institute of Technology, Inc.  ') ,
                Text('Block 4 2nd Year') ,
                SizedBox(height: 20),
                Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        print('I am fond of movies as well as japanese type animation as you might also call anime i read specific books that peeks my interest but i mainly read visual stories');

                      },
                      child: Text('Informations'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        print('I have been pursuing BSIT in cause i strike to work in an environment that will not keep my skills at what it is initially at so that i can keep on growing along the project that i will build');
                      },
                      child: Text('Goals'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
