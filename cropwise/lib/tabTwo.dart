import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tabtwo extends StatefulWidget {
  const Tabtwo({super.key});

  @override
  State<Tabtwo> createState() => _TabtwoState();
}

class _TabtwoState extends State<Tabtwo> {
  List <String> items =['Maize','Beans','Soybeans','Peas','Coffee','Groundnut'];
  String ? selectedItem = 'Maize';
  final _formKey = GlobalKey<FormState>();
  final area_controler = TextEditingController();
  final crop_controler = TextEditingController();
  
  
  @override
  void dispose(){
    area_controler.dispose();
    crop_controler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return tabtwoContainer(context);
}

  Container tabtwoContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Container(
     
    child: Form(
      key: _formKey,
      child: Column( 
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: screenWidth-40,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3,color: Color(0xFFCCCCCC)),
                color: Color.fromRGBO(255, 255, 255,0.5),
            ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFormField(
                    controller: area_controler,
                    keyboardType: TextInputType.number,
                      inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly, FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]'))],
                      // controller: ,
                      decoration:  InputDecoration( 
                        filled: true,
                        fillColor: Colors.white,                   
                        labelStyle: TextStyle(color: Color(0xFF000000), fontSize: 20),
                        labelText: 'Farm Area',

                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue))
            
                      ),
                      validator: (area_controler) {
                    if (area_controler == null || area_controler.isEmpty) {
                          return 'Required';
                        }
                         return null;
                      }
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 150,
                  child: Theme(
                    data: Theme.of(context).copyWith(     // <- Here
                                focusColor: Colors.transparent,
                                primaryColor: Colors.transparent
                              ),
                    child: DropdownButtonFormField <String>(
                      style: TextStyle(color: Color(0xFF000000), fontSize: 20),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,                   
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3, color: Colors.blue))
                      ),
                      value: selectedItem,
                      items: items
                            .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item))).toList(),
                    onChanged: (item) => setState(()=>selectedItem=item),
                    
                    
                    ),
                  ),
                ),
                ],
                ),
                SizedBox(height: 50,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              SizedBox(
                width: 140,
                 child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {                      
                        calculations(context,area_controler,selectedItem);                  
                      
                      }
                    },
                    style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, 
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.blue, width: 2),
                                ),
            ),
          
                    child: Text('Calculate', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)),
                )],),
            ],  ),
        ),
         
            ],  ),
    ),
    );
  }}

calculations(conte,area_controler,selectedItem){
  double farmArea = double.parse(area_controler.text);
  double seedRate = 0;

  if(selectedItem == 'Maize'){
     double spacing = 0.7*0.15; 
     double twg = 350;

     seedRate = (farmArea * twg * 100 * 100)/(spacing * 98 * 90 * 1000 * 1000);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 70cm X 30cm. This is The Amount of seed Required $roundedrate KGs"),
                          ));
    

  }
  else if(selectedItem == 'Beans'){
    double spacing = 0.45*0.2; 
     double twg = 240;

     seedRate = (farmArea * twg * 100 * 100)/(spacing * 75 * 98 * 1000 * 1000);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 45cm X 20cm. This is The Amount of seed Required $roundedrate KGs"),
                          ));
    

  }
   else if(selectedItem == 'Soyabeans'){
    double spacing = 0.1*0.4; 
     double twg = 188.3;

     seedRate = (farmArea * twg * 100 * 100)/(spacing * 97 * 70 * 1000 * 1000);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 40cm X 10cm. This is The Amount of seed Required $roundedrate KGs"),
                          ));
    

  }else if(selectedItem == 'Peas'){
    double spacing = 0.6*0.1; //60cm x 20cm
     double twg = 500;

     seedRate = (farmArea * twg * 100 * 100)/(spacing * 98 * 75 * 1000 * 1000);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 60cm X 10cm. This is The Amount of seed Required $roundedrate KGs"),
                          ));
    

  }else if(selectedItem == 'Coffee'){
    double spacing = 1.5*1.5; //60cm x 20cm

     seedRate = (farmArea)/(spacing);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 1.5m X 1.5m. This is The Number of Trees Required $roundedrate"),
                          ));
    

  }else if(selectedItem == 'Groundnut'){
    double spacing = 0.3*0.15; //60cm x 20cm
     double twg = 311.3;

     seedRate = (farmArea * twg * 100 * 100)/(spacing * 98 * 75 * 1000 * 1000);
     String roundedrate = seedRate.toStringAsFixed(2);

     showDialog(context: conte, builder: (_)=> AlertDialog(
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(conte).pop();
                              }, child: Text('Close'))
                            ],
                            title: Text('Estimated Amount of Seed($selectedItem)'),
                            contentPadding: EdgeInsets.all(20.0),
                            content: Text("Use Spacing of 30cm X 15cm. This is The Amount of seed Required $roundedrate KGs"),
                          ));
    

  }
 
}

