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

//───────────────────────────────────────────────────────────────────

class _BrowseHeader extends StatelessWidget {
  const _BrowseHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo row
          Row(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: const Logo(height: 44),
              ),
              const SizedBox(width: 10),
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
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Internship',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Management',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'Browse for Internships',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),
          Row(
            children: [
              // Search field
              Expanded(
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 13),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),
              const SizedBox(
                width: 130,
                height: 38,
                child: _CategoryFilterDropdown(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//─────────────────────────────────────────────────────────────────────

class _BrowseBody extends StatelessWidget {
  const _BrowseBody({super.key});

  final List<Map<String, String>> internshipData = const [
    {
      'company': 'Commercial Bank of Ethiopia',
      'image': 'assets/images/CBE.jpg',
      'title': 'Summer Intern',
      'desc': "Join Ethiopia's first bank...",
      'loc': 'Addis Ababa',
      'dur': '8–12 wks',
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
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.82,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      itemCount: internshipData.length,
      itemBuilder: (context, index) => _BrowseCard(data: internshipData[index]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────

class _BrowseCard extends StatelessWidget {
  final Map<String, String> data;
  const _BrowseCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company name
          Text(
            data['company']!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          // logo + title row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  data['image']!,
                  width: 38,
                  height: 38,
                  fit: BoxFit.contain,
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.business, size: 38, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data['title']!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // description
          Text(
            data['desc']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 8),

          // location & duration
          _CompactDetail(icon: Icons.location_on, text: data['loc']!),
          const SizedBox(height: 4),
          _CompactDetail(icon: Icons.access_time, text: data['dur']!),

          const Spacer(),

          // tags
          Text(
            '${data['tags']} • Apr 8',
            style: const TextStyle(fontSize: 8, color: Colors.black38),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 6),

          // apply button full width
          SizedBox(
            width: double.infinity,
            height: 24,
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
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────

class _CategoryFilterDropdown extends StatefulWidget {
  const _CategoryFilterDropdown();

  @override
  State<_CategoryFilterDropdown> createState() =>
      _CategoryFilterDropdownState();
}

class _CategoryFilterDropdownState extends State<_CategoryFilterDropdown> {
  String selectedFilter = 'Category';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 42),
        onSelected: (String value) {
          setState(() => selectedFilter = value);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedFilter,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF011627),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: Color(0xFF011627),
            ),
          ],
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Name',
            child: Text('Filter by Name'),
          ),
          const PopupMenuItem<String>(
            value: 'Date',
            child: Text('Filter by Date'),
          ),
          const PopupMenuItem<String>(
            value: 'Type',
            child: Text('Filter by Type'),
          ),
          const PopupMenuItem<String>(
            value: 'Location',
            child: Text('Filter by Location'),
          ),
        ],
      ),
    );
  }
}

//───────────────────────────────────────────────────────

class _CompactDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  const _CompactDetail({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 11, color: Colors.redAccent),
        const SizedBox(width: 3),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 10, color: Colors.black54),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ───────────────────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFF087E8B),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // active tab indicator
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () => context.pushNamed('student_home'),
            ),
            IconButton(
              icon: const Icon(
                Icons.people_alt_rounded,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () => context.pushNamed('profile'),
            ),
          ],
        ),
      ),
    );
  }
}
