import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ta/components/expense_summary.dart';
import 'package:ta/components/expense_tile.dart';
import 'package:ta/data/expense_data.dart';
import 'package:ta/models/expense_item.dart';
import 'package:ta/widgets/bottom_nav.dart';

class HomePageMonth extends StatefulWidget {
  const HomePageMonth({super.key});

  @override
  State<HomePageMonth> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMonth>
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                  softWrap: true,
                  maxLines: 3,
                ),
                Text(
                  'Arfa',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[100],
        floatingActionButton: FloatingActionButton(
          onPressed: addPengeluaran,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            child: Text("Weekly"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //
                          },
                          child: Text('Monthly'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Histori Transaksi",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
