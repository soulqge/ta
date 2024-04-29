import 'package:flutter/material.dart';
import 'package:ta/data/hive_database.dart';
import 'package:ta/helper/date_time_helper.dart';
import 'package:ta/models/expense_item.dart';

class ExpenseData extends ChangeNotifier{

  //list pengeluaran
  List<ExpenseItem> listPengeluaranKeseluruhan = [];

  //ambil list pengeluaran
  List<ExpenseItem> getAllExpenseList(){
    return listPengeluaranKeseluruhan;
  }

  final db = HiveDataBase();
  void prepareData(){
    if(db.readData().isNotEmpty){
      listPengeluaranKeseluruhan = db.readData();
    }
  }

  //tambah pengeluaran
  void addExpense(ExpenseItem pengeluaranBaru){
    listPengeluaranKeseluruhan.add(pengeluaranBaru);

    notifyListeners();
    db.savedData(listPengeluaranKeseluruhan); 
  }

  //hapus pengeluaran
  void delExpense(ExpenseItem pengeluaran){
    listPengeluaranKeseluruhan.remove(pengeluaran);

    notifyListeners();
    db.savedData(listPengeluaranKeseluruhan); 

  }

  //ambil hari
  String ambilHari(DateTime hari){
    switch (hari.weekday.toInt()) {
      case 1:
        return 'sen';
      case 2:
        return 'sel';
      case 3:
        return 'rab';
      case 4:
        return 'kam';
      case 5:
        return 'jum';
      case 6:
        return 'sab';
      case 7:
        return 'min'; 
      default:
      return '';
    }
  }

  //ambil data untuk awal minggu (hari senin)
  DateTime awalMingguHari(){
    DateTime? awalMinggu;
    DateTime today = DateTime.now();

    for (int i = 0; i <7; i++){
      if(ambilHari(today.subtract(Duration(days: i))) == 'sen'){
        awalMinggu = today.subtract(Duration(days: i));
        break;
      }
    }

    return awalMinggu!;
  }
  //pengeluar harian

  Map<String, double> hitungPengeluaranHarian(){
    Map<String, double> rangkumanPengeluaranHarian = {

    };

    for (var pengeluaran in listPengeluaranKeseluruhan){
      String tanggalData = convertDateTime(pengeluaran.tanggal).toString();
      double jumlah = double.parse(pengeluaran.jumlah);

      if (rangkumanPengeluaranHarian.containsKey(tanggalData)){
        double jumlahSekarang = rangkumanPengeluaranHarian[tanggalData]!;
        jumlahSekarang += jumlah;
        rangkumanPengeluaranHarian[tanggalData] = jumlahSekarang;
      }
      else {
        rangkumanPengeluaranHarian.addAll({tanggalData: jumlah});
      }
    }

    return rangkumanPengeluaranHarian;
  }


}