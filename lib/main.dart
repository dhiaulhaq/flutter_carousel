import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  //Variable Inititaion
  final _favoriteImage = {
    {
      'name': 'Bantimurung',
      'image': 'images/bantimurung.jpg',
      'cat': 'Air Terjun',
      'open': '09.00-17.00 WITA'
    },
    {
      'name': 'Pantai Bira',
      'image': 'images/bira.jpg',
      'cat': 'Wisata Bahari',
      'open': '06.00-21.00 WITA'
    },
    {
      'name': 'Malino',
      'image': 'images/malino.jpg',
      'cat': 'Wisata Alam',
      'open': '09.00-17.00 WITA'
    },
    {
      'name': 'Pantai Losari',
      'image': 'images/pantai-losari.jpg',
      'cat': 'Landmark',
      'open': '06.00-17.00 WITA'
    },
    {
      'name': 'Tana Toraja',
      'image': 'images/toraja.jpg',
      'cat': 'Wisata Budaya',
      'open': '09.00-17.00 WITA'
    },
  }.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //1. Profile Area
                    profileArea(),

                    //2. Description
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Live with no excuses and travel with no regrets, Oscar Wild',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    //3. Listview Carousel
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Favorite Places',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView.separated(
                          physics: PageScrollPhysics(),
                          separatorBuilder: (context, index) => Divider(indent: 3),
                          scrollDirection: Axis.horizontal,
                          itemCount: _favoriteImage.length,
                          itemBuilder: (context, index) => favoritePlace(index),
                        ),
                      ),
                    ),

                    //4. Information
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10),
                    //   padding: const EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(width: 0.5, color: Colors.grey),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: Column(
                    //     children: <Widget>[
                    //       Row(
                    //         children: <Widget>[
                    //           Padding(
                    //             padding: const EdgeInsets.only(right: 8.0),
                    //             child: Icon(
                    //               Icons.info_outline,
                    //               color: Colors.red,
                    //             ),
                    //           ),
                    //           Text(
                    //             'Informasi',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 20,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Divider(),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 5),
                    //         child: Text(
                    //           'Jangan membuang sampah sekecil apapun selama berada dilokasi pariwisata, cagar budaya dan cagar alam adalah miliki bersama, maka lestarikanlah.',
                    //           style: TextStyle(color: Colors.grey),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    //5. Category Tab
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Wisata Alam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              Icon(Icons.check_circle, color: Colors.red),
                            ],
                          ),
                          Text('Wisata Budaya', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text('Wisata Kuliner', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        ],
                      ),
                    ),

                    Divider(),

                    //6. Carousel Page View
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value){
                          setState(() {
                            _currentSlide = value;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) => slideShow(index),
                        itemCount: 3,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Partial Widget
  profileArea(){
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network('https://avatars0.githubusercontent.com/u/19872458?s=460&v=4',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dhiaulhaq',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('Tokopedia'),
          ],
        ),
        Spacer(
          flex: 2,
        ),
        Icon(
          Icons.menu,
          size: 50,
        ),
      ],
    );
  }

  favoritePlace(index){
    return SizedBox(
      height: 80,
      width: 250,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    _favoriteImage[index]['image'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _favoriteImage[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _favoriteImage[index]['cat'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    _favoriteImage[index]['open'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  slideShow(int index){
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _images[index],
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  PageController _pageController;
  int _currentSlide = 1;
  final _images = ['images/56.jpg', 'images/60.jpg', 'images/71.jpg'];

  @override
  void initState(){
    _pageController = PageController(
      initialPage: _currentSlide,
      keepPage: false,
      viewportFraction: 5.0,
    );
    super.initState();
  }

}
