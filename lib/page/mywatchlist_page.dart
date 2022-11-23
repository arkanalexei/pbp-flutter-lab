import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/page/movie.dart';
import 'package:counter_7/fetchMyWatchlist.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage(
      {Key? key, required this.data, required this.tambahData})
      : super(key: key);
  final List<dataBudget> data;
  final Function(dataBudget) tambahData;

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late final Future finalFuture;
  @override
  void initState() {
    super.initState();
    finalFuture = fetchMyWatchlist();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Watch List'),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(
          data: widget.data,
          tambahData: widget.tambahData,
        ),
        body: FutureBuilder(
            future: finalFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: snapshot.data![index].fields.watched
                                        ? Colors.green
                                        : Colors.red,
                                    width: 2.5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.title}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: CheckboxListTile(
                                          value: snapshot
                                              .data![index].fields.watched,
                                          onChanged: (newVal) {
                                            setState(() {
                                              snapshot.data![index].fields
                                                      .watched =
                                                  !snapshot.data![index].fields
                                                      .watched;
                                              // watched = !watched;
                                            });
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
