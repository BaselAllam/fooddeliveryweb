


import 'package:fooddeliveryweb/models/offers/offercontroller.dart';
import 'package:fooddeliveryweb/models/services/servicescontroller.dart';
import 'package:fooddeliveryweb/models/stores/storecontroller.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ServiceController, StoreController, OfferController{}