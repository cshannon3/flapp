import "package:singing_app/data_manager/models/userRecording.dart";
import "package:singing_app/data_manager/models/song.dart";
import "package:singing_app/data_manager/models/note.dart";
import "package:singing_app/data_manager/sources/localdb.dart";


import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DataManager {

  AppDatabase appDB = AppDatabase.get();
  DataManager();

    Future<List<UserRecordingModel>> getUserRecordingModels() async{
      List<UserRecordingModel> em = await appDB.getUserRecordingModels();
      if(em.isEmpty && initialUserRecordingModels.isNotEmpty){await appDB.addUserRecordingModels(initialUserRecordingModels); return initialUserRecordingModels;}
      return em;
    }
    addUserRecordingModel(UserRecordingModel newUserRecordingModel) async{
      await appDB.addUserRecordingModel(newUserRecordingModel);return;
    }
    
    Future<List<SongModel>> getSongModels() async{
      List<SongModel> em = await appDB.getSongModels();
      if(em.isEmpty && initialSongModels.isNotEmpty){await appDB.addSongModels(initialSongModels); return initialSongModels;}
      return em;
    }
    addSongModel(SongModel newSongModel) async{
      await appDB.addSongModel(newSongModel);return;
    }
    
    Future<List<NoteModel>> getNoteModels() async{
      List<NoteModel> em = await appDB.getNoteModels();
      if(em.isEmpty && initialNoteModels.isNotEmpty){await appDB.addNoteModels(initialNoteModels); return initialNoteModels;}
      return em;
    }
    addNoteModel(NoteModel newNoteModel) async{
      await appDB.addNoteModel(newNoteModel);return;
    }
    


}

