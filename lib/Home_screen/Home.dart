import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart ' ;
import 'package:weather_forecast/InformationApi_fetch_from_weather/WeatherApi_website.dart';








class Home1 extends StatefulWidget  {
  const Home1({super.key});
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1>  {


  String condition="Loading";
  String location ="";
  String temparature="";
  String humidity="";
  String windSpeed="";
  String conntry="";


  Future<void>  loadweatherInfo(String location) async {
    GetInformation getInfo = GetInformation(location);
    await getInfo.getData();
    print(" fellslike: ${getInfo.fellsLikeTemp} ,  temp: ${getInfo.temp } , country: ${getInfo.country},  condition: ${getInfo.condition}, pressure: ${getInfo.pressure_mb},huminidity: ${getInfo.humidity},wind: ${getInfo.wind_kph},"  );
    // print(getInfo.location);
    condition=getInfo.condition;
    temparature=getInfo.temp;
    humidity=getInfo.humidity;
    windSpeed=getInfo.wind_kph;
    conntry=getInfo.country;
    setState(() { });
  }



  @override
 void initState()   {
    // TODO: implement initState
    super.initState();
    print("Init");
  }

  @override
  Future<void> setState(VoidCallback fn)   async {
    // TODO: implement setState
    super.setState(fn);

print("set state");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dis:$location");
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text("Home") ),
      resizeToAvoidBottomInset: false,
      body:  SafeArea(
   child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors:  [
                Color(0xFF8AB6F9),
                Color(0xFFCADCFC),
          ],

        )
      ),
     child: Column(
     children: <Widget>[

      //SearchBar Suru---------------------------------------------------------------------------------
      Container(

         width: MediaQuery.of(context).size.width * .9 ,
         height: MediaQuery.of(context).size.height * .08,
        // color: Colors.amber,
        margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black26),
        child:   Padding(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             GestureDetector(
               child: const Icon(Icons.search ,color: Colors.white70),
               onTap: () {
                 print("ges:$location");
                  // setState(() {  loadweatherInfo(location);});
                    loadweatherInfo(location);
               } ,
             ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                height: MediaQuery.of(context).size.height * .06,
                child: TextField(style: const TextStyle(color: Colors.white),
                  cursorColor:Colors.white70 ,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    print("search");
                    loadweatherInfo(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter the Location' ,
                    hintStyle: TextStyle(color: Colors.white70),
                    disabledBorder:InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (text) {
                   setState(() {
                     location=text;
                   });

                  },
                ),
              )
            ],
          ),
        ),
      ) ,
      //Search bar ses--------------------------------------------------



        // City information suru-------------------------------------------------
        Padding(
         padding: const EdgeInsets.only(top: 20,left: 20,right:20),
         child: Container(
           width: MediaQuery.of(context).size.width * .9,
           height:MediaQuery.of(context).size.width * .30,
           decoration: BoxDecoration(
               color: Colors.lightBlue,
             borderRadius: BorderRadius.circular(10),
           ),
           child: Row(
             children: [
               const Padding(padding: EdgeInsets.only(left: 10)),
               const Icon(Icons.sunny,color: Colors.white),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                 children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(width: MediaQuery.of(context).size.width * .75 ,child: Text( overflow:TextOverflow.ellipsis ,"Condition: $condition ",style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold )),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,top:10),
                      child: Text("in  $conntry" ,style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold )),
                    )
                 ],
               )
             ],
           ),
         ),
       ),
        // CITY INFORMATION SES ------------------------------------------------->


        //TEMPARATURE suru ------------------------------------------------------
        Padding(
    padding: const EdgeInsets.only(top: 20,left: 20,right:20),
    child: Container(
    width:MediaQuery.of(context).size.width * .9,
    height:MediaQuery.of(context).size.width * .55,
    decoration: BoxDecoration(
    color: Colors.lightBlue,
    borderRadius: BorderRadius.circular(10),
    ),
    child:  Column(
      children: [
       const Padding(
          padding: EdgeInsets.only(left: 10,top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Icon(Icons.thermostat,color: Colors.white, size: 40,),
                 Padding(padding: EdgeInsets.only(left: 10)),
                 Text("Temparature", style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold )),
              ],
          ),
        ),

            Container(
              height: MediaQuery.of(context).size.height * .18,
            alignment: Alignment.center,
                child: Text("$temparature°C",  style:const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold ))
            ),


      ],
    ),

    ),
    ),
        // temparature ses ---------------------------------------------------------


       //HUMIDITY AND WIND SPEED SURU -------------------------------------------------
       Padding(
         padding: const EdgeInsets.only(left:20,top:20),
         child: Row(

           children: [
              Container(
                width: MediaQuery.of(context).size.width * .40,
                height: MediaQuery.of(context).size.width * .40,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(

                  padding:  EdgeInsets.only(left:10,top:15),
                  child:Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Icon(Icons.water_drop_rounded,color: Colors.white,),
                         Padding(padding: EdgeInsets.only(left:10)),
                         Text("HUMIDITY" , style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold ) )
                    ],
                  ),
                      Container(
                          height: MediaQuery.of(context).size.height * .13,
                          alignment: Alignment.center,
                          child: Text("$humidity %",  style:const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold ))
                      ),
                ],
                  ),
                ),

              ),




           Padding(
             padding: const EdgeInsets.only(left:25),
             child: Container(
               width: MediaQuery.of(context).size.width * .45,
               height: MediaQuery.of(context).size.width * .40,
               decoration: BoxDecoration(
                 color: Colors.lightBlue,
                 borderRadius: BorderRadius.circular(10),
               ),
               child:  Padding(

                 padding:  EdgeInsets.only(left:10,top:15),
                 child:Column(
                   children: [
                     const Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Icon(Icons.water_drop_rounded,color: Colors.white,),
                         Padding(padding: EdgeInsets.only(left:10)),
                         Text("WIND SPEED" , style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold ) )
                       ],
                     ),
                     Container(
                         height: MediaQuery.of(context).size.height * .13,
                         alignment: Alignment.center,
                         child: Text(" $windSpeed km/h",  style:const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold ))
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ],
         ),
       ),
      //HUMIDITY AND WIND SPEED SES  -------------------------------------------------


        const Spacer(),
        const Text("Made by kaushik", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold ) ),
        const Text("Data Provides By Weatherapi", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold ) )
        ],


      ),
      ),
      ),
    );
  }
}


 Widget searchBarDesign (String location, void f(String loc)  ) {

   return Container(
      width: double.maxFinite
     ,height: 50,
     // color: Colors.amber,
     margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
     decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
         color: Colors.black26),
       child:   Padding(
         padding: EdgeInsets.only(left: 15),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             // Icon(
             //     Icons.search,
             //     color: Colors.black54,
             //     shadows: <Shadow>[Shadow(color: Colors.black45, blurRadius: 4.0)],
             //   size: 25 ,
             // ),
           SizedBox(
            width: 300,height: 50,
           child: TextField(
             decoration: const InputDecoration(
                 hintText: 'Enter the Location',
               disabledBorder:InputBorder.none,
               focusedBorder: InputBorder.none,
               prefixIcon: Icon(
                 Icons.search,
                 color: Colors.black26,
               ),
             ),
              onChanged: (text) {
               location=text;
               print(location);
              },

           ),
           )
           ],
         ),
       ),
   ) ;
 }