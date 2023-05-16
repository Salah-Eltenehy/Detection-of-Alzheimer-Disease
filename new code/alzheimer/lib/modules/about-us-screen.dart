import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../shared/constants/Constants.dart';

  String text1 =
    """
This group of students is dedicated to advancing our understanding of Alzheimer's disease, a progressive brain disorder that affects memory, thinking, and behavior. Their project is particularly relevant, as Alzheimer's disease is a prevalent condition that affects millions of people worldwide."""
  ;

  String text2 =
  """
The team has a diverse set of skills, including expertise in genetics, bioinformatics, and neuroscience. They have been working tirelessly to collect and analyze MRI and genetic data to develop a predictive model for Alzheimer's disease. Their project involves examining MRI scans and genetic markers to identify potential indicators of the disease."""
  ;

  String text3 =
    """
The team's work is significant as it can potentially help diagnose Alzheimer's disease earlier, allowing for earlier interventions that can slow or halt its progression. Their project's scope is ambitious, and the team is dedicated to seeing it through to completion."""
  ;

  String text4 =
      """
In conclusion, the Salah El-Din team is making valuable contributions to the field of Alzheimer's disease research. Their project's focus on using MRI and genes to predict Alzheimer's disease has the potential to impact the lives of millions of people worldwide. The team's dedication, expertise, and passion make them a force to be reckoned with in the field of bioinformatics."""

  ;

  Widget buildAboutUs(w) {
    double pageWidth = w;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
              children: [
                const Spacer(),
                Container(
                  // height: 100,
                  width: pageWidth,
                  decoration: BoxDecoration(
                    // color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 10),
                  animatedTexts: [
                    TypewriterAnimatedText("$text1\n\n$text2", speed: const Duration(milliseconds: 30),),
		      TypewriterAnimatedText("$text3\n\n$text4", speed: const Duration(milliseconds: 30)),
                    // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                    // TypewriterAnimatedText('Do not test bugs out, design them out'),
                  ],
                  // onTap: () {},
                ),
              ),
                ),
              ],
            ),
          const SizedBox(height: 20,),
          

        ],
      ),
    );
  }

/*
Row(
            children: [
              const Spacer(),
              Container(
                // height: 100,
                width: pageWidth,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 10),
                  animatedTexts: [
                    TypewriterAnimatedText("$text3\n$text4", speed: const Duration(milliseconds: 30)),
                    // TypewriterAnimatedText(s2, speed: const Duration(milliseconds: 30)),
                    // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                    // TypewriterAnimatedText('Do not test bugs out, design them out'),
                  ],
                  // onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
*/
/*
Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                  )
 */
/*
          Row(
            children: [
              const Spacer(),
              Container(
                // height: 100,
                width: pageWidth,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text3,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const Spacer(),
              Container(
                // height: 100,
                width: pageWidth,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text4,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
 */