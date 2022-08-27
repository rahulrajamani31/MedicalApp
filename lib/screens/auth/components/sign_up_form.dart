import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _userName, _email, _password, _phoneNumber;
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Username"),
          TextFormField(
            decoration: InputDecoration(hintText: "theflutterway"),
            validator: RequiredValidator(errorText: "Username is required"),
            // Let's save our username
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: defaultPadding),

          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keybord
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Password"),

          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "**"),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "***"),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, _password),
          ),
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

class StateService {
  static final List<String> states = [
    'itching',
    ' skin_rash',
    ' nodal_skin_eruptions',
    ' dischromic _patches',
    ' continuous_sneezing',
    ' shivering',
    ' chills',
    ' watering_from_eyes',
    ' stomach_pain',
    ' acidity',
    ' ulcers_on_tongue',
    ' vomiting',
    ' cough',
    ' chest_pain',
    ' yellowish_skin',
    ' nausea',
    ' loss_of_appetite',
    ' abdominal_pain',
    ' yellowing_of_eyes',
    ' burning_micturition',
    ' spotting_ urination',
    ' passage_of_gases',
    ' internal_itching',
    ' indigestion',
    ' muscle_wasting',
    ' patches_in_throat',
    ' high_fever',
    ' extra_marital_contacts',
    ' fatigue',
    ' weight_loss',
    ' restlessness',
    ' lethargy',
    ' irregular_sugar_level',
    ' blurred_and_distorted_vision',
    ' obesity',
    ' excessive_hunger',
    ' increased_appetite',
    ' polyuria',
    ' sunken_eyes',
    ' dehydration',
    ' diarrhoea',
    ' breathlessness',
    ' family_history',
    ' mucoid_sputum',
    ' headache',
    ' dizziness',
    ' loss_of_balance',
    ' lack_of_concentration',
    ' stiff_neck',
    ' depression',
    ' irritability',
    ' visual_disturbances',
    ' back_pain',
    ' weakness_in_limbs',
    ' neck_pain',
    ' weakness_of_one_body_side',
    ' altered_sensorium',
    ' dark_urine',
    ' sweating',
    ' muscle_pain',
    ' mild_fever',
    ' swelled_lymph_nodes',
    ' malaise',
    ' red_spots_over_body',
    ' joint_pain',
    ' pain_behind_the_eyes',
    ' constipation',
    ' toxic_look_(typhos)',
    ' belly_pain',
    ' yellow_urine',
    ' receiving_blood_transfusion',
    ' receiving_unsterile_injections',
    ' coma',
    ' stomach_bleeding',
    ' acute_liver_failure',
    ' swelling_of_stomach',
    ' distention_of_abdomen',
    ' history_of_alcohol_consumption',
    ' fluid_overload',
    ' phlegm',
    ' blood_in_sputum',
    ' throat_irritation',
    ' redness_of_eyes',
    ' sinus_pressure',
    ' runny_nose',
    ' congestion',
    ' loss_of_smell',
    ' fast_heart_rate',
    ' rusty_sputum',
    ' pain_during_bowel_movements',
    ' pain_in_anal_region',
    ' bloody_stool',
    ' irritation_in_anus',
    ' cramps',
    ' bruising',
    ' swollen_legs',
    ' swollen_blood_vessels',
    ' prominent_veins_on_calf',
    ' weight_gain',
    ' cold_hands_and_feets',
    ' mood_swings',
    ' puffy_face_and_eyes',
    ' enlarged_thyroid',
    ' brittle_nails',
    ' swollen_extremeties',
    ' abnormal_menstruation',
    ' muscle_weakness',
    ' anxiety',
    ' slurred_speech',
    ' palpitations',
    ' drying_and_tingling_lips',
    ' knee_pain',
    ' hip_joint_pain',
    ' swelling_joints',
    ' painful_walking',
    ' movement_stiffness',
    ' spinning_movements',
    ' unsteadiness',
    ' pus_filled_pimples',
    ' blackheads',
    ' scurring',
    ' bladder_discomfort',
    ' foul_smell_of urine',
    ' continuous_feel_of_urine',
    ' skin_peeling',
    ' silver_like_dusting',
    ' small_dents_in_nails',
    ' inflammatory_nails',
    ' blister',
    ' red_sore_around_nose',
    ' yellow_crust_ooze',
    'Disease'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
