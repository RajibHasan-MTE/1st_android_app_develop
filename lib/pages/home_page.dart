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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Rajib!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "04 April, 2003",
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),

                      //Notification
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: .circular(12),
                        ),
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // search bar
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  // how do you feel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "how do you feel?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmotionFace(emotionFace: '😌', emotionName: 'Badly'),
                      EmotionFace(emotionFace: '☺️', emotionName: 'Fine'),
                      EmotionFace(emotionFace: '😁', emotionName: 'Well'),
                      EmotionFace(emotionFace: '😀', emotionName: 'Excellent'),
                    ],
                  ),
                ],
              ),
            ),

            // exercises
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Column(
                    children: [
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

                      Expanded(child: ListView(
                        children: [
                          ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.orange,),
                          ExerciseTitle(icon: Icons.person, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.pink,),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.grey,),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: 'Speaking Skills', numberOfExercises: 16, color: Colors.blue,),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                          ExerciseTitle(icon: Icons.favorite, exerciseName: "Speaking Skills", numberOfExercises: 16, color: Colors.orange),
                        ],
                      ))
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
