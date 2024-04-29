import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta/models/expense_item.dart';

class HiveDataBase{

  final _myBox = Hive.box("expense_db");

  //write data
  void savedData(List<ExpenseItem> allExpense){
    
    List<List<dynamic>> allExpensesFormatted =[];

    for( var expense in allExpense){
      //convert to list
      List<dynamic> expenseFormatted = [
        expense.nama,
        expense.jumlah,
        expense.tanggal
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    _myBox.put("ALL_EXPENSES", allExpensesFormatted);

  }

  //read data
  List<ExpenseItem> readData(){
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i=0; i < savedExpenses.length; i++){
      String nama = savedExpenses[i][0];
      String jumlah = savedExpenses[i][1];
      DateTime tanggal = savedExpenses[i][2]; // ambil data individu pengeluaran

      ExpenseItem expense = ExpenseItem(
        nama: nama, 
        jumlah: jumlah, 
        tanggal: tanggal
      ); //create expense item

      allExpenses.add(expense);
    }

    return allExpenses;
  }
}