import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
String s1= """Welcome to our website dedicated to predicting Alzheimer's disease using MRI scans. We understand that Alzheimer's disease is a devastating condition that affects millions of people around the world, and we are committed to using the latest technology to help diagnose and treat this illness.

Our website offers a state-of-the-art prediction model that utilizes machine learning algorithms to analyze MRI scans and provide accurate predictions of Alzheimer's disease. Our model is based on extensive research and testing, and we are confident in its ability to provide reliable and accurate results.""";

String s2 = """At our website, we aim to make the process of predicting Alzheimer's disease as simple and user-friendly as possible. All you need to do is upload an MRI scan of the brain, and our model will analyze it to provide a prediction of whether or not the individual is likely to develop Alzheimer's disease in the future.

We understand that dealing with Alzheimer's disease can be overwhelming, and that's why we offer a range of resources and support to help individuals and their families cope with the condition. We are committed to providing the highest quality of care and support to our users, and we are always here to answer any questions or concerns that you may have.""";
Widget buildHomeScreenInfo(double w) {
  return Column(
    children: [
      const SizedBox(height: 50,),
      Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              width: w,
              child:DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 10),
                  animatedTexts: [
                    TypewriterAnimatedText(s1, speed: const Duration(milliseconds: 30)),
                    TypewriterAnimatedText(s2, speed: const Duration(milliseconds: 30)),
                    // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                    // TypewriterAnimatedText('Do not test bugs out, design them out'),
                  ],
                  // onTap: () {},
                ),
              ),
            ),
          ),
          const SizedBox(width: 30,),
        ],
      ),
      const SizedBox(width: 60,),
    ],
  );
}
/*
const Text(,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
 */
/*
Container(
        alignment: Alignment.topLeft, // height: ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children:const  [
              Spacer(),
              Text(
                "Some Text sssss Text Some Text Some Text",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft, // height: ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Spacer(),
              Text(
                "Some Text Some Text Some Text Some Text",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft, // height: ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children:const  [
              Spacer(),
              Text(
                "Some Text Some Text Some Text Some Text",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft, // height: ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Spacer(),
              Text(
                "Some Text Some Text Some Text Some Text",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
      ),
 */
/*
Welcome to our website dedicated to predicting Alzheimer's disease using MRI scans. We understand that Alzheimer's disease is a devastating condition that affects millions of people around the world, and we are committed to using the latest technology to help diagnose and treat this illness.

Our website offers a state-of-the-art prediction model that utilizes machine learning algorithms to analyze MRI scans and provide accurate predictions of Alzheimer's disease. Our model is based on extensive research and testing, and we are confident in its ability to provide reliable and accurate results.

At our website, we aim to make the process of predicting Alzheimer's disease as simple and user-friendly as possible. All you need to do is upload an MRI scan of the brain, and our model will analyze it to provide a prediction of whether or not the individual is likely to develop Alzheimer's disease in the future.

We understand that dealing with Alzheimer's disease can be overwhelming, and that's why we offer a range of resources and support to help individuals and their families cope with the condition. We are committed to providing the highest quality of care and support to our users, and we are always here to answer any questions or concerns that you may have.

We believe that early detection and intervention are crucial in the fight against Alzheimer's disease, and our website is dedicated to helping individuals and their families take proactive steps towards preventing and treating this illness. Thank you for choosing our website, and we look forward to serving you in the future.




Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: w,
                      child: const Text(
                        """

CNN stands for Convolutional Neural Network, which is a specific type of neural network commonly used in image and video recognition tasks.

In a CNN, the input image is passed through multiple layers of filters, each of which detects specific features of the image, such as edges or corners. The filters are learned during the training process using backpropagation, where the network adjusts its parameters to minimize the difference between the predicted output and the actual output.

The output of the convolutional layers is then fed into one or more fully connected layers, which are similar to those found in traditional neural networks. These layers use the features learned in the convolutional layers to make a prediction about the image, such as the objects it contains or the emotions it expresses.

CNNs have become a popular approach to image and video recognition tasks due to their ability to automatically learn and extract features from raw data, as well as their ability to scale to large datasets.
                    """,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      ),
                    ),
                  ),
 */