# counter_7

# Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak merubah atau immutable. Penampilan serta propertinya tidak berubah selama widget itu masih ada. Widget ini tidak bergantung pada perubahan data atau perilaku app. Dalam satu kata, stateless widget itu STATIK. Sebagai contoh adalah Text, Icon, dan RaisedButton.

Stateful widget adalah widget yang berubah saat runtime atau mutable. Widget tipe ini bisa dirender berulang kali dalam satu lifetime dan bisa merubah penampilannya berdasarkan event. Dalam satu kata, stateful widget itu DINAMIS. Sebagai contoh adalah Checkbox, Radio Button, Slider, TextField.


# Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
MaterialApp. Widget yang membungkus sejumlah widget lain untuk keperluan aplikasi Material Design.

AppBar. Berguna untuk bikin toolbar, menulis judul, menambahkan tombol, dan lain-lain.

Text. Berguna untuk menampilkan sebuah text.

Scaffold. Berguna untuk mengimplementasikan basic Material Design visual layout structure.

Center. Berguna untuk memusatkan child di dalam dirinya sendiri.

Column. Layout child dalam bentuk list secara vertikal.

RowLayout child dalam bentuk list secara horizontal.

FloatingActionButton. Tombol berbentuk lingkaran yang "mengambang"

Container. Widget yang menggabungkan properti, posisi, dan ukuran umum dari sebuah widget.


# Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berguna untuk melakukan rebuild dari stateful widget dan anak-anaknya. Variabel yang terdampak tergantung dari pemanggilan setState() tersebut. Contoh pada fungsi _incrementCounter(), saya memanggil setState dan didalamnya increment counter serta set visibility ke true. Maka yang terdampak adalah kedua variabel tersebut.


# Jelaskan perbedaan antara const dengan final.
final merupakan keyword yang digunakan untuk hardcode nilai yang tidak akan diubah di masa depan. Disarankan untuk menggunakan final jika kita tidak tahu nilai tersebut di compile time.

keyword const mirip seperti final namun variabel dengan keyword const itu KONSTANT di compile-time saja. const akan membuat object tersebut frozen dan immutable.


# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
## Tombol + menambahkan angka sebanyak satu satuan.
increment variabel _counter
```dart
void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

```

## Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.
Jika _counter == 1 maka decrement menjadi 0. Jika sudah 0 maka tetap.
```dart
  void _decrementCounter() {
    setState(() {
    if (_counter == 1) {
      _counter--;
    } else if (_counter > 1) {
      _counter--;
    } else {
      _counter = _counter;
    }
    });
  }
```


## Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.
```dart
  Widget getText() {

    const ganjil = Text('GANJIL', style: TextStyle(color: Colors.blue));
    const genap = Text('GENAP', style: TextStyle(color: Colors.red));

    if (_counter % 2 == 0) {
      return genap;
    } else {
      return ganjil;
    }
  }
```
## Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0.
Tambahkan Visiblity di FAB nya. Jika _counter = 0, is_Visible akan jadi false sehingga FAB yang tombol minus akan hilang

```dart
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: _isVisible,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: const Icon(Icons.remove)
              ),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
```

# Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
Pertama perlu dipahami bahwa navigator di Flutter itu mirip dengan struktur data stack. Sehingga, sesuai namanya, push akan melakukan "push" rute yang dipush tersebut. Sedangkan, pushReplacement akan mengganti route navigator dengan melakukan "push" rute baru lalu membuang rute yang sebelumnya setelah rute baru tersebut selesai loading.

# Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
Selain yang sudah dituliskan pada pertanyaan diatas, kini saya menggunakan widget-widget baru seperti

ListView. Berfungsi untuk menampilkan children scara scrolling.
ListTile. Berfungsi untuk menampilkan detail dari sebuah children dari ListView. Di app saya digunakan untuk menampilkan data budget serta untuk navigasi ke page lain.
Drawer. Berfungsi sebagai menu untuk navigasi antara page yang ada.
SizedBox. Sebuah box dengan ukuran tertentu. Berfungsi untuk memberikan jarak antara widget-widget di app saya.

# Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)
onPressed. Kode dalam event onPressed akan tereksekusi ketika sebuah tombol di klik. 
onHover. Kode dalam event ini akan tereksekusi ketika pointer bergerak dalam sebuah tombol (tapi tidak di klik)
onFocusChange. Kode dalam event ini akan tereksekusi ketika fokus berubah.
onChanged. Kode dalam event ini akan tereksekusi dalam TextField ketika user melakukan insert atau delete sebuah text.
onTap. Sebenarnya mirip dengan onPressed. Namun onPressed cenderung hanya untuk button sedangkan onTap untuk gestur apapun.
onSaved. Kode dalam event ini akan tereksekusi ketika nilai final dari form disimpan melalui FormState.save.

# Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Halaman-halaman lain dalam Flutter itu dinamakan "rute". Seperti dikatakan sebelumnya, navigator pada Flutter itu serupa dengan implementasi Stack. Hal ini berguna jika misalnya dari sebuah halaman tertentu, kita bisa kembali ke halaman sebelumnya dengan menggunakan tombol back. Sebagai contoh, misal ada dua halaman yakni A dan B. Default kita sudah di halaman A maka A sudah di dalam stack. Dari A, kita navigasi ke B dengan memencet sebuah tombol. Hal tersebut akan melakukan "push" untuk halaman B ke dalam stack. Sehingga stack kita sekarang A-B dengan B yang ditampilkan. Ketika ingin back ke halaman A, sama saja seperti kita melakukan "pop" dari stack tersebut.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
## Menambahkan drawer/hamburger menu pada app yang telah dibuat sebelumnya
Dengan potongan kode ini, lalu tinggal tambah navigasi untuk setiap halaman/rute.
```dart
Drawer(
  child: Column(
    children: [
      // Menambahkan clickable menu
    ],
  ),
),
```

## Menambahkan tiga tombol navigasi pada drawer/hamburger.
### Navigasi pertama untuk ke halaman counter.
```dart
ListTile(
  title: const Text('counter_7'),
  onTap: () {
    // Route menu ke halaman utama
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                data: widget.data,
                tambahData: widget.tambahData,
              )),
    );
  },
),
```
### Navigasi kedua untuk ke halaman form.
```dart
ListTile(
  title: const Text('Tambah Budget'),
  onTap: () {
    // Route menu ke halaman form
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyFormPage(
                data: widget.data,
                tambahData: widget.tambahData,
              )),
    );
  },
),
```

### Navigasi ketiga untuk ke halaman yang menampilkan data budget yang telah di-input melalui form.
```dart
ListTile(
  title: const Text('Data Budget'),
  onTap: () {
    // Route menu ke halaman form
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyDataPage(
                data: widget.data,
                tambahData: widget.tambahData,
              )),
    );
  },
),
```

## Menambahkan halaman form
### Menambahkan elemen input dengan tipe data String berupa judul budget.
```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Judul",
    labelText: "Judul",
    // Menambahkan icon agar lebih intuitif
    icon: const Icon(Icons.title),
    // Menambahkan circular border agar lebih rapi
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  // Menambahkan behavior saat nama diketik
  onChanged: (String? value) {
    setState(() {
      _judul = value!;
    });
  },
  // Menambahkan behavior saat data disimpan
  onSaved: (String? value) {
    setState(() {
      _judul = value!;
    });
  },
  // Validator sebagai validasi form
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Judul tidak boleh kosong!';
    }
    return null;
  },
),
```
### Menambahkan elemen input dengan tipe data int berupa nominal budget.
```dart
TextFormField(
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ],
  decoration: InputDecoration(
    hintText: "Nominal",
    labelText: "Nominal",
    // Menambahkan icon agar lebih intuitif
    icon: const Icon(Icons.numbers),
    // Menambahkan circular border agar lebih rapi
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  // Menambahkan behavior saat nama diketik
  onChanged: (String? value) {
    // String _nominal = _nominalController.text;
    // int.parse(_nominal);
    setState(() {
      _nominal = value!;
    });
  },
  // Menambahkan behavior saat data disimpan
  onSaved: (String? value) {
    // String _nominal = _nominalController.text;
    // int.parse(_nominal);
    setState(() {
      _nominal = value!;
    });
  },
  // Validator sebagai validasi form
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Nominal tidak boleh kosong!';
    }
    return null;
  },
),
```
### Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran.
```dart
ListTile(
  leading: const Icon(Icons.class_),
  title: const Text(
    'Pilih Jenis',
  ),
  trailing: DropdownButton(
    value: tipeBudget,
    icon: const Icon(Icons.keyboard_arrow_down),
    items: listTipeBudget.map((String items) {
      return DropdownMenuItem(
        value: items,
        child: Text(items),
      );
    }).toList(),
    onChanged: (String? newValue) {
      setState(() {
        tipeBudget = newValue!;
      });
    },
  ),
),
```

