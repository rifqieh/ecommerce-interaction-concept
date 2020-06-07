import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_interaction_concept/constant.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var colorIndex = 0;
  var weightIndex = 0;
  var color = kGreenColor;
  var name = 'Green Cactus';
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    changeColor(index) {
      var newColor;
      var newName;
      if (index == 0) {
        newColor = kGreenColor;
        newName = 'Green Cactus';
      } else if (index == 1) {
        newColor = kYellowColor;
        newName = 'Frutos Tropicales';
      } else {
        newColor = kRedColor;
        newName = 'Energia Guarana';
      }

      setState(() {
        color = newColor;
        colorIndex = index;
        name = newName;
        carouselController.animateToPage(index);
      });
    }

    changeWeight(index) {
      setState(() {
        weightIndex = index;
      });
    }

    colorIndicator(index, indicatorColor) {
      return InkWell(
        onTap: () {
          changeColor(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: colorIndex == index ? 48 : 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            color: indicatorColor,
          ),
        ),
      );
    }

    weightIndicator(index, title) {
      return InkWell(
        onTap: () {
          changeWeight(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: weightIndex == index ? Colors.white : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: weightIndex == index ? color : Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/back.png',
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/icons/search.png',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    'assets/icons/menu.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Verde Mate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 34,
            ),
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/product_green.png',
                ),
                Image.asset(
                  'assets/images/product_yellow.png',
                ),
                Image.asset(
                  'assets/images/product_red.png',
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 0.5,
                onPageChanged: (index, reason) {
                  changeColor(index);
                },
              ),
              carouselController: carouselController,
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              'Traditional stem-free mate tea\nfrom a small, family-owned plantation in\nSouthern Brazil. Grown in a varied forest\necosystem to ensure the best quality.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorIndicator(
                  0,
                  kGreenColor,
                ),
                SizedBox(
                  width: 24,
                ),
                colorIndicator(
                  1,
                  kYellowColor,
                ),
                SizedBox(
                  width: 24,
                ),
                colorIndicator(
                  2,
                  kRedColor,
                ),
              ],
            ),
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  weightIndicator(
                    0,
                    '0,2 kg',
                  ),
                  weightIndicator(
                    1,
                    '0,4 kg',
                  ),
                  weightIndicator(
                    2,
                    '0,6 kg',
                  ),
                  weightIndicator(
                    3,
                    '0,8 kg',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Add to cart',
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
