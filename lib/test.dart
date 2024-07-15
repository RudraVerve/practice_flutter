import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> containerData = [
    {'image': 'assets/image/sale1.jpeg'},
    {'image': 'assets/image/sale2.webp'},
    {'image': 'assets/image/sale3.jpg'},
    {'image': 'assets/image/sale4.webp'},
    {'image': 'assets/image/sale5.jpg'},
  ];

  final List<Map<String, dynamic>> mostSelling = [
    {'image': 'assets/image/smartwatch.jpg', 'title': 'smartwa..', 'rating': 4.5, 'price': 80},
    {'image': 'assets/image/botEarbood.webp', 'title': 'Earbod', 'rating': 4.5, 'price': 50},
    {'image': 'assets/image/powerbank.jpg', 'title': 'PowerBank', 'rating': 3.8, 'price': 30},
    {'image': 'assets/image/mobiels.webp', 'title': 'Mobiles', 'rating': 4.2, 'price': 150},
    {'image': 'assets/image/musicplayer.jpg', 'title': 'MusicPl..', 'rating': 4.0, 'price': 70},
    {'image': 'assets/image/tomato.jpeg', 'title': 'tomato', 'rating': 4.0, 'price': 2},
    {'image': 'assets/image/apple.jpg', 'title': 'apple', 'rating': 4.5, 'price': 2},
    {'image': 'assets/image/kadu.jpg', 'title': 'pumpkin', 'rating': 3.8, 'price': 1},
    {'image': 'assets/image/onion.jpeg', 'title': 'onion', 'rating': 4.2, 'price': 1},
    {'image': 'assets/image/potato.jpeg', 'title': 'potato', 'rating': 4.0, 'price': 1},
  ];

  final List<Map<String, dynamic>> category = [
    {'image': 'assets/image/dressKidBoy.jpg', 'title': 'Dress For Boy',},
    {'image': 'assets/image/DressgirlKid.jpg', 'title': 'Dress For Girl',},
    {'image': 'assets/image/dressMan.jpg', 'title': 'Dress For Man',},
    {'image': 'assets/image/dressWomen.jpeg', 'title': 'Dress For Wom..',},
    {'image': 'assets/image/electronics.jpeg', 'title': 'electronics',},
    {'image': 'assets/image/fruit2.jpg', 'title': 'Fruits',},
    {'image': 'assets/image/grocery.jpg', 'title': 'grocery',},
  ];

  final List<Map<String, dynamic>> bestElectronics = [
    {'image': 'assets/image/smatwatch2.jpeg', 'title': 'Smart Watch',},
    {'image': 'assets/image/monitor.jpeg', 'title': 'Monitor',},
    {'image': 'assets/image/cemera.jpeg', 'title': 'Camera',},
    {'image': 'assets/image/botEarbood.webp', 'title': 'Boot Earbod',},
    {'image': 'assets/image/dron.jpg', 'title': 'Dron',},
    {'image': 'assets/image/gagetbox.jpg', 'title': 'Gaget Box',},
    {'image': 'assets/image/headphone.webp', 'title': 'Headphon',},
    {'image': 'assets/image/mobiels.webp', 'title': 'Mobiles',},
    {'image': 'assets/image/musicplayer.jpg', 'title': 'Music Player',},
    {'image': 'assets/image/powerbank.jpg', 'title': 'Power Bank',},
    {'image': 'assets/image/printer.jpeg', 'title': 'Printer',},
  ];

  final List<Map<String, dynamic>> bestFitness = [
    {'image': 'assets/image/domble.jpg', 'title': 'Dumble 8kg',},
    {'image': 'assets/image/domble2.webp', 'title': 'Dumble Pack',},
    {'image': 'assets/image/protin1.webp', 'title': 'Proten Shack',},
    {'image': 'assets/image/roler.jpg', 'title': 'GYM Roller',},
    {'image': 'assets/image/roler2.webp', 'title': 'GYM Roller',},
    {'image': 'assets/image/protin2.webp', 'title': 'Gk Gold',},
    {'image': 'assets/image/protin3.webp', 'title': 'GYM Proten',},
    {'image': 'assets/image/protin4.webp', 'title': 'MB Proten',},
    {'image': 'assets/image/roler3.webp', 'title': 'Manual Roller',},
  ];

  final List<Map<String, dynamic>> clients = [
    {'image': 'assets/image/feedback3.jpg', 'name': 'Alok Bharti','msg' : '"NextGen Online Shop is a pleasure to use. The website is fast, easy to navigate, and the personalized recommendations are spot on. I appreciate the detailed product descriptions and high-quality images. It’s my go-to for all my shopping needs!"'},
    {'image': 'assets/image/feedback3.jpeg', 'name': 'Rakash Polar','msg' : '""Shopping here has been great! The site is user-friendly and loads quickly. I love the personalized suggestions and the wide variety of products available. The detailed descriptions and clear images make it easy to shop with confidence."'},
    {'image': 'assets/image/feedback.jpeg', 'name': 'Laxmi narayan','msg' : '"NextGen Online Shop provides an excellent shopping experience. The navigation is intuitive, and the site loads quickly. The personalized recommendations are always relevant, and the product range is impressive. I highly recommend it!"'},
    {'image': 'assets/image/4673.png', 'name': 'Rudra Prakash Barik','msg' : '"I’m impressed with NextGen Online Shop. The site is easy to use, and the personalized recommendations make shopping so convenient. The product descriptions are detailed, and the images are high quality. It’s my favorite online store!"'},
  ];


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } else {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: containerData.length * 5,
                  itemBuilder: (context, index) {
                    final data = containerData[index % containerData.length];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8.0),
                      child: Image.asset(
                        data['image'],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Most Selling Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 280,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: mostSelling.length,
                itemBuilder: (context, index) {
                  final data = mostSelling[index];
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          data['image'],
                          fit: BoxFit.cover,
                          height: 64,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${data['price']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text(
                                  '${data['rating']}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom:12),
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,                                       // used for take space by it self and scrollable
              physics: NeverScrollableScrollPhysics(),          // used for take space by it self and scrollable
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: category.length,
              itemBuilder: (context, index) {
                final data = category[index];
                return InkWell(
                  onTap: (){

                  },
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(data['image']),
                            radius: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Center(
                            child: Text(
                              data['title'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Best Of Electronics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestElectronics.length,
                itemBuilder: (context, index) {
                  final data = bestElectronics[index % bestElectronics.length];
                  return Container(
                    width: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150, // Fixed width
                          height: 150, // Fixed height
                          child: Image.asset(
                            data['image'],
                            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
                          ),
                        ),
                        Text(data['title'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Best Of Fitness',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestFitness.length,
                itemBuilder: (context, index) {
                  final data = bestFitness[index % bestFitness.length];
                  return Container(
                    width: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150, // Fixed width
                          height: 150, // Fixed height
                          child: Image.asset(
                            data['image'],
                            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
                          ),
                        ),
                        Text(data['title'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 70,),
            Text(
              'What Our clients Say\'s',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'LibreBaskerville',
                fontSize: 25,
                color: Colors.deepOrange,
                decoration: TextDecoration.underline,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: clients.map((client) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage(client['image']),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          client['name'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          client['msg'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 70,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('About',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text('NextGen Online\nShop is your ultimate\ndestination for a seamless\nand enjoyable shopping\nexperience.')),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Contact Us',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('nextgen@gmail.com'),
                          ),
                          Text('+91 6371661504'),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.shopping_cart),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Social Med..',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Icon(Icons.facebook),
                          ),
                          Icon(Icons.home),
                          Icon(Icons.adb_sharp,)
                        ],
                      )
                    ],
                  ),
                  Text('@nextGen.Copyright.2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}