import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String _baseUrl = 'http://192.0.0.2:8000';

  Future<http.Response> loginUser(String email, String password) async {
    final String url = '$_baseUrl/userlogin';
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> registerUser(String number, String name, String phone, String email, String password) async {
    final String url = '$_baseUrl/register';
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {
      "armyNumber":number,
      "name":name,
      'email': email,
      "phone": phone,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> getUserData(String token) async {
    final String url = '$_baseUrl/secure/fetch-user';
    final Map<String, String> headers = {'Content-Type': 'application/json', "Authorization": "Bearer $token"};

    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      return response;
    } catch (e) {
      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> addUserPersonalData(String name, String phone, String rank, String reg, String dob, String fname, String edu, String rel, String caste, String address, String thesil, String? token) async {
    final String url = '$_baseUrl/secure/addPersonalData';
    final Map<String, String> headers = {'Content-Type': 'application/json', "Authorization": "Bearer $token"};
    final Map<String, String> body = {
      "rank": rank,
      "regiment": reg,
      "name": name,
      "dateOfBirth": dob,
      "fatherName": fname,
      "educationalQualification": edu,
      "religion": rel,
      "caste": caste,
      "address": address,
      "tehsil": thesil,
      "phone": phone,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> addUserProData(String c1, String c2, String c3, String c4, String c5, String c6, String c7, String c9, String c10, String c11, String c12, String c13, String c14, String c15, String c16, String c17, String c18, String c19, String c20, String? token) async {
    final String url = '$_baseUrl/secure/addProfData';
    final Map<String, String> headers = {'Content-Type': 'application/json', "Authorization": "Bearer $token"};
    final Map<String, String> body = {
    "decoration": c1,
    "character": c2,
    "dateOfEnrollment": c3,
    "dateOfDischarge": c4,
    "reasonOfDischarge": c5,
    "amountOfPension": c6,
    "amountofDisabilityPension": c7, 
    "lumpSum": c9,
    "gratuity": c10,
    "groupInsurance": c11,
    "leaveEncashment": c12,
    "financialAssiastance":c13, 
    "commutedPension": c14,
    "dischargeBookNo": c15,
    "dischargeBook": c16,
    "ppoNo": c17,
    "ppo": c18,
    "occupation": c19,
    "income": c20
};

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      return http.Response('An error occurred: $e', 500);
    }
  }
}