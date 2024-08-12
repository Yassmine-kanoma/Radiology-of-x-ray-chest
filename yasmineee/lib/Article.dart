import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiseaseInfo {
  final String title;

  List<String> description = [];
  final String imagePath;
  DiseaseInfo({required this.title,required this.description, required this.imagePath});
}

class Articals extends StatefulWidget {
  @override
  _ArticalsState createState() => _ArticalsState();
}

class _ArticalsState extends State<Articals>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<DiseaseInfo> _diseases = [
    DiseaseInfo(
        title: 'TB',
        description: ['Tuberculosis (TB) is a serious illness that'
            ' mainly affects the lungs. The germs that cause tuberculosis '
            'are a type of bacteria.'
            'Tuberculosis can spread when a person with the illness'
            ' coughs, sneezes or sings. '
            'This can put tiny droplets with the germs into the air.'
            ' Another person can then breathe in the droplets, and the germs enter the lungs.''\n',

          'Symptoms ',
          'Risk of TB infection''\n',
          '  Certain living or working conditions make'
              ' it easier for the disease to pass from one person to another.''\n',
          'These conditions increase the risk of getting a TB infection:''\n',
          'Living with someone with active TB disease.''\n'
              ' Living or working in places where people live close together, such as prisons, nursing homes and shelters for homeless people.''\n',
        ],
        imagePath: ('assets/images/TB.jpeg'),
    ),
    DiseaseInfo(
      title: 'COVID',
      description:['COVID-19 is a contagious respiratory illness caused by the SARS-CoV-2 virus.''\n', 'People with COVID-19 have had a wide range of symptoms reported – ranging from mild symptoms to severe illness. Symptoms may appear 2-14 days after exposure to the virus. Anyone can have mild to severe symptoms. Possible symptoms include:''\n',
        '   Fever or chills'' Shortness of breath or difficulty breathing   '
            '''Fatigue  Muscle or body aches'''
            '''  Headache
   New loss of taste or smell
   Sore throat''',
        ''' Congestion or runny nose
       Nausea or vomiting
       Diarrhea
       COVID-19'''],


      imagePath: ('assets/images/CVD.jpeg'),
    ),




    DiseaseInfo(
      title: 'Pneumonia',
      description: ['Pneumonia can be caused by" bacterial, viral, or fungal infections". Symptoms include cough, fever, chest pain, and difficulty breathing. Treatment depends on the cause of the infection.'
          'Pneumonia is an infection in your lungs caused by bacteria, viruses or fungi. Pneumonia causes your lung tissue to swell (inflammation) and can cause fluid or pus in your lungs. Bacterial pneumonia is usually more severe than viral pneumonia, which often resolves on its own.'
          'Pneumonia can affect one or both lungs. Pneumonia in both of your lungs is called bilateral or double pneumonia.''\n',
        'Symptoms : ''\n',
        'What tests will be done to diagnose pneumonia?''\n',
        '  Your provider may perform tests that look at your lungs for signs of infection, measure how well your lungs are working and examine blood or other body fluids to try to determine the cause of your pneumonia. These include:''\n'
            ' - Imaging: Your provider can use chest X-ray or CT scan to take pictures of your lungs to look for signs of infection.''\n'
            ' - Blood tests: Your provider can use a blood test to help determine what kind of infection is causing your pneumonia.''\n',

      ],
      imagePath: ('assets/images/ph.jpeg')

    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(

        children: [
          Icon(
            Icons.article
          ),

          SizedBox(
            width: 15,
          ),
          Text(AppLocalizations.of(context)!.articles,),
        ],
      ),




        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'TB'),
            Tab(text: 'COVID'),
            Tab(text: 'Pneumonia'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _diseases.map((disease) {
          return Container(
            // color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disease.title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  disease.description[0],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                )
                ,Text(
                  disease.description[1],
                  style: TextStyle(
                    fontSize:12,
                  ),
                ),
                SizedBox(height: 8.0),
                Image.asset(
                    disease.imagePath,
                    width: 200,
                    height: 200),
                Text(
                  disease.description[2],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                  ),
                ),
                Text(
                  disease.description[3],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),

              ],

            ),
          );
        }).toList(),
      ),

    );
  }
}