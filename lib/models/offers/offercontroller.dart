import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/models/offers/offermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';


mixin OfferController on Model{

  bool _isGetOfferLoading = false;
  bool get isGetOfferLoading => _isGetOfferLoading;

  List<OfferModel> _allOffers = [];
  List<OfferModel> get allOffers => _allOffers;

  getOffers() async {

    _isGetOfferLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('$url/offers.json'));

    if(_response.statusCode == 200) {
      var _data = json.decode(_response.body);
      _data.forEach((x , i) {
        OfferModel _newOffer = OfferModel(i['offerName'], i['img']);
        _allOffers.add(_newOffer);
      });
      _isGetOfferLoading = false;
      notifyListeners();
    }else{
      _isGetOfferLoading = false;
      notifyListeners();
    }
  }
}

// Fun get data
// decode data from json to object
// call data from fun into widget