### Menambahkan button untuk menyimpan budget.
```dart
TextButton(
  child: const Text(
    "Simpan",
    style: TextStyle(color: Colors.white),
  ),
  style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all(Colors.blue),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var intNominal = int.parse(_nominal);
      widget.tambahData(
        dataBudget(
            _judul, intNominal, tipeBudget, tanggal),
      );

      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: Container(
              child: ListView(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20),
                shrinkWrap: true,
                children: <Widget>[
                  Center(
                      child:
                          const Text('Informasi Data')),
                  SizedBox(height: 20),
                  // TODO: Munculkan informasi yang didapat dari form
                  Text('Judul: $_judul'),
                  Text('Nominal: $_nominal'),
                  Text('Tipe: $tipeBudget'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  },
),
```
## Menambahkan halaman data budget
```dart
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key, required this.data, required this.tambahData});
  final List<dataBudget> data;
  final Function(dataBudget) tambahData;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),

      // Menambahkan drawer menu
      drawer: PublicDrawer(
        data: widget.data,
        tambahData: widget.tambahData,
      ),

      body: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            var budgetTitle = widget.data[index].judul;
            var date = widget.data[index].tanggal;
            return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                  side: const BorderSide(color: Colors.black, width: 0.3),
                ),
                trailing: Text(widget.data[index].jenisBudget),
                subtitle: Text(widget.data[index].nominal.toString()),
                
                title: Text('$budgetTitle - $date'));
                // title: Text('f');
          }),
    );
  }
}
```

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Tentu bisa saja tapi tidak saya rekomendasi karena model itu akan memudahkan pekerjaan kita nanti. Selain dari struktur yang lebih rapih, menggunakan model juga akan memastikan tipe data setiap field model kita sesuai. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
SafeArea. Berguna untuk memberi padding yang cukup pada childnya untuk mencegah gangguan dari operating system.
Checkbox. Input form dalam bentuk centang kotak. Bernilai True jika dicentang, dan False jika tidak. Di konteks tugas ini berguna untuk menentukan apabila sebuah film punya status "watched" atau not watched"
Row. Menampilkan children dalam array secara horizontal

Selain itu semua widget sudah dijelaskan di tugas-tugas sebelumnya :D
## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Pertama data json didapatkan dengan melakukan fetch pada method yang ada di file fetchMyWatchlist.dart. Setelah itu, data yang telah di fetch akan di convert berdasarkan kode yang ada di model/mywatchlist.dart.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist.
```dart
ListTile(
  title: const Text('My Watch List'),
  onTap: () {
    // Route menu ke halaman form
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyWatchlistPage(
                data: widget.data,
                tambahData: widget.tambahData,
              )),
    );
  },
),
```
### Membuat satu file dart yang berisi model mywatchlist.
Create new file "mywatchlist.dart"
### Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya (Tugas 3).
Endpoint JSON dari https://tugas-2-pbp-arkan.herokuapp.com/mywatchlist/json/
Implementasi nya itu seluruh file mywatchlist.dart

### Membuat navigasi dari setiap judul watch list ke halaman detail
```dart
onTap: () {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MoviePage(
            data: widget.data,
            tambahData: widget.tambahData,
            watched:
                snapshot.data![index].fields.watched,
            title: snapshot.data![index].fields.title,
            rating:
                snapshot.data![index].fields.rating,
            releaseDate: snapshot
                .data![index].fields.releaseDate,
            review:
                snapshot.data![index].fields.review,
          )));
},
```
### Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum).
```dart
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MoviePage extends StatelessWidget {
  const MoviePage(
      {super.key,
      required this.data,
      required this.tambahData,
      required this.watched,
      required this.title,
      required this.rating,
      required this.releaseDate,
      required this.review});

  final List<dataBudget> data;
  final Function(dataBudget) tambahData;
  final bool watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  @override
  Widget build(BuildContext context) {
    var date = releaseDate.toString().substring(0, 10);
    var ratingStr = rating.toString();
    var watchedStr;
    if (watched) {
      watchedStr = 'watched';
    } else {
      watchedStr = 'not watched';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(
          data: data,
          tambahData: tambahData,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            )),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Rating: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$rating/5'),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(watchedStr),
            ]),
            const SizedBox(height: 20.0),
            Text('Review:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(review),
            Spacer(),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    ))),
          ],
        ));
  }
}

```

### Menambahkan tombol untuk kembali ke daftar mywatchlist
```dart
Container(
  margin:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        onPressed: (() {
          Navigator.pop(context);
        }),
        child: Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.blue)),
      ))),
```
