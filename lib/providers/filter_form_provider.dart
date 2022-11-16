import 'package:flutter/material.dart';

class FilterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String text_filter = "";

  bool validateForm() {
    if ( formKey.currentState!.validate() ) {
      return true;
    } else {
      return false;
    }
  }



}