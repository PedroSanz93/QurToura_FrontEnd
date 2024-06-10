/* PRUEBAS PARA FUTURA ACTUALIZACION DE API TURISMO CORDOBA
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIUtils {
  Future<Map<String, dynamic>?> call(String url,
      {String method = 'GET', Map<String, String>? headers, Map<String, dynamic>? data}) async {
    try {
      var response;
      if (method == 'GET') {
        response = await http.get(Uri.parse(url), headers: headers);
      } else if (method == 'POST') {
        response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
      } else if (method == 'PUT') {
        response = await http.put(Uri.parse(url), headers: headers, body: jsonEncode(data));
      } else if (method == 'DELETE') {
        response = await http.delete(Uri.parse(url), headers: headers);
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

void main() async {
  var apiUtils = APIUtils();

  // Ejemplo de como usar la funcion call para hacer una solicitud GET
  var url = 'https://api.example.com/data';
  var responseData = await apiUtils.call(url);
  print(responseData);

  // Ejemplo de como usar la funcion call para hacer una solicitud POST
  var postUrl = 'https://api.example.com/post';
  var postData = {'key': 'value'};
  var responsePost = await apiUtils.call(postUrl, method: 'POST', data: postData);
  print(responsePost);
}
*/