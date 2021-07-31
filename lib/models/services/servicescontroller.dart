import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/models/services/servicesmodel.dart';
import 'package:scoped_model/scoped_model.dart';



mixin ServiceController on Model{

  bool _isGetServiceLoading = false;
  bool get isGetServiceLoading => _isGetServiceLoading;

  List<ServiceModel> _allServices = [];
  List<ServiceModel> get allServices => _allServices;

  getServices() async {

    _isGetServiceLoading = true;
    notifyListeners();
    
    http.Response _response = await http.get(Uri.parse('$url/services.json'));

    if(_response.statusCode == 200) {
      var _data = json.decode(_response.body);
      _data.forEach((x , i) {
        ServiceModel _newOffer = ServiceModel(i['serviceName'], i['img']);
        _allServices.add(_newOffer);
      });
      _isGetServiceLoading = false;
      notifyListeners();
    }else{
      _isGetServiceLoading = false;
      notifyListeners();
    }
  }
}


// ScopedModel => top of app tree
// Model => class that inherit from to share data n notify liseteners
// ScopedModelDecendent => parent for widget that needs to listen on changes