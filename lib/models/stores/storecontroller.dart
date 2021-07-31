import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/models/stores/storemodel.dart';
import 'package:scoped_model/scoped_model.dart';


mixin StoreController on Model{

  bool _isGetStoreLoading = false;
  bool get isGetStoreLoading => _isGetStoreLoading;

  List<StoreModel> _allStores = [];
  List<StoreModel> get allStores => _allStores;

  List<StoreModel> _allFavStores = [];
  List<StoreModel> get allFavStores => _allFavStores;

  List<StoreModel> _allSearchStores = [];
  List<StoreModel> get allSearchStores => _allSearchStores;

  getStores() async {

    _isGetStoreLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('$url/stores.json'));

    if(_response.statusCode == 200) {
      var _data = json.decode(_response.body);
      _data.forEach((x , i) {
        StoreModel _newStore = StoreModel(
          x,
          i['storeName'],
          i['distance'],
          i['double'],
          i['img'],
          false,
          i['service']
        );
        _allStores.add(_newStore);
      });
      _isGetStoreLoading = false;
      notifyListeners();
    }else{
      _isGetStoreLoading = false;
      notifyListeners();
    }
  }


  addToFav(StoreModel store) {

    store.isFav = true;
    _allFavStores.add(store);
    notifyListeners();
  }

  removeFromFav(StoreModel store) {

    store.isFav = false;
    _allFavStores.remove(store);
    notifyListeners();
  }


  search(String searchWord) {

    String search = searchWord.toLowerCase().trim();

    for(StoreModel i in _allStores) {
      if(i.storeName.toLowerCase() == search){
        _allSearchStores.add(i);
      }
    }

    notifyListeners();
  }
}