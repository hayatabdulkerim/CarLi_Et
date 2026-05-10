import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/logo/carliet_logo.dart';
import '../../../features/student/presentation/internship_details_page.dart';

class BrowseInternshipsPage extends StatelessWidget {
  const BrowseInternshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF087E8B),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _BrowseHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: const _BrowseBody(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

//Header section
class _BrowseHeader extends StatelessWidget {
  const _BrowseHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: const Logo(height: 60),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'CarLi_ET ',
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Internship',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Management',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            'Browse for Internships',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 16,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 180,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: _CategoryFilterDropdown(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// Body section

class _BrowseBody extends StatelessWidget {
  const _BrowseBody({super.key});

  final List<Map<String, String>> internshipData = const [
    {
      'company': 'Commercial Bank of Ethiopia',
      'image': 'assets/images/CBE.jpg',
      'title': 'Summer Intern',
      'desc': "Join Ethiopia's first bank...",
      'loc': 'Addis Ababa',
      'dur': '8-12 wks',
      'sal': 'N/A',
      'tags': '#Finance #Banking',
    },
    {
      'company': 'Ethiotelecom',
      'image': 'assets/images/ethiotelecom.jpg',
      'title': 'Network Engineer',
      'desc': 'Support 5G infrastructure rollout...',
      'loc': 'Remote/Addis',
      'dur': '6 months',
      'sal': 'Paid',
      'tags': '#Telecom #Tech',
    },
    {
      'company': 'Ethiopian Airlines',
      'image': 'assets/images/airlines.jpg',
      'title': 'Logistics Intern',
      'desc': 'Analyze supply chain efficiency...',
      'loc': 'Bole, Addis',
      'dur': '3 months',
      'sal': 'Competitive',
      'tags': '#Aviation #Logistics',
    },
    {
      'company': 'Google Africa',
      'image': 'assets/images/google.jpg',
      'title': 'Software Student',
      'desc': 'Backend development in Python...',
      'loc': 'Kenya/Remote',
      'dur': '12 weeks',
      'sal': 'Paid',
      'tags': '#CS #Coding',
    },
    {
      'company': 'Dashen Bank',
      'image': 'assets/images/dashen.jpg',
      'title': 'UX/UI Design',
      'desc': 'Improve mobile banking interface...',
      'loc': 'Addis Ababa',
      'dur': '2 months',
      'sal': 'Stipend',
      'tags': '#Design #Fintech',
    },
    {
      'company': 'ZayRide',
      'image': 'assets/images/ride.jpg',
      'title': 'Data Analyst',
      'desc': 'Optimize driver dispatch routes...',
      'loc': 'Addis Ababa',
      'dur': '4 months',
      'sal': 'Paid',
      'tags': '#Data #Startup',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => _BrowseCard(data: internshipData[index]),
    );
  }
}

//Internship card
class _BrowseCard extends StatelessWidget {
  final Map<String, String> data;
  const _BrowseCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['company']!,
            style: const TextStyle(
              color: Colors.black26,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    data['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(
                      Icons.business,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data['desc']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    _CompactDetail(
                      icon: Icons.location_on, 
                      text: data['loc']!,
                      iconColor: Colors.redAccent,
                    ),
                    const SizedBox(height: 4),
                    _CompactDetail(
                      icon: Icons.access_time, 
                      text: data['dur']!,
                      iconColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data['tags']}',
                    style: const TextStyle(fontSize: 8, color: Colors.black38),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Posted Apr 8',
                    style: TextStyle(fontSize: 8, color: Colors.black38),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InternshipDetailsPage(data: data),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF087E8B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Apply now",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompactDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _CompactDetail({
    required this.icon, 
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12, color: iconColor),
        const SizedBox(width: 4),
        Text(
          text, 
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        ),
      ],
    );
  }
}

// Filter catagory dropdown

class _CategoryFilterDropdown extends StatefulWidget {
  const _CategoryFilterDropdown();

  @override
  State<_CategoryFilterDropdown> createState() =>
      _CategoryFilterDropdownState();
}

class _CategoryFilterDropdownState extends State<_CategoryFilterDropdown> {
  String selectedFilter = '  Filter by Category';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 45),
        onSelected: (String value) {
          setState(() {
            selectedFilter = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedFilter,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF011627),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: Color(0xFF011627),
            ),
          ],
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: '  Filter by Name',
            child: Text('Filter by Name'),
          ),
          const PopupMenuItem<String>(
            value: '  Filter by Date',
            child: Text('Filter by Date'),
          ),
          const PopupMenuItem<String>(
            value: '  Filter by Type',
            child: Text('Filter by Internship Type'),
          ),
          const PopupMenuItem<String>(
            value: '  Filter by Location',
            child: Text('Filter by Location'),
          ),
        ],
      ),
    );
  }
}


// Bottom navigation bar
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF087E8B),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                context.pushNamed('student_home');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.people_alt_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                context.pushNamed('profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
