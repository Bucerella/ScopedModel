import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/donation_model.dart';

class DonationModelScreen extends StatefulWidget {
  @override
  _DonationModelScreenState createState() => _DonationModelScreenState();
}

class _DonationModelScreenState extends State<DonationModelScreen> {

  DonationModel donationModel;

  @override
  void initState() {
    super.initState();
    donationModel = DonationModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/dog.jpeg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              shadowColor: Color(0x802196f3),
              child: ScopedModelDescendant<DonationModel>(
                builder: (context,child,model){
                    if(model.donatedClicked){
                      return _buildContent(model);
                    }else{
                    return _buildInitContainer(model);
                    }
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: Column(
          children: <Widget>[
            _thankYouText(model),
            _backButton(),
          ],
        ),
      ),
    );
  }
  Widget _thankYouText(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.adb,
            color: Color(0xffdd6b3d),
            size: 40,
          ),
          Text(
            "STEMARD says",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Thank you for donating \u0024 ${model.count}",
            style: TextStyle(fontSize: 20, color: Color(0xffdd6b3d)),
          ),
        ],
      ),
    );
  }

  Widget _backButton(){

    return Padding(
      padding: EdgeInsets.only(top: 25,left: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.four_k,color: Color(0xffdd6b3d),size: 30,),
          SizedBox(height: 10,),
          RaisedButton(
            onPressed: (){

            },

            color: Color(0xffdd6b3d),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Donate More", style: TextStyle(fontSize: 24,),

              ),

            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(width: 10,),
          Icon(Icons.ac_unit,color: Color(0xffdd6b3d),
            size: 30,)
        ],
      ),
    );

  }


  Widget _buildInitContainer(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        child: Column(
          children: <Widget>[
            _titleContainer(),
            _priteContainer(model),
            _donateContainer(model),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer() {
    return Container(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "STEMARD",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dogs are Helpful, not Painful",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "Cancel",
              style: TextStyle(color: Color(0xffdd6b3d), fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priteContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              model.decrement();
            },
            child: Icon(
              Icons.exposure_neg_1,
              color: Color(0xffdd6b3d),
              size: 30,
            ),
            shape: CircleBorder(),
            elevation: 2,
            fillColor: Color(0xfffaf4f2),
            padding: EdgeInsets.all(10),
          ),
          Text(
            "\u0024 ${model.count}",
            style: TextStyle(fontSize: 44, color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              model.increment();
            },
            child: Icon(
              Icons.exposure_plus_1,
              color: Color(0xffdd6b3d),
              size: 30,
            ),
            shape: CircleBorder(),
            elevation: 2,
            fillColor: Color(0xfffaf4f2),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }

  Widget _donateContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xffdd6b3d),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Donate",
                    style: TextStyle(fontSize: 24),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            onPressed: () {
              model.donatedClicked = true;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
