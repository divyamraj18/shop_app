import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopapp/models/http_exception.dart';
class Auth with ChangeNotifier{
  String _token;
  DateTime _expiryDate;
  String _userId;
  Future<void> _authenticate(String email,String password,String urlSegment) async{
    final url='https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBvLr43PsQ1WyohdIZ46IbNkxWjenOAJhE';
    final response=await http.post(
        url,body: json.encode(
        {
          'email':email,
          'password':password,
          'returnSecureToken': true,
        }
    )
    );
    final responseData=json.decode(response.body);
    if(responseData['error']!=null){
      throw HttpException(responseData['error']['message']);
    }
  }
  Future<void> signup(String email,String password) async{
   return  _authenticate(email, password, 'signUp');
  }
  Future<void> login(String email,String password) async{
    return _authenticate(email, password, 'signInWithPassword');
  }
}