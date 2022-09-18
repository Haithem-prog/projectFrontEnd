import 'dart:convert';
import 'package:dio/dio.dart';

class AuthService {
  final dio = Dio();
  late Response response;
  static late String signUpMessage;
  static late String signInMessage;
  static late String name;
  static late String phone;
  static late int statusCode;
  static late String token;
  static late int id;

  //register so we maske an account
  signUp(String name, String phoneNumber, String password, String conPassword) async {
    try {
      response = await dio.post(
        'http://10.0.2.2:8000/api/signup',
        data: jsonEncode({"name": "$name", "phone": "$phoneNumber", "password1": password, "password2": conPassword}),
      );
      AuthService.signUpMessage = response.data['detail'];
      AuthService.statusCode = response.statusCode!;
    } catch (e) {
      return (e);
    }
  }

  //Sign in so we get token
  signIn({required String phoneNumber, required String password}) async {
    try {
      response = await dio.post(
        'http://10.0.2.2:8000/api/signin',
        data: jsonEncode({"phone": phoneNumber, "password": password}),
      );

      if (response.statusCode == 201) {
        AuthService.signInMessage = response.data['detail'];
      } else {
        final body = response.data;
        AuthService.id = body['id'];
        AuthService.token = body['token'];
        AuthService.signInMessage = body['detail'];
        AuthService.name = body['name'];
        AuthService.phone = body['phone'];
        AuthService.statusCode = response.statusCode!;
      }
    } catch (e) {
      return (e);
    }
  }
}


// //login so we get a token!
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     try {
//       response = await dio.post(
//         'http://restapi.adequateshop.com/api/authaccount/login',
//         data: jsonEncode({"email": "Developer5@gmail.com", "password": 123456},),
//       );
//       //final body = response.data;
//       //print(body[0]['name']);
//       print(response);
//       //{"code":0,"message":"success","data":{"Id":148307,"Name":"Developer","Email":"Developer5@gmail.com","Token":"5e1b53ff-f1e4-4168-9500-73e0668181d6"}}
//     } catch (e) {
//       print('----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }
// }



// //accessing with token so we get data
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     String token = "5e1b53ff-f1e4-4168-9500-73e0668181d6";
//     try {
//       response = await dio.get('http://restapi.adequateshop.com/api/users?page=1',
//           // data: jsonEncode(
//           //   {"email": "Developer5@gmail.com", "password": 123456},
//           // ),
//           options: Options(
//             headers: {"authorization": "Bearer $token"},
//           )
//           );
//       //final body = response.data;
//       //print(body[0]['name']);
//       print(response);
//       //{"code":0,"message":"success","data":{"Id":148307,"Name":"Developer","Email":"Developer5@gmail.com","Token":"5e1b53ff-f1e4-4168-9500-73e0668181d6"}}
//     } catch (e) {
//       print('----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }
// }


//(fake working))))))))))))))--------------------------------------------------------------------fake working 

// //register so we maske an account
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     try {
//       response = await dio.post(
//         'http://restapi.adequateshop.com/api/authaccount/registration',
//         data: jsonEncode({"name": "developer","email": "Developer5@gmail.com", "password": 123456}),
//       );
//       //final body = response.data;
//       //print(body[0]['name']);
//       print(response);
//     } catch (e) {
//       print('----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }
// }


// //login so we get a token!
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     try {
//       response = await dio.post(
//         'http://restapi.adequateshop.com/api/authaccount/login',
//         data: jsonEncode({"email": "Developer5@gmail.com", "password": 123456},),
//       );
//       //final body = response.data;
//       //print(body[0]['name']);
//       print(response);
//       //{"code":0,"message":"success","data":{"Id":148307,"Name":"Developer","Email":"Developer5@gmail.com","Token":"5e1b53ff-f1e4-4168-9500-73e0668181d6"}}
//     } catch (e) {
//       print('----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }
// }



// //accessing with token so we get data
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     String token = "5e1b53ff-f1e4-4168-9500-73e0668181d6";
//     try {
//       response = await dio.get('http://restapi.adequateshop.com/api/users?page=1',
//           // data: jsonEncode(
//           //   {"email": "Developer5@gmail.com", "password": 123456},
//           // ),
//           options: Options(
//             headers: {"authorization": "Bearer $token"},
//           )
//           );
//       //final body = response.data;
//       //print(body[0]['name']);
//       print(response);
//       //{"code":0,"message":"success","data":{"Id":148307,"Name":"Developer","Email":"Developer5@gmail.com","Token":"5e1b53ff-f1e4-4168-9500-73e0668181d6"}}
//     } catch (e) {
//       print('----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }
// }



//book how to divide them
// class AuthService {
//   final dio = Dio();
//   late Response response;
//   signUp() async {
//     try {
//       response = await dio.get(
//         'http://10.0.2.2:8000/api/get_all_books',
//         //data: jsonEncode({"email": "Developer5@gmail.com", "password": 123456}),
//       );
//       final body = response.data;
//       print(body[0]['name']);
//       //print(response.data);
//     } catch (e) {
//       print(
//           '----------------------------------------------------------------------------------');
//       print(e);
//     }
//   }


// abstract class Ilogin {
//   static Future<UserModel?> login(String email, String password) async {
//     final api = 'http://restapi.adequateshop.com/api/authaccount/login';

//     final data = {'email': email, 'password': password};
//     final dio = Dio();
//     Response response;
//     response = await dio.post(api, data: data);
//     if (response.statusCode == 200) {
//       final body = response.data;
//       return UserModel(email: email, token: body['token']);
//     } else {
//       return null;
//     }
//   }

// }

// class LoginService extends Ilogin{
//   @override
//   Future<UserModel?> login(String email, String password) async {
//     final api = 'http://restapi.adequateshop.com/api/authaccount/login';
//     final data = {'email': email, 'password': password};
//     final dio = Dio();
//     Response response;
//     response = await dio.post(api, data: data);
//     if (response.statusCode == 200) {
//       final body = response.data;
//       return UserModel(email: email, token: body['token']);
//     } else {
//       return null;
//     }
//   }
// }
// //http://192.168.0.165:8000/api/add_remove_cart_items/

