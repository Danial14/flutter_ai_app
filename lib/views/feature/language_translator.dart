import 'package:flutter/material.dart';

class LanguageTranslatorFeature extends StatefulWidget {
  const LanguageTranslatorFeature({super.key});

  @override
  State<LanguageTranslatorFeature> createState() => _LanguageTranslatorFeatureState();
}

class _LanguageTranslatorFeatureState extends State<LanguageTranslatorFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
            title : const Text("Multi Language Translator")
        ),
        body : ListView(
            children : [

            ]
        )
    );
  }
}
