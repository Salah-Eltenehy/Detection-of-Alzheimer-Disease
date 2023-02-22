import 'package:flutter/material.dart';

import '../../shared/constants/Constants.dart';

class ModelInformationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Information'),
      ),
      body: Center(
        child: Container(
          width: PAGEWIDTH,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[100]
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: const [
                Text(
                    'About algorithm used',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'Information about Kmeans clustring \n//TODO'
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'About Number of Clusters',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 300,
                  height: 400,
                  child:  Image(
                    fit: BoxFit.fill,
                      image: AssetImage('assets/images/clusters.jpg'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
'''
As we mention above. KMeans algorithm depends on number of clusters. But actually we don\'t know the
optimal number of clusters for our dataset. So we user Elbow method which is a graphical method to know the optimal number
of clusters. As in the above image: the optimal number is 3. Why 3?\nScientists do experiments about that and conclude that ...//TODO   
'''
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'About Clusters',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 400,
                  child:  Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/clusters.jpg'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    '''
As we mention above. KMeans algorithm depends on number of clusters. But actually we don\'t know the
optimal number of clusters for our dataset. So we user Elbow method which is a graphical method to know the optimal number
of clusters. As in the above image: the optimal number is 3. Why 3?\nScientists do experiments about that and conclude that ...//TODO   
'''
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
