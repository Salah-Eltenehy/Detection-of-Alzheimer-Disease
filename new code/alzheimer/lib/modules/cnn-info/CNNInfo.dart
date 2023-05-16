import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/constants/Constants.dart';

class CNNInfo extends StatefulWidget {
  @override
  State<CNNInfo> createState() => _CNNInfoState();
}

class _CNNInfoState extends State<CNNInfo> {
  _launchURL() async {
    const url = 'https://playground.tensorflow.org/#activation=tanh&batchSize=10&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=0&networkShape=4,2&seed=0.15044&showTestData=false&discretize=false&percTrainData=50&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width * 800) / 1366;
    return Scaffold(
      body: Stack(
        children:  [
          const Image(
            image: AssetImage('assets/images/mri-info.jpeg'),
            fit: BoxFit.cover,
            width:double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "What is Deep Learning ?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: w,
                      child: const Text(
                        """
                    
Deep learning is a subfield of machine learning that uses algorithms inspired by the structure and function of the human brain, called artificial neural networks, to learn from large amounts of data. It involves training deep neural networks, which are composed of multiple layers of interconnected nodes, to recognize patterns and make predictions. 

Deep learning has been applied to various tasks such as image and speech recognition, natural language processing, and autonomous driving. Its success is largely due to its ability to learn complex representations of data that would be difficult or impossible for humans to program manually. 

In summary, deep learning is a type of machine learning that uses neural networks with multiple layers to learn and recognize complex patterns in data.
                    """,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "What is CNN ?",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 14,),
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
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: TextButton(
                          onPressed: _launchURL,
                          child: const Text(
                            'Simulation for CNN',
                            style: TextStyle(color: Color.fromRGBO(217, 0, 175, 0.5019607843137255), fontSize: 30),

                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
