import 'dart:convert';

import 'package:asset_tracker/apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// An implementation of the [UserApi] interface that makes use of the dio package.
/// Use this if you prefer ease of use over full control. Make sure to read the docs.
/// https://pub.dev/packages/dio
class DioUserApi implements UserApi {

  final String baseUrl;
  final JsonDecoder decoder = const JsonDecoder();

  DioUserApi({ required this.baseUrl });

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

    try {
      final headers = await getHeaders();
      final response = await Dio().get(url, options: Options(headers: headers));
      List<dynamic> responseList = response.data as List<dynamic>;
      return responseList.map((responseItem) => User.fromJson(responseItem)).toList();
    }
    // Dio automatically throws exceptions for "non-successful" status codes.
    // Successful status codes fall in the range of 2xx and 304.
    catch (ex) {
      // You might want to do more than console log here.
      debugPrint('Error: ${ex.toString()}');
      rethrow;
    }
  }

  @override
  Future<User> deleteUser(User user) async {
    String url = '$baseUrl/users/${user.id}';

    try {
      final headers = await getHeaders();
      final response = await Dio().delete(url, options: Options(headers: headers));
      return user;
    }
    // Dio automatically throws exceptions for "non-successful" status codes.
    // Successful status codes fall in the range of 2xx and 304.
    catch (ex) {
      // You might want to do more than console log here.
      debugPrint('Error: ${ex.toString()}');
      rethrow;
    }
  }

  @override
  Future<User> updateUser(User user) async {
    String url = '$baseUrl/users/${user.id}';

    try {
      final headers = await getHeaders();
      final response = await Dio().put(url, data: user.toJson(), options: Options(headers: headers));
      return User.fromJson(response.data);
    }
    // Dio automatically throws exceptions for "non-successful" status codes.
    // Successful status codes fall in the range of 2xx and 304.
    catch (ex) {
      // You might want to do more than console log here.
      debugPrint('Error: ${ex.toString()}');
      rethrow;
    }
  }

  @override
  Future<User> addUser(User user) async {
    String url = '$baseUrl/users';

    try {
      final headers = await getHeaders();
      final response = await Dio().post(url, data: user.toJson(), options: Options(headers: headers));
      return User.fromJson(response.data);
    }
    // Dio automatically throws exceptions for "non-successful" status codes.
    // Successful status codes fall in the range of 2xx and 304.
    catch (ex) {
      // You might want to do more than console log here.
      debugPrint('Error: ${ex.toString()}');
      rethrow;
    }
  }

  @override
  Future<User> getUser(String id) async {
    String url = '$baseUrl/users/$id';

    try {
      final headers = await getHeaders();
      final response = await Dio().get(url, options: Options(headers: headers));
      return User.fromJson(response.data);
    }
    // Dio automatically throws exceptions for "non-successful" status codes.
    // Successful status codes fall in the range of 2xx and 304.
    catch (ex) {
      // You might want to do more than console log here.
      debugPrint('Error: ${ex.toString()}');
      rethrow;
    }
  }
}
