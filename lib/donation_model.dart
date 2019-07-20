import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model{
    int _count = 0;
    bool _donatedClicked = false;

    get count => _count;
    get donatedClicked=> _donatedClicked;

    set donatedClicked(bool donate){
      if(donate==null){
        throw new ArgumentError();
      }
      _donatedClicked = donate;
      notifyListeners();
    }

    void increment(){
      _count++;
      notifyListeners();
    }
    void decrement(){
      _count--;
      notifyListeners();
    }

}