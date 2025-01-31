import 'package:Videotheque/Globals.dart';
import 'package:Videotheque/utils/SlidePageRoute.dart';
import 'package:Videotheque/views/collection_view/collection_view.dart';
import 'package:Videotheque/views/movie_view/movie_view.dart';
import 'package:Videotheque/views/person_view/person_view.dart';
import 'package:Videotheque/views/tv_view/tv_view.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:enum_to_string/enum_to_string.dart';


class CarrouselController extends ChangeNotifier {
  
  ElementsTypes type;
  List carrouselData;
  String route;
  BuildContext context;

  CarrouselController(this.context, this.type, this.carrouselData);

  void onElementTapped(int index, String heroTag) {
    Future.delayed(const Duration(milliseconds: 150), () {
      QueryTypes type = EnumToString.fromString(QueryTypes.values, carrouselData[index]["type"]);
      GlobalsArgs.actualRoute = "/element/"+GlobalsMessage.chipData[QueryTypes.values.indexOf(type)]["route"];
      GlobalsArgs.transfertArg = [carrouselData[index], heroTag];
      GlobalsArgs.isFromLibrary = true;
      switch (GlobalsArgs.actualRoute) {
        case "/element/movie":
          Navigator.push(context, SlideLeftRoute(page: MovieView()));
          break;
        case "/element/person":
          Navigator.push(context, SlideLeftRoute(page: PersonView()));
          break;
        case "/element/tv":
          Navigator.push(context, SlideLeftRoute(page: TvView()));
          break;
        case "/element/collection":
          Navigator.push(context, SlideLeftRoute(page: CollectionView()));
          break;
        default:
      }
    });
  }

  String getNameElement(int index) {
      return carrouselData[index]["title"];
  } 
  String getImageElement(int index) {
      return carrouselData[index]["image_url"];
  }
  QueryTypes getElementType(int index) {
    return EnumToString.fromString(QueryTypes.values, carrouselData[index]["type"]);
  }
  
  ImageTypes getImageType(int index) {
    QueryTypes type = EnumToString.fromString(QueryTypes.values, carrouselData[index]["type"]);
    return GlobalsMessage.chipData[QueryTypes.values.indexOf(type)]["image_type"];
  }

  String get heroTag => Uuid().v1();
}