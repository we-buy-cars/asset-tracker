import 'dart:convert';

import 'package:asset_tracker/apis/apis.dart';
import 'package:http/http.dart' as http;

/// An implementation of the [UserApi] interface that makes use of the http package.
/// Use this if you prefer full control over ease of use.
/// https://pub.dev/packages/http
class HttpUserApi implements UserApi {

  final String baseUrl;
  final JsonDecoder decoder = const JsonDecoder();

  HttpUserApi({ required this.baseUrl });

  Future<Map<String, String>> getHeaders() async {
    // If you have to get and attach a bearer token or basic auth, do so here.
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  @override
  Future<List<User>> getUsers() async {
    String url = '$baseUrl/users';
    final headers = await getHeaders();

    final response = await http.get(Uri.parse(url), headers: headers);
    // You might want to check the response status code and throw exceptions here.
    int status = response.statusCode;

    dynamic responseJson = decoder.convert(response.body);
    List<dynamic> responseList = responseJson as List<dynamic>;

    return responseList.map((responseItem) => User.fromJson(responseItem)).toList();
  }

  @override
  Future<User> deleteUser(User user) async {
    String url = '$baseUrl/users/${user.id}';
    final headers = await getHeaders();

    final response = await http.delete(Uri.parse(url), headers: headers);
    // You might want to check the response status code and throw exceptions here.
    int status = response.statusCode;

    dynamic responseJson = decoder.convert(response.body);

    return user;
  }

  @override
  Future<User> updateUser(User user) async {
    String url = '$baseUrl/users/${user.id}';
    final headers = await getHeaders();

    final response = await http.put(Uri.parse(url), headers: headers, body: jsonEncode(user.toJson()));
    // You might want to check the response status code and throw exceptions here.
    int status = response.statusCode;

    dynamic responseJson = decoder.convert(response.body);

    return User.fromJson(responseJson);
  }

  @override
  Future<User> addUser(User user) async {
    String url = '$baseUrl/users';
    final headers = await getHeaders();

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(user.toJson()));
    // You might want to check the response status code and throw exceptions here.
    int status = response.statusCode;

    dynamic responseJson = decoder.convert(response.body);

    return User.fromJson(responseJson);
  }

  @override
  Future<User> getUser(String id) async {
    String url = '$baseUrl/users/$id';
    final headers = await getHeaders();

    final response = await http.get(Uri.parse(url), headers: headers);
    // You might want to check the response status code and throw exceptions here.
    int status = response.statusCode;

    dynamic responseJson = decoder.convert(response.body);

    return User.fromJson(responseJson);
  }
}
