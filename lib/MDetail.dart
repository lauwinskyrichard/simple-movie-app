import 'package:flutter/material.dart';

class MDetail extends StatefulWidget {
  @override
  _MDetailState createState() => _MDetailState();
}

class _MDetailState extends State<MDetail> {
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  final review = TextEditingController();

  int validateReview(String value) {
    if (value.isEmpty) {
      return 1;
    } else if (value.length > 1000) {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Movie'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 280.0,
                child:
                    Image.asset('assets/movie/alladin.jpg', fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Text('Aladdin',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Text('Fantasy',
                    style:
                        TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                child: Text(
                  'A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.',
                  style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                padding: EdgeInsets.fromLTRB(30.0, 0, 20.0, 20.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Form(
                    key: formkey1,
                    child: TextFormField(
                      controller: review,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 1.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0)),
                          hintText: 'Write Review'),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                hoverColor: Colors.white,
                color: Colors.red[400],
                onPressed: () {
                  if (validateReview(review.text) == 1) {
                    showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Text('Review Can\'t be Empty'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ));
                  } else if (validateReview(review.text) == 2) {
                    showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                  'Review Text Length is More Than 1000 Character\s'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ));
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text('POST',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
