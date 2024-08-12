import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yassmineee/functions/open_map.dart';
import 'package:yassmineee/models/doctor_model.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final List<DoctorModel> doctors = [
    DoctorModel(
      name: 'Dr. Sayed Al-Atrashy',
      address: 'Dar Al-Shifa Hospital, Heliopolis, Cairo.',
      location: '30.0635987,31.358763',
    ),DoctorModel(
      name: 'Dr. Ahmed Mamdouh',
      address: 'Fifth Settlement, CMC Mall, North 90th Street, behind the Air Hospital, Cairo.',
      location: '30.0305349,31.4665767',
    ),DoctorModel(
      name: 'Dr. Mohamed Ibrahim Mohamed Awad',
      address: 'Hadayek Al-Ahram, Giza.',
      location: '29.991216,31.128639',
    ),DoctorModel(
      name: 'Dr. Nader Victor Fanous',
      address: 'Omar Shaheen Street, Zagazig, Sharqia.',
      location: '30.5843022,31.5073377',
    ),DoctorModel(
      name: 'Dr. Mamdouh Ahmed Abdel Fattah',
      address: '2 Al-Tamihi Square, Al-Madina Tower, Mansoura, Dakahlia.',
      location: '31.0433757,31.380187',
    ),DoctorModel(
      name: 'Dr. Mohamed Abdel Sattar',
      address: '401 Faisal Street, Talbia Station, Giza.',
      location: '30.0054974,31.1737293',
    ),DoctorModel(
      name: 'Dr. Ramadan Nafeh',
      address: '2 Al-Galaa Street, in front of Omar Effendi, Zagazig, Sharqia.',
      location: '30.0523033,31.2363521',
    ),DoctorModel(
      name: 'Dr. Mohamed Salem',
      address: '3 El-Nasr Road, Nasr City, Cairo.',
      location: '30.0663029,31.3251682',
    ),DoctorModel(
      name: 'Dr. Hisham Abdel Fattah',
      address: '15 El-Tahrir Street, Dokki, Giza.',
      location: '30.0356116,31.2038009',
    ),DoctorModel(
      name: 'Dr. Tarek El-Sayed',
      address: '24 Shehab Street, Mohandessin, Giza.',
      location: '30.0522566,31.1997352',
    ),DoctorModel(
      name: 'Dr. Mona Abdel Razek',
      address: '12 El-Batal Ahmed Abdel Aziz Street, Dokki, Giza.',
      location: '30.0480266,31.2141937',
    ),DoctorModel(
      name: 'Dr. Amr El-Ashry',
      address: '5 El-Malek El-Saleh Street, Maadi, Cairo.',
      location: '30.0860685,31.2459772',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Maps'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctors[index].name,style: const TextStyle(fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text(doctors[index].address,style:  const TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                IconButton(onPressed: (){
                  openMap(location: doctors[index].location);
                }, icon:const Icon(Icons.location_on,size: 30,)),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: doctors.length,
      ),
    );
  }
}
