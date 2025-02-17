import 'package:flutter/material.dart';
import 'package:tubes_kel3/models/item.dart';
import 'package:tubes_kel3/data/data_detail.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/pages/riwayatmodal.dart';

class CardWidget extends StatelessWidget {
  final List<Item> items;

  const CardWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Menampilkan 2 item per baris
          childAspectRatio: 3.7, // Mengatur rasio lebar-tinggi item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(item: item);
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Navigator.pushNamed(context, '/item', arguments: item);
      },
      child: Card(
        color: Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: Image.network(item.imageUrl),
          title: Text(
            item.nama,
            style: SafeGoogleFont(
              'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.5999999728,
              color: Color(0xff4a4a4a),
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                item.tanggalsc,
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
                ),
              ),
              SizedBox(width: 8),
              Text(
                item.waktusc,
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
                ),
              ),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              _showDetailDialog(context);
            },
            child: Image.asset(
              'assets/images/ep-arrow-up.png',
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 297,
            height: 560,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Detail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8,
                          top: 8), // Tambahkan margin bawah dan margin kanan
                      child: buildInfoRowWithSizedBox('id', '0'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8,
                          top: 8), // Tambahkan margin bawah dan margin kanan
                      child: buildInfoRowWithSizedBox('NIM', '2141720143'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child: buildInfoRowWithSizedBox(
                          'Nama', 'Muhammad Ega Rama Fernanda'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child: buildInfoRowWithSizedBox(
                          'Tempat/Tgl Lahir', 'Malang, 12-07-2002'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child: buildInfoRowWithSizedBox(
                          'Prodi', 'D-IV T. Informatika'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child:
                          buildInfoRowWithSizedBox('Alamat', 'JL. Mawar NO.39'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child: buildInfoRowWithSizedBox(
                          'Kecamatan', '1/3 Penataban Giri'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 8), // Tambahkan margin bawah
                      child:
                          buildInfoRowWithSizedBox('Kabupaten', 'Banyuwangi'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  // Rest of the code...
}
