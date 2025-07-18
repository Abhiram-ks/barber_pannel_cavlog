import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:barber_pannel/core/cloudinary/cloudinary_config.dart';
import 'dart:io';

class CloudinaryService {
  Future<String?> uploadImage(File imageFile)async{
    try {
      final url = Uri.parse("https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/image/upload");

     final request = http.MultipartRequest("POST", url)
      ..fields['upload_preset'] = 'abhiram_ks'
      ..fields['folder'] = 'cavlog/banner'
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));
      
     final response = await request.send();
      if(response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        return jsonResponse['secure_url'] as String?;
      }else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

    Future<String?> uploadWebImage(Uint8List imageBytes) async {
    try {
      final url = Uri.parse("https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/image/upload");

      final request = http.MultipartRequest("POST", url)
        ..fields['upload_preset'] = 'abhiram_ks'
        ..fields['folder'] = 'cavlog/banner'
        ..files.add(http.MultipartFile.fromBytes('file', imageBytes, filename: 'upload.jpg'));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        return jsonResponse['secure_url'] as String?;
      } else {
        debugPrint("Web upload failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Web upload failed with error: $e");
      return null;
    }
  }
}

