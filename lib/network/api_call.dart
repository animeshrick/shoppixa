// import 'package:dio/dio.dart';
//
// class ApiBaseHelper {
//   Dio _dio = Dio();
//
//   ApiBaseHelper() {
//     _dio = Dio(BaseOptions(
//       baseUrl: 'https://auth-stg.onrender.com/',
//       connectTimeout: Duration(seconds: 30),
//       receiveTimeout: Duration(seconds: 30),
//     ));
//
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         // Add any common headers, authentication, etc., here
//         // options.headers['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN';
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         // Handle the response globally if needed
//         return handler.next(response);
//       },
//       onError: (DioException e, handler) {
//         // Handle errors globally if needed
//         return handler.next(e);
//       },
//     ));
//   }
//
//   Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
//     try {
//       final response = await _dio.get(endpoint, queryParameters: params);
//       return response;
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
//
//   Future<Response> post(String endpoint, dynamic data) async {
//     try {
//       final response = await _dio.post(endpoint, data: data);
//       return response;
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
//
//   // Add more methods for different HTTP methods as needed
//
//   // Example method for making a custom request
//   Future<Response> customRequest(String method, String endpoint,
//       {dynamic data, Map<String, dynamic>? params}) async {
//     try {
//       final response = await _dio.request(endpoint,
//           data: data,
//           queryParameters: params,
//           options: Options(method: method));
//       return response;
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }
