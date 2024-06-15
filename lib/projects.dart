import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ProjectCard extends StatefulWidget {
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
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isClicked = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = true;
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          Future.delayed(const Duration(seconds: 3), () {
            if (!_isHovered) {
              setState(() {
                _isClicked = false;
              });
            }
          });
          setState(() {
            _isHovered = false;
          });
        },
        child: Card(
          color: Colors.transparent,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_isHovered && !_isClicked)
                            Expanded(
                              child: Center(
                                child: Text(
                                  widget.title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          if (_isHovered || _isClicked)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  widget.description,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Image.asset(
                                    widget.imageUrl,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // const SizedBox(height: 10),
                                // ElevatedButton(
                                //   onPressed: () => _launchURL(widget.liveServerUrl),
                                //   child: const Text('Interact'),
                                // ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
                            onPressed: () => _launchURL(widget.githubUrl),
                          ),
                          IconButton(
                            icon: const Icon(Icons.web, color: Colors.white),
                            onPressed: () => _launchURL(widget.liveServerUrl),
                          ),
                        ],
                      ),
                    ),
                    if (_isHovered || _isClicked)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          widget.title,
                          style: GoogleFonts.oswald(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            children: const [
              ProjectCard(
                imageUrl: 'assets/images/Screenshot (8).png',
                title: 'Room-Booking-Application',
                description: 'PG-Room Booking Application for students.',
                githubUrl: 'https://github.com/shobhitkasturey/REACT-ROOM-BOOKING-APPLICATION',
                liveServerUrl: 'https://pgroombooking.netlify.app/',
              ),
              ProjectCard(
                imageUrl: 'assets/images/sc2.png',
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
