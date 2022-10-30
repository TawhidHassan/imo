import 'dart:io';
import 'dart:io' as io;
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class VideoDataSave{

  Future storeTokenUserdata(Box? users,String? id) async{
    users?.put("deviceid", id);
    Logger().i(id);
  }


  double progress = 0.0;



  Future<String> getFilePathx(String filename,String folderName) async {
    final directory = await getApplicationDocumentsDirectory();
    // Logger().i(directory.path);
    return  createAppFolderx(folderName).then((value) =>  "${directory.path}/"+"SifatVideo/"+folderName+"/$filename");
    // print("${directory.path}/"+"SifatVideo/"+folderName+"/$filename");


  }
  Future createAppFolderx(String folderName) async {
    final directory = await getExternalStorageDirectory();
    final dirPath = '${directory?.path}/'+'SifatVideo/'+folderName ;
    // Logger().w(io.Directory("${directory?.path}/'+'SifatVideo/'+folderNa");
    await  Directory(dirPath);
  }



  Future<Directory> getAllFile(String folderName)async{

    final directory = await getApplicationDocumentsDirectory();
    // Logger().w(io.Directory("${directory.path}/"+'SifatVideo/'+folderName+"/").listSync(recursive: true));

    return io.Directory("${directory.path}/"+'SifatVideo/'+folderName+"/");
  }




  ///================================================================================================================================================================
  ///================================================================================================================================================================
  ///================================================================================================================================================================
  ///================================================================================================================================================================
  ///================================================================================================================================================================



  Future<bool> checkFilePath(String folderName,String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    if(await File("${directory.path}/SifatVideo/$folderName/$filename").exists()){
      print("File exists");
    }else{
      print("File don't exists");
    }
    print("${directory.path}/SifatVideo/$folderName/$filename");
    return await File("${directory.path}/SifatVideo/$folderName/$filename").exists();
  }

  Future<String> getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    createAppFolder();
    print("${directory.path}/sifatVideos/$filename");
    return "${directory.path}/sifatVideos/$filename";
  }

  void createAppFolder() async {
    final directory = await getExternalStorageDirectory();
    final dirPath = '${directory?.path}/sifatVideos' ;
    await  Directory(dirPath);
  }








  Future deleteFile(String? nameFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final myDir =io.Directory("${directory.path}/sifatVideos/"+nameFile!).deleteSync(recursive: true);
  }

  Future deleteFolder(String? nameFolder) async {
    Directory?  dir = await getApplicationDocumentsDirectory();
    Directory myDir = Directory(dir.path + "/"+nameFolder!);
    Logger().i(myDir);
    if(myDir.existsSync()){
      myDir.deleteSync(recursive: true);
    }


  }


}