import 'package:flutter/material.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<String> featuredImages = [
    'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?w=300&h=200&fit=crop',
    'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=300&h=200&fit=crop',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=300&h=200&fit=crop',
  ];

  final List<Map<String, String>> products = [
    {
      'title': 'Sneakers',
      'image':
          'https://images.unsplash.com/photo-1500673922987-e212871fec22?w=300&h=200&fit=crop'
    },
    {
      'title': 'Backpack',
      'image':
          'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=300&h=200&fit=crop'
    },
    {
      'title': 'Watch',
      'image':
          'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=600&h=400&fit=crop'
    },
    {
      'title': 'Jacket',
      'image':
          'https://images.unsplash.com/photo-1603791440384-56cd371ee9a7?w=600&h=400&fit=crop'
    },
  ];

  final List<String> offers = [
    '50% off on shoes',
    'Buy 1 get 1 free on backpacks',
    'Smart watches sale',
    'Winter jackets discount',
    'Flash sale today only'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('ShopCraft'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Suwannaphum',
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _currentPage--;
                        _pageController.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 280,
                      child: PageView.builder(
                        itemCount: featuredImages.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() => _currentPage = index);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                featuredImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (_currentPage < featuredImages.length - 1) {
                        _currentPage++;
                        _pageController.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Explore Products',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 0.9,
                children: products.map((product) {
                  return Card(
                    color: const Color(0xFFF9F6FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product['image']!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            product['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '\$49.99',
                            style: TextStyle(fontSize: 14),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              color: const Color(0xFF4B70F5),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${product['title']} added to cart'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const Text(
                '🔥 Hot Offers',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Column(
                children: offers.map((offer) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(offer),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
