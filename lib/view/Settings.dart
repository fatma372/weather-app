import 'package:flutter/material.dart';
import 'package:mobilecomputing/view/SearchPage.dart';

class Settings extends StatefulWidget {
   Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 bool ShowWeather=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: Text("Settings",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text("Units",style: TextStyle(color: Colors.black54),),  
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height*.4 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(245, 238, 238, 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("Temperature",style: TextStyle(color: Colors.black,fontSize: 18)),
                        SizedBox(height: 5,),
                      Text("celsius",style: TextStyle(color: Colors.amber,fontSize: 14)),
                      Divider(thickness: 2,),
                        SizedBox(height: 10,),
                      Text("wind",style: TextStyle(color: Colors.black,fontSize: 18)),
                        SizedBox(height: 5,),
                      Text("Kilometers per Hour (km/h)",style: TextStyle(color: Colors.amber,fontSize: 14)),
                      Divider(thickness: 2,),
                        SizedBox(height: 10,),
                        Text("Air pressure",style: TextStyle(color: Colors.black,fontSize: 18)),
                          SizedBox(height: 5,),
                        Text("Hectopascals (hPa)",style: TextStyle(color: Colors.amber,fontSize: 14)),
                        Divider(thickness: 2,),
                               SizedBox(height: 10,),
                        Text("visibility",style: TextStyle(color: Colors.black,fontSize: 18)),
                               SizedBox(height: 5,),
                         Text("Kilometers (Km)",style: TextStyle(color: Colors.amber,fontSize: 14)),
                                SizedBox(height: 10,),
                    ],
                  ),
                
                ),
              ),
            ) ,
            SizedBox(height: 20,),
             Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(245, 238, 238, 1)
                ),
                child: InkWell(
                  onTap:(){
               
                            Navigator.push(context,MaterialPageRoute(
                           builder: (context) =>  SearchPage(),
                            ));},
                      
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("About weather",style: TextStyle(color: Colors.black,fontSize: 18)),
                      SizedBox(width: 150,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                ),
             )
          ],
        ),
);
}
}
