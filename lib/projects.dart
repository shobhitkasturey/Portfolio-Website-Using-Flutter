import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import 'project_detail_page.dart';

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String githubUrl;
  final String liveServerUrl;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.githubUrl,
    required this.liveServerUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent, // Set card background color
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.oswald(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(description, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
                            onPressed: () => _launchURL(githubUrl),
                          ),
                          IconButton(
                            icon: const Icon(Icons.web, color: Colors.white),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailPage(url: liveServerUrl),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      imageUrl,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _launchURL(liveServerUrl),
                    child: const Text('Interact'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      appBar: AppBar(
        title: Text(
          'Projects',
          style: GoogleFonts.oswald(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Customize back button color
          onPressed: () => Navigator.of(context).pop(),
        ), // Remove AppBar shadow
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
              color: Colors.black.withOpacity(0.1), // Slightly dark background
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/projects_bg.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur effect
              child: Container(
                color: Colors.black.withOpacity(0.5), // Dark overlay
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4, // Number of cards in one row
            children: const [
              ProjectCard(
                imageUrl: 'assets/images/Screenshot (8).png', // Use local image
                title: 'Room-Booking-Application',
                description: 'PG-Room Booking Application for students.',
                githubUrl: 'https://github.com/shobhitkasturey/REACT-ROOM-BOOKING-APPLICATION',
                liveServerUrl: 'https://pgroombooking.netlify.app/',
              ),
              ProjectCard(
                imageUrl: 'assets/images/sc2.png', // Use local image
                title: 'Portfolio',
                description: 'A responsive Portfolio made using React JS and Tailwind CSS.',
                githubUrl: 'https://github.com/shobhitkasturey/portfolio',
                liveServerUrl: 'https://ranjeethkumarportfolio.netlify.app/',
              ),
              // Add more ProjectCard widgets for other projects
            ],
          ),
        ],
      ),
    );
  }
}
