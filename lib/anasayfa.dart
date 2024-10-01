import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  var tfContoller = TextEditingController();
  String alinanVeri = "-";
  var begenmeDurumu = "satisfied.png";
  bool switchKontrol = false;
  bool checkboxControl = false;
  int grup1 = 0;
  bool gorunurluk = false;
  double sliderDeger = 50.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlkte = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("Japonya");
    ulkelerListesi.add("Çin");
    ulkelerListesi.add("ABD");
  }

  @override

  Widget build(BuildContext context) {

    var displayInfo = MediaQuery.of(context);
    final double displayWidth = displayInfo.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfContoller,
                  decoration: const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                ),
              ),
              TextButton(onPressed: (){
                setState(() {
                  alinanVeri = tfContoller.text;
                });
              }, child: Text("Veriyi Gönder")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: displayWidth/3,
                    child: TextButton(
                      onPressed: (){
                      setState(() {
                        begenmeDurumu = "unsasatisfied.png";
                      });
                    }, child: Text("Beğenmedim")),
                  ),
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("resimler/$begenmeDurumu")),
                  Container(
                    width: displayWidth/3,
                    child: TextButton(
                      onPressed: (){
                      setState(() {
                        begenmeDurumu = "satisfied.png";
                      });
                    }, child: Text("Beğendim")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: SwitchListTile(
                      title: Text("nbr"),
                      controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol = veri;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: CheckboxListTile(
                        title: Text("yusufi"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxControl,
                        onChanged: (veri){
                          setState(() {
                            checkboxControl = veri!;
                          });
                        }),
                  ),
        
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: RadioListTile(
                        title: Text("secim1"),
                        value: 1,
                        groupValue: grup1,
                        onChanged: (veri){
                          setState(() {
                            grup1 = veri!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: RadioListTile(
                      title: Text("secim2"),
                        value: 2,
                        groupValue: grup1,
                        onChanged: (veri){
                          setState(() {
                            grup1 = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: displayWidth/2.5,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            gorunurluk = true;
                          });
                        }, child: Text("Başla")),
                  ),
                  Visibility(visible: gorunurluk, child: CircularProgressIndicator()),
                  Container(
                    width: displayWidth/2.5,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            gorunurluk = false;
                          });
                        }, child: Text("Dur")),
                  ),
                ],
              ),
              Text(sliderDeger.toInt().toString()),
              Slider(
                max: 100.0,
                min: 0.0,
                value: sliderDeger,
                onChanged: (veri){
                  setState(() {
                    sliderDeger = veri;
                  });
                }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfSaat,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) => {
                      tfSaat.text = "${value!.hour}:${value.minute}"
                    });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfTarih,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(hintText: "Tarih"),
                    ),
                  ),
                  IconButton(onPressed: (){
                    showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030), initialDate: DateTime.now()).then((value) => {
                      tfTarih.text = "${value!.day}/${value.month}/${value.year}"
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],
              ),
            DropdownButton(
              value: secilenUlkte,
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              items: ulkelerListesi.map((ulke) {
                return DropdownMenuItem(value: ulke, child: Text(ulke),);
              }).toList(),
              onChanged: (veri){
                setState(() {
                  secilenUlkte = veri!;
                });
              }),
              GestureDetector(
                onTap: (){
                  print("Tek Tıklama");
                },
                onDoubleTap: (){
                  print("Çift Tıklama");
                },
                onLongPress: (){
                  print("Uzun basma");
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    width: 200,
                    height: 300,
                    color: Colors.lightGreenAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
