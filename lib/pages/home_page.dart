import 'package:flutter/material.dart';
import 'package:liveclass14/util/emtion_face.dart';
import 'package:liveclass14/util/exercise_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // greetings row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hi Rajib
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Rajib!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '06 April, 2003',
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),

                      // Notification
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),

                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),
                  // search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),

                  // how do you feel?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "How do you feel?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 25),

                  // 4 difference faces
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmotionFace(emotionFace: '😌', emotionName: 'Badly',),
                      EmotionFace(emotionFace: '😌', emotionName: 'Fine',),
                      EmotionFace(emotionFace: '😁', emotionName: 'Well',),
                      EmotionFace(emotionFace: '😄', emotionName: 'Excellent',),
                    ],
                    //17:52
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      // exercise heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(height: 20),
                      //listview of exercise
                      Expanded(
                        child: ListView(
                          children: [
                            ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.orange,),
                            ExerciseTitle(icon: Icons.person, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.pink,),
                            ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.grey,),
                            ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.blue,),
                          ],
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}