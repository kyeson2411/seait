import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:canillok_b4/dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: LoginScreenHome(),
   );
  }

}
class LoginScreenHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),


      ),
      body: Column(
  children: [
        Text('Welcome Users!',style: TextStyle(color: Colors.blue, fontSize: 30,)  ),
        SizedBox(height: 20,),
        Text('Please login to Continue',style: TextStyle(color: Colors.blue, fontSize: 30,)),
         SizedBox(
           height: MediaQuery.of(context).size.height*0.6,
           width: MediaQuery.of(context).size.width*0.9,
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 2

                        ),

                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'images/misa.webp',
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',  
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),


                    ),
                    ),
                      SizedBox(height: 20,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),


                      ),
                    ),
                SizedBox(height: 1.8,),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)
                        =>Dashboard()));
                      }, child: Text('Login'), style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),),

                    ),


  ],
)
                ),
              ),

            ),


    Row
      (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have an Account?"),
        TextButton(onPressed: (){
          AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
          desc: 'Wanna fuck?',
          btnOkOnPress: (){},
          btnCancelOnPress: (){},
        ).show();}, child: Text('Sign Up')),



        Text("Can't Login?"),
        TextButton(onPressed: (){AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
          desc: 'forgot to fuck?',
          btnOkOnPress: (){},
          btnCancelOnPress: (){},
        ).show();}, child: Text('Forgot Password')),



      ],

    ),
    
  ],

    )

    );
  }
}


