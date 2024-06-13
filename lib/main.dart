// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'about.dart';
import 'projects.dart';
import 'work.dart';
import 'certifications.dart';
import 'contact.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Duration of splash screen
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 3),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular image with glow effect
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: const [Colors.pink, Colors.blue],
                    center: Alignment(-0.8, -0.8),
                    radius: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              SizedBox(height: 30),
              // Progress bar
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.deepPurpleAccent,
                  value: value,
                ),
              ),
              const SizedBox(height: 10),
              // Percentage text
              Text(
                '${(value * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.pink,
                        blurRadius: 10,
                        offset: Offset(2, 2)),
                    Shadow(
                        color: Colors.blue,
                        blurRadius: 10,
                        offset: Offset(-2, -2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  bool _isAnimationPlayed = true;

  @override
  void initState() {
    super.initState();
    // Animation will play once when the widget is first built
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isAnimationPlayed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
        title: Text(
          'Portfolio',
          style: GoogleFonts.oswald(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
              color: Colors.black.withOpacity(0.3), // Slightly dark background
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutPage())),
            child: Text('About',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProjectsPage())),
            child: Text('Projects',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WorkPage())),
            child: Text('Work',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CertificationsPage())),
            child: Text('Certifications',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactPage())),
            child: Text('Contact',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image layer
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay layer
          Container(
            color: Colors.black.withOpacity(0.75), // Adjust opacity here
          ),
          // Content layer (centered content)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Circular image with gradient animation
                TweenAnimationBuilder(
                  duration: const Duration(seconds: 3),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) => Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: const [Colors.pink, Colors.blue],
                        center: Alignment(-0.8, -0.8),
                        radius: 1.5, // 2 * pi (complete circle)
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                  ),
                ).animate().slide(
                    duration: Duration(
                        seconds: 1)), // Added animation to CircleAvatar
                Text(
                  'Shobhit Kasturey',
                  style: GoogleFonts.oswald(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ).animate().slideX(
                    duration:
                        Duration(seconds: 1)), // Added slide animation to Text
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Full Stack Developer',
                      textStyle: GoogleFonts.oswald(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation:
                      false, // Set to true if you want the animation to repeat
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
