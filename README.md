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

