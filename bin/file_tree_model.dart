import 'dart:io';

import 'params.dart';
import 'widget_info.dart';



class FileTreeBranch{
  
    Map<String, dynamic> branchFiles={};
    Map<String, FileTreeBranch> branchDirs ={};

    FileTreeBranch();

    addBranchDir(String dirName)=>
      branchDirs[dirName]= FileTreeBranch();

    addBranchFile(String fileName, dynamic widgetInfo)=>
       branchFiles[fileName]=widgetInfo;
}



class FileTreeRoot {
  String dirPath;
  String importPath;
  Map<String, dynamic> rootFiles={};
  Map<String, FileTreeBranch> branchDirs ={};
  // Library

  FileTreeRoot({this.dirPath, this.importPath});

  addRootFile(String fileName, dynamic widgetInfo)=>
    rootFiles[fileName]=widgetInfo;
  addBranchDirs(List<String> dirs){
    dirs.forEach((d)=>branchDirs[d]= FileTreeBranch());
  }
  addBranchDir(String dirName)=>
    branchDirs[dirName]= FileTreeBranch( );

  String getPackagePath({String fileName, String dirName=""}){
    if(dirName!="" && branchDirs.containsKey(dirName)){
      if(branchDirs[dirName].branchFiles.containsKey(fileName)){
        return "$importPath/$dirName/$fileName";
      }
    }
    if(rootFiles.containsKey(fileName))return "$importPath/$fileName";
    String out="";
    branchDirs.forEach((branchName, branch){
      if(branch.branchFiles.containsKey(fileName)){
        out="$importPath/$dirName/$fileName";
        return;
      } 
    });
    return out;
  }
  List<Param> getParams({String fileName, String dirName=""}){
    if(dirName!="" && branchDirs.containsKey(dirName)){
      if(branchDirs[dirName].branchFiles.containsKey(fileName)){
        return branchDirs[dirName].branchFiles[fileName].params;
      }
    }
    if(rootFiles.containsKey(fileName))return rootFiles[fileName].params;

    List<Param> p=[];
    branchDirs.forEach((branchName, branch){
      if(branch.branchFiles.containsKey(fileName)){
        p=branch.branchFiles[fileName].params;
        return;
      } 
    });
    return p;
  }


  create(){
    rootFiles.forEach((filename, fileInfo){
      String imports= addImports(fileInfo.packages);
      createFile(fileInfo.build(imports), "$dirPath/$filename.dart");
    });
    

    branchDirs.forEach((branchName, branchFileTree)=>createBranch(branchName, branchFileTree));
  }

  createBranch(branchName, branchFileTree){
    createDirectory(branchName);
    // branchFileTree.branchDirs?.forEach((childBranchName, childBranchFileTree){
    //    createBranch("$branchName/$childBranchName", childBranchFileTree);
    // });

    branchFileTree.branchFiles?.forEach((branchFileName, branchFileInfo){
      String imports= addImports(branchFileInfo.packages);
      createFile(branchFileInfo.build(imports), "$dirPath/$branchName/$branchFileName.dart");
    });
    
  }
  createDirectory(String path){
    if(!Directory("$dirPath/$path").existsSync()){
      Directory("$dirPath/$path").createSync(recursive: true);
    }  
  }
  createFile(String code, String path){
    File(path)..createSync(recursive: true)..writeAsStringSync(code);
  }


  String addImports(List<PacMan> filePackages){
    String out="";
    filePackages.forEach((p){
      String s = p.dirName;
      if (p.local){
        s= getPackagePath(fileName:p.fileName, dirName:p.dirName);
      }
      if (p.asIs)out+="import '$s';\n";
      else out+="import '$s.dart';\n";
    });
    return out;
  }
 

}


