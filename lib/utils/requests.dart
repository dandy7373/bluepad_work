import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> getData(int page)async{
  var url = Uri.parse('https://picsum.photos/v2/list?page=${page}&limit=10');
  
  Response response=await http.get(url);
  return response;
}