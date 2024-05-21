import 'package:TrackTheSpend/graph/bar_graph_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:TrackTheSpend/components/expense_summary.dart';
import 'package:TrackTheSpend/components/expense_tile.dart';
import 'package:TrackTheSpend/data/expense_data.dart';
import 'package:TrackTheSpend/models/expense_item.dart';
import 'package:TrackTheSpend/navbar/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final nPengeluaranController = TextEditingController();
  final jPengeluaranController = TextEditingController();
  late TabController tabController;
  

  @override
  void initState() {
    super.initState();
    // prepare data at startup
    Provider.of<ExpenseData>(context, listen: false).prepareData();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void addPengeluaran() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Tambah Pengeluaran"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nPengeluaranController,
              decoration: InputDecoration(hintText: 'Jenis Pengeluaran'),
            ),
            TextField(
              controller: jPengeluaranController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Jumlah Pengeluaran'),
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: batal,
            child: Text('Batal'),
          ),
          MaterialButton(
            onPressed: tambah,
            child: Text('Tambah'),
          )
        ],
      ),
    );
  }

  void hapus(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).delExpense(expense);
  }

  void tambah() {
    ExpenseItem pengeluaranBaru = ExpenseItem(
        nama: nPengeluaranController.text,
        jumlah: jPengeluaranController.text,
        tanggal: DateTime.now());
    Provider.of<ExpenseData>(context, listen: false)
        .addExpense(pengeluaranBaru);

    Navigator.pop(context);

    clear();
  }

  void batal() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    nPengeluaranController.clear();
    jPengeluaranController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                '${DateFormat('EEEE, MMMM d, y').format(DateTime.now())}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
          backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          onPressed: addPengeluaran,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Theme.of(context).colorScheme.background,
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ExpenseSummary(awalMinggu: value.awalMingguHari()),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Histori Transaksi",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: (context, index) => ExpenseTile(
                        nama: value.getAllExpenseList()[index].nama, 
                        jumlah: value.getAllExpenseList()[index].jumlah,
                        tanggal: value.getAllExpenseList()[index].tanggal,
                        deleteTapped: (p0) =>
                            hapus(value.getAllExpenseList()[index]),
                      )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(selectedItem: 0),
      ),
    );
  }
}
