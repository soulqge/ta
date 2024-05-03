import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta/data/expense_data.dart';
import 'package:ta/graph/bar_graph_week.dart';
import 'package:ta/helper/date_time_helper.dart';

class ExpenseSummaryMonth extends StatelessWidget {
  final DateTime awalMinggu;
  const ExpenseSummaryMonth({super.key, required this.awalMinggu});

  double calculateMax(
    ExpenseData value, 
    String senin,
    String selasa,
    String rabu,
    String kamis,
    String jumat,
    String sabtu,
    String minggu,
    ){
      double? max = 100000;

      List<double> values = [
        value.hitungPengeluaranHarian()[senin] ??0,
        value.hitungPengeluaranHarian()[selasa] ??0,
        value.hitungPengeluaranHarian()[rabu] ??0,
        value.hitungPengeluaranHarian()[kamis] ??0,
        value.hitungPengeluaranHarian()[jumat] ??0,
        value.hitungPengeluaranHarian()[sabtu] ??0,
        value.hitungPengeluaranHarian()[minggu] ??0,
      ];
      values.sort();
      max = values.last * 1.1;

      return max == 0 ? 100 : max;
    }

  String calculateMonthlyTotal(ExpenseData value) {
  Map<String, double> rangkumanPengeluaranBulanan = value.hitungPengeluaranBulanan();
  double total = 0;
  for (var entry in rangkumanPengeluaranBulanan.entries) {
    total += entry.value;
  }
  return total.toStringAsFixed(2);
}

  @override
  Widget build(BuildContext context) {
    String senin = convertDateTime(awalMinggu.add(const Duration(days: 0)));
    String selasa = convertDateTime(awalMinggu.add(const Duration(days: 1)));
    String rabu = convertDateTime(awalMinggu.add(const Duration(days: 2)));
    String kamis = convertDateTime(awalMinggu.add(const Duration(days: 3)));
    String jumat = convertDateTime(awalMinggu.add(const Duration(days: 4)));
    String sabtu = convertDateTime(awalMinggu.add(const Duration(days: 5)));
    String minggu = convertDateTime(awalMinggu.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 25.0, bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                Text("Weekly Total: ", style: TextStyle(fontWeight: FontWeight.bold,),),
                Text("\Rp. "+ calculateMonthlyTotal(value))
                ],
            ),
          ),
          SizedBox(
            height: 200,
            child: BarGraph(
              maxY: 100000,
              jSen: value.hitungPengeluaranHarian()[senin] ?? 0, 
              jSel: value.hitungPengeluaranHarian()[selasa] ?? 0, 
              jRab: value.hitungPengeluaranHarian()[rabu] ?? 0, 
              jKam: value.hitungPengeluaranHarian()[kamis] ?? 0, 
              jJum: value.hitungPengeluaranHarian()[jumat] ?? 0, 
              jSab: value.hitungPengeluaranHarian()[sabtu] ?? 0, 
              jMin: value.hitungPengeluaranHarian()[minggu] ?? 0,
          
              ),
          ),
        ],
      ),
    );
  }
}