import 'package:flutter/material.dart';

class ZkarCard extends StatelessWidget {
  const ZkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  '99',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'التكرار  555 مرات ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_book,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.refresh,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
