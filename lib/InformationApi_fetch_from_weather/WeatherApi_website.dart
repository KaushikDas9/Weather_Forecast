

import 'dart:convert';

import 'package:http/http.dart%20';

class GetInformation {

      String location;
      GetInformation(  this.location  );

       late String temp;
      late String fellsLikeTemp ;
      late String humidity;
      late  String wind_kph;
      late String  pressure_mb;
      late String condition;
      late String region;
      late String country;




      Future<void> getData()  async {

        try {
          var response = await get(Uri.parse(
              "https://api.weatherapi.com/v1/current.json?key=cdf058a08b7b407c8d2193552231009&q=$location&aqi=no"));
          var data = jsonDecode(response.body);
          var mapCurrent = data['current'];
          var mapLocation = data['location'];

          temp = mapCurrent["temp_c"].toString();
          fellsLikeTemp = mapCurrent["feelslike_c"].toString();
          humidity = mapCurrent["humidity"].toString();
          wind_kph = mapCurrent["wind_kph"].toString();
          pressure_mb = mapCurrent["pressure_mb"].toString();
          condition = mapCurrent["condition"]["text"].toString();
          region = mapLocation["region"].toString();
          country = mapLocation["country"].toString();
        }
        catch (e){
          temp = "Plz enter valid city";
          fellsLikeTemp = "Plz enter valid city";
          humidity ="Plz enter valid city";
          wind_kph = "Plz enter valid city";
          pressure_mb ="Plz enter valid city";
          condition ="Plz enter valid city";
          region = "Plz enter valid city";
          country = "Plz enter valid city";
        }


      }

}