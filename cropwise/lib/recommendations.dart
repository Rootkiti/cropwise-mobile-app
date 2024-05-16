
import 'dart:convert';

import 'package:cropwise/base_client.dart';
import 'package:cropwise/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CropRecommendation extends StatefulWidget {
  const CropRecommendation({super.key});

  @override
  State<CropRecommendation> createState() => _CropRecommendationState();
}

class _CropRecommendationState extends State<CropRecommendation> {
  final _formKey = GlobalKey<FormState>();
  final humidity_controler = TextEditingController();
  final nitrogen_controler = TextEditingController();
  final potassium_controler = TextEditingController();
  final phosporus_controler = TextEditingController();
  final temperature_controler = TextEditingController();
  final ph_controler = TextEditingController();

  
  
  @override
  void dispose(){
    humidity_controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 200,
      height: 500,
      decoration: BoxDecoration(
        // border: Border.all(width: 3),
        // color: Color(0xFFFFFFFF),
        )
,
     
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Text('Customized Recommendation', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),),
          
              SizedBox(height: 50,),
               Container(
              width: screenWidth-40,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3,color: Color(0xFFCCCCCC)),
                color: Color.fromRGBO(255, 255, 255,0.5),
            ),
            child: Column(
              children: [
                              SizedBox(height: 50,),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                     keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: nitrogen_controler,
                    decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),

                      labelText: 'Nitrogen',
                    ),
                    validator: (nitrogen_controler) {
                if (nitrogen_controler == null || nitrogen_controler.isEmpty) {
                      return 'Required';
                    }
                else if(int.parse(nitrogen_controler) > 100){
                  return '100 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                // Phosphorus
            
                 SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                     keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: phosporus_controler,
                    decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),

                      labelText: 'Phosphorus',
                    ),
                    validator: (phosporus_controler) {
                if (phosporus_controler == null || phosporus_controler.isEmpty) {
                      return 'Required';
                    }
                else if(int.parse(phosporus_controler) > 100){
                  return '100 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                 ],
              ),
              SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                     keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: potassium_controler,
                    decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),

                      labelText: 'Potassium',
                    ),
                    validator: (potassium_controler) {
                if (potassium_controler == null || potassium_controler.isEmpty) {
                      return 'Required';
                    }
                 else if(int.parse(potassium_controler) > 100){
                  return '100 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                // Phosphorus
            
                 SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                     keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: temperature_controler,
                    decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),

                      labelText: 'Temperature',
                    ),
                    validator: (temperature_controler) {
                if (temperature_controler == null || temperature_controler.isEmpty) {
                      return 'Required';
                    }
                 else if(int.parse(temperature_controler) > 100){
                  return '100 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                 ],
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: humidity_controler,
                    decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),

                      labelText: 'Humidity',
                    ),
                    validator: (humidity_controler) {
                if (humidity_controler == null || humidity_controler.isEmpty) {
                      return 'Required';
                    }
                 else if(int.parse(humidity_controler) > 100){
                  return '100 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                // Phosphorus
            
                 SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                     keyboardType: TextInputType.number,
                    inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))],
                    controller: ph_controler,
                    decoration: InputDecoration( 
                       filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),  
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue)),
                 
                      labelText: 'Ph',
                    ),
                    validator: (ph_controler) {
                if (ph_controler == null || ph_controler.isEmpty) {
                      return 'Required';
                    }
                 else if(int.parse(ph_controler) > 9){
                  return '9 in the max value';
                }
                    return null;
                  },
                  ),
                ), 
                 ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, 
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.blue, width: 2),
                                ),
            ),
                onPressed: () async{
                  if (_formKey.currentState!.validate())  {
                                var request = Mydata(
                                n: double.parse(nitrogen_controler.text),
                                p: double.parse(phosporus_controler.text),
                                k: double.parse(potassium_controler.text),
                                temp: double.parse(temperature_controler.text),
                                hum: double.parse(humidity_controler.text),
                                ph: double.parse(ph_controler.text)
                          );
                          var response = await BaseClients().post('http://10.0.2.2:8000/recommendMe',request).catchError((err){debugPrint(err);});
                          if(response == null) return;
                          String data = jsonEncode(response);
                          String recom = data.substring(data.indexOf(':')+3,data.length-4);
                          
                          showDialog(context: context, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Recommendations'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("This farm Is Compatible with $recom"),
                          ));
                    
                  }
                  
                },
                child: const Text('Send'),
              ),
              ],
            )
            
          
              ]
            ),
            )
                  
            
            ]
          ),
        ),
      ),
    );
  }
}

