import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptom Checker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
      home: const SymptomCheckerPage(),
    );
  }
}

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  State<SymptomCheckerPage> createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _symptom1Controller = TextEditingController();
  final TextEditingController _symptom2Controller = TextEditingController();
  final TextEditingController _symptom3Controller = TextEditingController();
  String _result = '';


  final Map<String, List<String>> symptomDiseaseMap = {
  'fever': ['Head ache', 'Muscle pain', 'common cold'],
  'inflammation': ['Joint pain', 'fever'],
  'pain relief': ['Fever', 'Blood clot prevention'],
  'allergies': ['Runny nose', 'Itchy skin'],
  'hay fever': ['Skin allergies', 'Itchy skin'],
  'insomnia': ['Allergies', 'Motion sickness'],
  'heartburn': ['Acid reflux', 'Gastric ulcers'],
  'Gerd': ['Stomach ulcers',  'Zollinger-Ellison syndrome'],
  'respiratory infections': ['Skin infections', 'Urinary tract infections'],
  'Bronchitis': ['Ear infections', 'Skin infection'],
  'urinary tract infection': ['Travelers diarrhea', 'Bone infection'],
  'type2 diabetes': ['PCOS', 'Obesity management'],
  'type1 diabetes': ['Type 2 Diabetes', 'Diabetic ketoacidosis'],
  'Asthma': ['COPD', 'Bronchospasm'],
  'Asthma': ['Allergic rhinitis', 'Exercise-induced bronchoconstriction'],
  'Edema': ['Heart failure', 'Hypertension'],
  'hypertension': ['Edema', 'Calcium kidney stones prevention'],
  'high cholesterol': ['Cardiovascular disease prevention', 'Dyslipidemia'],
  'high cholesterol': ['Hypertriglyceridemia', 'Cardiovascular risk reduction'],
  'hypertension': ['Angina', 'Coronary protection in diabetes'],
  'hypertension': ['Heart failure', 'kidney protection in diabetes'],
  'hypertension': ['Angina', 'Heart attack prevention'],
  'seizures': ['Anxiety', 'Panic disorders'],
  'anxiety': ['panic attacks', 'Insomnia'],
  'Muscle spasms': ['Seizures', 'Anxiety'],
  'Depression': ['OCD', 'Panic order'],
  'Depression': ['Anxiety', 'PTSD'],
  'Depression': ['Generalized anxiety disorder', 'Panic disorder'],
  'hypothyroidism': ['Thyroid hormone replacement', 'Goiter'],
  'hyperthyroidism': ['Graves disease', 'Thyroid storm'],
  'inflammation': ['Allergies', 'Autoimmune conditions'],
  'inflammatory conditions': ['Severe allergies','Adrenal insufficiency'],
  'Eczema': ['psoriasis', 'Allergies reaction'],
  'Fungal infection': ['Athletes foot', 'Ringworm'],
  'fungal infections': ['Seborrheic dermatitis', 'Tinea versicolor'],
  'vaginal yeast infection': ['Athletes foot', 'Jock itch'],
  'local anesthesia': ['Nerve pain', 'Skin irritation'],
  'diarrhea': ['Travelers diarrhea', 'chronic bowel conditions'],
  'nausea': ['vomiting', 'post-chemotherapy sickness'],
  'nausea': ['Vomiting', 'Gastric motility disorders'],
  'chest congestion': ['Cough with phlegm', 'Bronchitis'],
  'dry cough': ['Common cold', 'Cough due to throat irritation'],
  'Cough with mucus': ['Chronic bronchitis', 'Acetaminophen overdose'],
  'migraine': ['Cluster headache', 'Severe headaches'],
  'migraine prevention': ['Hypertension', 'performance anxiety'],
  'seizures': ['Bipolar disorder', 'Mood stabilization'],
  'seizures': ['Trigeminal neuralgia', 'Bipolar disorder'],
  'seizures': ['Status epilepticus', 'Epilepsy'],
  'seizures': ['Bipolar disorder', 'Migraine prevention'],
  'constipation': ['Bowel preparation before surgery', 'Hard stools'],
  'constipation': ['Liver encephalopathy', 'Hard stool'],
  'iron-deficiency anemia': ['Fatigue', 'poor concentration'],
  'vitamin D deficiency': ['Osteoporosis', 'Rickets'],
  'osteoporosis': ['Acid indigestion', 'Calcium deficiency'],
  'burns': ['Skin infections', 'Wound care'],
  'urinary tract infections': ['Bladder infection', 'Kidney infections'],
  'benign prostatic hyperplasia': ['Urinary retention', 'Painful urination'],
  'erectile dysfunction': ['Pulmonary hypertension', 'Raynaud s'' phenomenon'],
  'hair loss': ['Benign prostatic hyperplasia', 'Androgenic alopecia'],
  'hair loss': ['Androgenic alopecia', 'Hair regrowth stimulation'],
  'blood clots': ['Deep vein thrombosis', 'Pulmonary embolism'],
  'blood clots': ['Thrombosis prevention', 'Post-surgical clot prevention'],
  'atrial fibrillation': ['DVT prevention', 'Stroke prevention'],
  'stroke prevention': ['Heart attack prevention ', 'Peripheral artery disease'],
  'Angina': ['Chest pain', 'Heart attack prevention'],
  'heart failure': ['Atrial fibrillation', 'Arrhythmias'],
  'heart failure': ['Edema', 'High blood pressure'],
  'rheumatoid arthritis': ['Psoriasis', 'cancer treatment'],
  'lupus': ['Rheumatoid arthritis' 'Malaria prevention'],
  'ulcerative colitis': ['Crohns disease', 'Rheumatoid arthritis'],
  'rheumatoid arthritis': ['Psoriasis', 'Crohns disease'],
  'rheumatoid arthritis': ['Ankylosing spondylitis', 'Psoriasis'],
  'muscle spasms': ['Fibromyalgia', 'Muscle Pain'],
  'muscle spasticity': ['Spinal cord injuries', 'Multiple sclerosis'],
  'muscle spasms': ['spasticity', 'Back pain'],
  'nerve pain': ['Seizures', 'Postherpetic neuralgia'],
  'nerve pain': ['Fibromyalgia', 'Seizures'],
  'depression': ['Anxiety', 'Chronic pain'],
  'depression': ['Smoking cessation', 'Seasonal affective disorder'],
  'depression': ['Generalized anxiety disorder', 'Panic disorder'],
  'depression': ['Insomnia', 'Anxiety'],
  'anxiety': ['Generalized anxiety disorder', 'Tension disorder'],
  'heartburn': ['GERD', 'Stomach ulcers'],
  'stomach ulcers': ['Duodenal ulcers', 'Gastric'],
  'gastric ulcers': ['Labour induction', 'Abortion assistance'],
  'nausea': ['Vomiting', 'Delayed gastric emptying'],
  'skin infections': ['Bone infection', 'Dental infection'],
  'acne': ['Respiratory infection', 'Lyme disease'],
  'acne': ['Cholera', 'Respiratory disease'],
  'drug-resistant bacterial infections': ['Skin infection', 'Pneumonia'],
  'MRSA infections': ['Endocarditis', 'Severe bacterial infection'],
  'severe bacterial infections': ['Bone infections', 'UTIs'],
  'Tuberculosis': ['Leprosy', 'Meningitis Prevention'],
  'Tuberculosis': ['Latent TB infection', 'Active TB treatment'],
  'Tuberculosis': ['Multi-drug resistances TB', 'Bacterial infections'],
  'Tuberculosis': ['Multi-drug resistance TB', 'Lung infections'],
  'Herpes simplex': ['Shingles', 'Chickenpox'],
  'Herpes simplex': ['Shingles', 'Cold sores'],
  'Influenza (flu)': ['Flu Prevention', 'Severe flu cases'],
  'HIV/AIDS': ['Prevention of mother-to-child HIV transmission', 'HIV therapy'],
  'HIV/AIDS': ['Antiretroviral therapy', 'HIV management'],
  'HIV/AIDS': ['Hepatitis B', 'Pre-exposure prophylaxis'],
  'HIV/AIDS': ['Hepatitis B', 'HIV management'],
  'Hepatitis C': ['Chronic hepatitis', 'liver disease prevention'],
  'Hepatitis B': ['Chronic hepatitis', 'Liver protection'],
  'Seizures': ['Epilepsy', 'Myoclonus'],
  'Seizures': ['Migraine prevention', 'Bipolar disorder'],
  'Insomnia': ['Sleep initiation difficulty', 'short-term sleep issues'],
  'Insomnia': ['Jet lag', 'Sleep-wake disorder'],
  'Chronic insomnia': ['Sleep maintenance', 'Trouble falling asleep'],
  'Anxiety': ['Allergies', 'Itching'],
  'Nausea': ['Vomiting', 'Motion sickness'],
  'Vertigo': ['Motion sickness', 'Dizziness'],
  'Motion sickness': ['post-operative nausea', 'Muscle spasms'],
  'Vertigo': ['Nausea', 'Migraine prevention'],
  'Nausea': ['Vomiting', 'Schizophrenia'],
  'Schizophrenia': ['Mania', 'Several behavioral disorder'],
  'Schizophrenia': ['Bipolar disorder', 'Agitation'],
  'Schizophrenia': ['Bipolar disorder', 'Irritability in autism'],
  'Bipolar disorder': ['Schizophrenia', 'Depression'],
  'Schizophrenia': ['Bipolar disorder', 'Irritability in autism'],
  'Treatment-resistant schizophrenia': ['Psychosis in Parkinsons disease', 'Suicidal behavior'],
  'Bipolar disorder': ['Mania', 'Mood stabilization'],
  'ADHD': ['Narcolepsy', 'Attention difficulties'],
  'Narcolepsy': ['Sleep apnea', 'Shift work sleep disorder'],
  'ADHD': ['Narcolepsy', 'Fatigue'],
  'Alzheimer’s disease': ['Dementia', 'Cognitive impairment'],
  'Alzheimer’s disease': ['Dementia in Parkinsons', 'Cognitive issues'],
  'Alzheimer’s disease': ['Moderate-to-serve dementia'],
  'Menieres disease': ['Vertigo', 'Tinnitus'],
  'Asthma': ['Bronchospasm', 'COPD'],
  'COPD': ['Asthma', 'Bronchitis'],
  'Asthma': ['COPD', 'Chrons disease'],
  'Allergic rhinitis': ['Asthma', 'Nasal congestion'],
  'COPD': ['Chronic bronchitis', 'Emphysema'],
  'Asthma': ['Allergic rhinitis', 'Exercise-induced bronchospasm'],
  'Hay fever': ['Allergies', 'Itchy skin'],
  'Allergies': ['Hives', 'Allergic rhinitis'],
  'Seasonal allergies': ['Chronic hives', 'Allergic rhinitis'],
  'Allergic rhinitis': ['Hives', 'Allergies conjunctivitis'],
  'Hay fever': ['Hives' 'Allergies'],
  'Insomnia': ['Allergies', 'Motion sickness'],
  'Dry cough': ['Common cold', 'cough due to minor throat irritation'],
  'Chest congestion': ['Cough with mucus', 'Bronchitis'],
  'Mucus clearance': ['Chronic bronchitis', 'Acetaminophen overdose'],
  'Nasal congestion': ['Sinus Pressure', 'Eye redness'],
  'Nasal congestion': ['Sinus congestion', 'Cold symptoms'],
  'Cough with mucus': ['Bronchitis', 'Respiratory tract infections'],
  'Severe pain': ['cough suppression', 'Diarrhea'],
  'Moderate-to-severe pain': ['Chronic pain', 'Post-surgical pain'],
  'Severe pain': ['Cancer pain', 'Pain from heart attack'],
  'Severe pain': ['Post-surgical pain', 'Chronic pain'],
  'Severe pain': ['Cancer pain', 'Post-operative pain'],
  'Chronic pain': ['Opioid withdrawal', 'Addiction management'],
  'Opioid overdose': ['Respiratory depression reversal', 'Opioid-induced side effects'],
  'Opioid addiction': ['Chronic pain', 'Withdrawal prevention'],
  'Hypertension': ['Heart failure', 'Heart attack prevention'],
  'Hypertension': [' Chronic heart failure', 'Kidney protection'],
  'Hypertension': ['Heart failure', 'Diabetic nephropathy'],
  'Hypertension': ['Heart failure', 'Kidney protection in diabetes'],
  'Hypertension': ['Heart failure', 'Post-heart attack management'],
  'Hypertension': ['Chronic heart failure', 'Angina'],
  'Hypertension': ['Angina', 'Heart attack prevention'],
  'Hypertension': ['Angina', 'Arrhythmias'],
  'Hypertension': ['Migraine prevention', 'Arrhythmias'],
  'Hypertension': ['Heart failure', 'Severe high blood pressure'],
  'Severe hypertension': ['Hair loss', 'Alopecia'],

};

  void _checkSymptoms() {
    Set<String> possibleDiseases = {};
    List<String> symptoms = [
      _symptom1Controller.text.toLowerCase(),
      _symptom2Controller.text.toLowerCase(),
      _symptom3Controller.text.toLowerCase(),
    ];

    for (String symptom in symptoms) {
      if (symptom.isNotEmpty && symptomDiseaseMap.containsKey(symptom)) {
        possibleDiseases.addAll(symptomDiseaseMap[symptom]!);
      }
    }

    setState(() {
      if (possibleDiseases.isEmpty) {
        _result = 'No matching diseases found. Please consult a healthcare professional for accurate diagnosis.';
      } else {
        _result = 'Possible conditions based on symptoms:\n\n${possibleDiseases.join('\n')}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSymptomField('Symptom 1', _symptom1Controller),
            const SizedBox(height: 16),
            _buildSymptomField('Symptom 2', _symptom2Controller),
            const SizedBox(height: 16),
            _buildSymptomField('Symptom 3', _symptom3Controller),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _checkSymptoms,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Check',
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (_result.isNotEmpty) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.green),
      ),
    );
  }

  @override
  void dispose() {
    _symptom1Controller.dispose();
    _symptom2Controller.dispose();
    _symptom3Controller.dispose();
    super.dispose();
  }
}