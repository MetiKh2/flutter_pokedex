import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final pokemonDetails;
  final Color color;
  final int heroTag;

  const DetailScreen(
      {super.key,
      required this.pokemonDetails,
      required this.color,
      required this.heroTag});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.color,
        body: Stack(children: [
          Positioned(
            top: 20,
            left: -5,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          Positioned(
            child: Text(
              widget.pokemonDetails['name'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            top: 70,
            left: 5,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              right: -10,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                fit: BoxFit.fitHeight,
              )),
         
          Positioned(
              top: 110,
              left: 22,
              child: Container(child: 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.pokemonDetails['type'].join(", "),style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.left,),
              ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              
              )
          ),      Positioned(
            bottom: 0,
            child: Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  children: [
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Name', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.pokemonDetails['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Height', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.pokemonDetails['height'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Weight', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.pokemonDetails['weight'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Spawn Time', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.pokemonDetails['spawn_time'], style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Weakness', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: Text(widget.pokemonDetails['weaknesses'].join(", "), style: TextStyle(color: Colors.black, fontSize: 17),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Pre Evolution', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                              child: widget.pokemonDetails['prev_evolution'] != null ?
                              SizedBox(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.pokemonDetails['prev_evolution'].length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(widget.pokemonDetails['prev_evolution'][index]['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
                                    );
                                  },
                                ),
                              ): Text("Just Hatched", style: TextStyle(color: Colors.black, fontSize: 17),)
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Next Evolution', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                          ),
                          Container(
                            child: widget.pokemonDetails['next_evolution'] != null ?
                                SizedBox(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.pokemonDetails['next_evolution'].length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: const EdgeInsets.only(right:8.0),
                                        child: Text(widget.pokemonDetails['next_evolution'][index]['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
                                      );
                                    },
                                  ),
                                ): Text("Maxed Out", style: TextStyle(color: Colors.black, fontSize: 17),)
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), Positioned(
            top: (MediaQuery.of(context).size.height * 0.2),
            left: (MediaQuery.of(context).size.width / 2) ,
            child: Hero(
              tag: widget.heroTag,
              child: Image.network(
                widget.pokemonDetails['img'],
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
