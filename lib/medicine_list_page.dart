import 'package:flutter/material.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({super.key});

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  final List<String> medicines = const [
    'Paracetamol',
    'Ibuprofen',
    'Aspirin',
    'Cetirizine',
    'Loratadine',
    'Diphenhydramine',
    'Omeprazole',
    'Pantoprazole',
    'Amoxicillin',
    'Azithromycin',
    'Ciprofloxacin',
    'Metformin',
    'Insulin',
    'Salbutamol',
    'Montelukast',
    'Furosemide',
    'Hydrochlorothiazide',
    'Atorvastatin',
    'Simvastatin',
    'Amlodipine',
    'Losartan',
    'Metoprolol',
    'Clonazepam',
    'Alprazolam',
    'Diazepam',
    'Fluoxetine',
    'Sertraline',
    'Escitalopram',
    'Levothyroxine',
    'Methimazole',
    'Prednisone',
    'Dexamethasone',
    'Hydrocortisone',
    'Clotrimazole',
    'Ketoconazole',
    'Miconazole',
    'Lidocaine',
    'Loperamide',
    'Ondansetron',
    'Domperidone',
    'Guaifenesin',
    'Dextromethorphan',
    'Acetylcysteine',
    'Sumatriptan',
    'Propranolol',
    'Lamotrigine',
    'Carbamazepine',
    'Phenytoin',
    'Valproic acid',
    'Bisacodyl',
    'Lactulose',
    'Ferrous sulfate',
    'Vitamin D3',
    'Calcium carbonate',
    'Silver sulfadiazine',
    'Nitrofurantoin',
    'Tamsulosin',
    'Sildenafil',
    'Finasteride',
    'Minoxidil',
    'Warfarin',
    'Heparin',
    'Apixaban',
    'Clopidogrel',
    'Nitroglycerin',
    'Digoxin',
    'Spironolactone',
    'Methotrexate',
    'Hydroxychloroquine',
    'Sulfasalazine',
    'Adalimumab',
    'Etanercept',
    'Cyclobenzaprine',
    'Baclofen',
    'Tizanidine',
    'Gabapentin',
    'Pregabalin',
    'Duloxetine',
    'Bupropion',
    'Venlafaxine',
    'Mirtazapine',
    'Buspirone',
    'Famotidine',
    'Sucralfate',
    'Misoprostol',
    'Metoclopramide',
    'Clindamycin',
    'Doxycycline',
    'Tetracycline',
    'Linezolid',
    'Vancomycin',
    'Amikacin',
    'Rifampin',
    'Isoniazid',
    'Ethambutol',
    'Pyrazinamide',
    'Acyclovir',
    'Valacyclovir',
    'Oseltamivir',
    'Zidovudine',
    'Efavirenz',
    'Tenofovir',
    'Lamivudine',
    'Sofosbuvir',
    'Entecavir',
    'Levetiracetam',
    'Topiramate',
    'Zolpidem',
    'Melatonin',
    'Eszopiclone',
    'Hydroxyzine',
    'Promethazine',
    'Meclizine',
    'Scopolamine',
    'Cinnarizine',
    'Prochlorperazine',
    'Haloperidol',
    'Olanzapine',
    'Risperidone',
    'Quetiapine',
    'Aripiprazole',
    'Clozapine',
    'Lithium',
    'Methylphenidate',
    'Modafinil',
    'Dextroamphetamine',
    'Donepezil',
    'Rivastigmine',
    'Memantine',
    'Betahistine',
    'Albuterol (Salbutamol)',
    'Ipratropium bromide',
    'Budesonide',
    'Fluticasone',
    'Tiotropium',
    'Montelukast',
    'Cetirizine',
    'Loratadine',
    'Desloratadine',
    'Levocetirizine',
    'Fexofenadine',
    'Diphenhydramine',
    'Dextromethorphan',
    'Guaifenesin',
    'Acetylcysteine',
    'Phenylephrine',
    'Pseudoephedrine',
    'Bromhexine',
    'Codeine',
    'Tramadol',
    'Morphine',
    'Oxycodone',
    'Fentanyl',
    'Buprenorphine',
    'Naloxone',
    'Methadone',
    'Lisinopril',
    'Ramipril',
    'Enalapril',
    'Candesartan',
    'Valsartan',
    'Bisoprolol',
    'Atenolol',
    'Diltiazem',
    'Verapamil',
    'Hydralazine',
    'Minoxidil (oral)'

  ];

  String searchQuery = '';

  List<String> get filteredMedicines => medicines
      .where((medicine) =>
      medicine.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF00B894)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'List Of All Medicines',
          style: TextStyle(
            color: Color(0xFF00B894),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search medicines...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF00B894)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF00B894)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF00B894)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredMedicines.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    '${index + 1}.${filteredMedicines[index]}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}