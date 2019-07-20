import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/donationModelScreen.dart';
import 'package:scoped_model_example/donation_model.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

DonationModel donationModel = DonationModel();

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Scoped Model Demo Flutter",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DonationModelScreen(),
      ),
    );
  }
}
