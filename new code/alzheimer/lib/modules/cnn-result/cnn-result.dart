import 'package:flutter/material.dart';

class CNNResultScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const CNNResultScreen({super.key, required this.data});
  @override
  State<CNNResultScreen> createState() => _CNNResultScreenState();
}

class _CNNResultScreenState extends State<CNNResultScreen> {
  String title= "";

  List<dynamic> rec = [];

  List<dynamic> data = [];
  @override
  void initState() {
    // TODO: implement initState
    title = widget.data['label'];
    rec = widget.data['reco'][0][0].split("\n") as List<dynamic>;
    data = widget.data['info'][0][0].split("\n") as List<dynamic>;
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      var w  =( MediaQuery.of(context).size.width * 800) / 1366;
      print("Width = $w");
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color.fromRGBO(
        //       170, 6, 206, 0.5019607843137255),
        // ),
        body: Stack(
          children:  [

            const Image(
              image: AssetImage('assets/images/result.jpeg'),
              fit: BoxFit.cover,
              width:double.infinity,
              height: double.infinity,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
                icon: const Icon(Icons.arrow_back, size: 30,)
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Spacer(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20,),
                            Center(child: Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                            const SizedBox(height: 10,),
                            Container(
                              width: 200,
                              height: 200,
                              child: const Image(
                                  image: AssetImage('backend/images/image.jpg')
                              ),
                            ),
                            const SizedBox(height: 20,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Information:',
                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                    width: w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromRGBO(
                                            211, 206, 206, 0.3)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        convertListToString(data),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text('Recommendations:',
                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                    width: w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromRGBO(
                                            211, 206, 206, 0.3)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        convertListToString(rec),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }

  String convertListToString(List<dynamic> list) {
      String result = "";
      int index = 1;
      for (String s in list) {
           result = "$result\n$index- $s\n";
           index = 1+index;
      }
      return result;
  }
}
