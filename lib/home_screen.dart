import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // getWeather();
  }
  String cityName = 'Mexico'; //Default city
  final TextEditingController _controller = TextEditingController();
  var temp = '80';
  var description = 'Mostly Cloudy';
  var mainWeather = 'Rain';
  var humidity = '80';
  var windSpeed = '0.50';
  var clouds = '65';


  Future getWeather() async {
    final url = Uri.parse(
       'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid={37a4177cb3b88d5c21862086d4a905a1}');
      final weather = await http.get(url);
      final response = json.decode(weather.body);
       setState(() {
      temp = response['main']['temp'].toString();
      description = response['weather'][0]['description'];
      mainWeather = response['weather'][0]['main'];
      humidity = response['main']['humidity'].toString();
      windSpeed = response['wind']['speed'].toString();
      clouds = response['clouds']['all'].toString();
    });

  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
       

    )
    );
  }
 
}