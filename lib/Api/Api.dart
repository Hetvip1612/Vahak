import 'package:flutter/material.dart';

class ApiConstants {
  static String baseUrl = 'http://192.168.1.22:8008/';
  static String usersEndpoint = 'validate_phone/';


  static String validate_otp='validate_otp/';
    static String add_company_detail='add_company_detail/';
    static String assign_user_role='assign_user_role/';

    static String routes='routes/';
    static String add_office_address='add_office_address/';
    static String add_company_bio='add_company_bio/';
    static String edit_profile='edit_profile/';
    static String viewsprofile='services/viewsprofile/';


   
   
   
   
   
   
   //Market
   static String post_load_filters='services/post_load_filters/?';
   
   
      static String post_lorry_ficlters='services/attachlorryfilters/?';

   
   
   
   //LoadPage
         static String post_loadlist='services/loadlisting/';

   //LorryPage
         static String post_lorrylist='services/lorrylisting/';

   //booklorrylist
  static String getbook_lorrylist='services/lorrybooknow/';

   
   //networkpage
   static String network_list='services/network/';
   
   //static var _purple = 0xFF9C27B0;

  static var _purple=0xFF9C27B0;

 // static var _purple;

  //static var _purple;
  static const int _purplePrimaryValue = 0xFF9C27B0;

static const MaterialColor purple = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
       50: Color(0xFFF3E5F5),
      100: Color(0xFFE1BEE7),
      200: Color(0xFFCE93D8),
      300: Color(0xFFBA68C8),
      400: Color(0xFFAB47BC),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF8E24AA),
      700: Color(0xFF7B1FA2),
      800: Color(0xFF6A1B9A),
      900: Color(0xFF4A148C),
    },
  );
}