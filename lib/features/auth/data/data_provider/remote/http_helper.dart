// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class HttpHelper {
//   postDataByHttp(CheckOutVerifyPayMobRequestModel checkOutVerifyPayMobRequestModel) async {
//     try {
//       var response = await http.post(
//         Uri.parse('http://localhost:8000/customer/payment/verify'),
//         body: checkOutVerifyPayMobRequestModel.toJson(),
//       );
//       var decodedResponse = jsonDecode(response.body);
//       print(' is ${decodedResponse}');
//       var uri = Uri.parse(decodedResponse['uri'] as String);
//     } finally {
//      // http.close();
//     }
//   }
// }
