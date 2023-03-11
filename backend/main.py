import numpy as np  # linear algebra
import pandas as pd  # data processing, CSV file I/O (e.g. pd.read_csv)
import matplotlib.pyplot as plt
import seaborn as sn
from sklearn import metrics
from sklearn.cluster import KMeans
from sklearn import preprocessing
from sklearn.metrics import silhouette_score
from sklearn.decomposition import PCA
import tensorflow as tf 
import matplotlib.pyplot as plt 
import os 
import pathlib 
import random
from flask import Flask
from tensorflow.keras.utils import image_dataset_from_directory
from tensorflow.keras import layers
from flask import Flask


class genes_model:
    def __init__(self):
        self.kmeans = None
        self.min_samples = None
        self.clus = None
        self.correlation = None
        self.df1 = None
        self.df2 = None
        self.df3 = None
        self.ann = None
        self.df = None
        self.collist = None
        self.pred = None

    def run_model(self):
        self.read_data()
        self.df2 = self.df2[1:-1]
        # self.prepare_model()
        self.kmeans = KMeans(algorithm='auto', n_clusters=2, init='k-means++', n_init=10, max_iter=150, tol=0.0001,
                             random_state=42).fit(self.df2)
        print('kmeans score: {}'.format(silhouette_score(self.df2, self.kmeans.labels_, metric='euclidean')))
        # print(self.kmeans.fit_predict(pd.DataFrame([319.871200, 654.391660, 319.871400, 319.871500, 319.871450])))
        # self.plot_clusters()
        self.predict()
        self.pca_model()
        self.save_result()

    def read_data(self):
        self.collist = ['ID_REF', 'GSM701542', 'GSM701543', 'GSM701544', 'GSM701545', 'mutation', 'log 2 fold change']
        self.df = pd.read_csv("F:\\flutter\\alzheimer\\backend\\genes_dataset\\GSE28379 - GSE28379_series_matrix.csv",
                              usecols=self.collist)
        self.ann = pd.read_csv("F:\\flutter\\alzheimer\\backend\\genes_dataset\\gene.csv", usecols=['ID', 'Gene.symbol'])
        self.df3 = self.ann.merge(self.df, how='inner', left_on='ID', right_on='ID_REF')
        self.df2 = self.df[['GSM701542', 'GSM701543', 'GSM701544', 'GSM701545', 'mutation']]
        self.df1 = self.df2

    def test_gene_from_front(self, gene1, gene2, gene3, gene4, mutation):
        print(gene1, gene2, gene3, gene4, mutation)
        received = pd.DataFrame([gene1, gene2, gene3, gene4, mutation])
        print(received)
        result = self.kmeans.fit_predict(received)
        print(result)
        # result = pd.DataFrame(result)
        return f'{result}'

    def plot_correlation(self):
        """
            The correlation between different feature help to make the relationship
            among gene expression and mutation of different samples
        """
        self.correlation = self.df2.corr()
        plt.figure()
        sn.heatmap(self.correlation, vmax=1, square=True, annot=True, cmap='viridis')
        plt.title('Correlation between different fearures')
        sn.pairplot(self.df2, kind='reg', diag_kind='kde', height=4)

    def prepare_model(self):
        self.clus = []
        self.pred = []
        for i in range(1, 11):
            self.kmeans = KMeans(algorithm='auto', n_clusters=i, init='k-means++', n_init=i, max_iter=150, tol=0.0001,
                                 random_state=42).fit(self.df2)  # , verbose=0
            self.clus.append(self.kmeans.inertia_)
        self.min_samples = self.df2.shape[1] + 1
        # print('kmeans score: {}'.format(silhouette_score(self.df2, self.kmeans.labels_, metric='euclidean')))
        self.pred = [self.kmeans.labels_]
        print(self.pred)
        # print("Minimum number of samples=", self.min_samples)

    def plot_clusters(self):
        p1 = range(1, 11)
        import matplotlib.pyplot as plt2
        plt2.plot(p1, self.clus)
        plt2.xlabel('Number of clusters')
        plt2.title('The Elbow Method Graph')
        plt2.ylabel('clus')
        # plt2.show()
        plt2.savefig('../assets/images/clusters.jpg')
        plt2.close()

    def predict(self):
        # self.kmeans = KMeans(n_clusters=3, init='k-means++', n_init=10, max_iter=50, tol=0.0001,
        #                      random_state=42)
        y_kmeans = self.kmeans.fit_predict(self.df2)
        self.pred = pd.DataFrame(y_kmeans)
        self.df3['predicted'] = self.pred
        self.df3['predicted'].unique()
        self.df3 = self.df3.dropna(axis=0)

    def prep_pca(self, components, data, kmeans_labels):
        names = ['x', 'y', 'z']
        matrix = PCA(n_components=components).fit_transform(data)
        df_matrix = pd.DataFrame(matrix)
        df_matrix.rename({i: names[i] for i in range(components)}, axis=1, inplace=True)
        df_matrix['labels'] = kmeans_labels
        return df_matrix

    def pca_model(self):
        pca_df = self.prep_pca(2, self.df2, self.kmeans.labels_)
        sn.scatterplot(x=pca_df.x, y=pca_df.y, hue=pca_df.labels, palette="Set1")
        import matplotlib.pyplot as plt4
        plt4.scatter(self.kmeans.cluster_centers_[:, 0], self.kmeans.cluster_centers_[:, 1], s=50, c='k')
        # plt4.show()
        plt4.savefig('../assets/images/samples.jpg')
        import matplotlib.pyplot as plt5
        fig = plt5.figure(figsize=(10, 10))
        ax = fig.add_subplot(111, projection='3d')
        ax.scatter(pca_df.x, pca_df.y, pca_df.labels, s=20, c='b')
        str_labels = list(map(lambda label: '% s' % label, self.kmeans.labels_))
        list(map(lambda data1, data2, data3, str_label:
                 ax.text(data1, data2, data3, s=str_label, size=16,
                         zorder=10, color='k'), pca_df.x, pca_df.y,
                 pca_df.labels, str_labels))
        # plt2.show()
        plt5.savefig('../assets/images/data.jpg')

    def save_result(self):
        result = self.df3[['ID', 'predicted', 'Gene.symbol']]
        result.to_csv('output.csv', index=False)

class mri_model:
    def __init__(self):
        self.batch_size = 32
        self.img_height = 224
        self.img_width = 224
        self.epochs = 1
        print("Create object")
        return
    
    def run_model(self):
        self.read_training_data('F:/flutter/alzheimer/backend/mri_dataset/')
        self.plot_random_sample() 
        self.prepare_training_data()
        self.build_model()
        self.compile_model()
        self.fit_model()
        self.plot_result()
    
    def read_training_data(self, path):
        self.data_dir = pathlib.Path(path) 
        self.class_names = np.array([sorted(item.name for item in self.data_dir.glob("*"))])
        imageCount = len(list(self.data_dir.glob("*/*.jpg") ))
        print(f'number of images: {imageCount}')
        return
    
    def plot(self, path,class_name):
        print(path)
        plt.figure(figsize=(8,8))
        
        img = plt.imread(path)
        
        plt.xticks([])
        plt.yticks([])
        plt.title("Class Name: "+class_name)
        plt.imshow(img)
        
    def plot_random_sample(self):
        Mild_Demented = random.choice(list(self.data_dir.glob("MildDemented/*.jpg")))

        self.plot(str(Mild_Demented),"MildDemented")

        Moderate_Demented = random.choice(list(self.data_dir.glob("ModerateDemented/*.jpg")))

        self.plot(str(Moderate_Demented),"Moderate_Demented")

        Non_Demented = random.choice(list(self.data_dir.glob("NonDemented/*.jpg")))

        self.plot(str(Non_Demented),"Non_Demented")

        Very_Mild_Demented = random.choice(list(self.data_dir.glob("VeryMildDemented/*.jpg")))

        self.plot(str(Very_Mild_Demented),"Very_Mild_Demented")
        return
    def prepare_training_data(self):
        self.train_data = image_dataset_from_directory(
                          self.data_dir,
                          validation_split=0.2,
                          subset="training",
                          seed=123,
                          image_size=(self.img_height, self.img_width),
                          batch_size=self.batch_size)
        self.val_data = image_dataset_from_directory(self.data_dir,
                                                validation_split=0.2,
                                                subset="validation",
                                                seed=123,
                                                image_size=(self.img_height, self.img_width),
                                                batch_size=self.batch_size)
        return
    
    def build_model(self):
        self.model = tf.keras.Sequential([
            
           layers.Rescaling(1./255, input_shape=(self.img_height, self.img_width, 3)),
            
          layers.Conv2D(16, 3, padding='same', activation='relu'),
          layers.MaxPooling2D(),
            
          layers.Conv2D(32, 3, padding='same', activation='relu'),
          layers.MaxPooling2D(),
            
          layers.Conv2D(64, 3, padding='same', activation='relu'),
          layers.MaxPooling2D(),
            
          layers.Dropout(0.5),
          layers.Flatten(),
            
          layers.Dense(128, activation='relu'),
          layers.Dense(4,activation="softmax")
        ])
        return
    
    def compile_model(self):
        #Compile the model
        self.model.compile(optimizer="Adam",
                    loss=tf.keras.losses.SparseCategoricalCrossentropy(),
                    metrics=["accuracy"])
        #Fit the model
    def fit_model(self):      
        self.history = self.model.fit(self.train_data,
                            epochs=self.epochs,
                            validation_data=self.val_data, 
                            batch_size=self.batch_size)
    def plot_result(self):
        # Plot the result
        acc = self.history.history['accuracy']
        val_acc =  self.history.history['val_accuracy']

        loss = self.history.history['loss']
        val_loss = self.history.history['val_loss']

        epochs_range = range(self.epochs)

        plt.figure(figsize=(8,8))
        plt.subplot(1,2,1)
        plt.plot(epochs_range,acc,label='Accuracy')
        plt.plot(epochs_range,val_acc,label="Validation Accuracy")
        plt.legend()

        plt.subplot(1,2,2)
        plt.plot(epochs_range,loss,label='Loss')
        plt.plot(epochs_range,val_loss,label="Validation Loss")
        plt.legend()
        plt.show()
        return
    def predict(self, path):
        data_dir = pathlib.Path(path)
        value_data = image_dataset_from_directory(data_dir,
                                            validation_split=0.2,
                                            subset="validation",
                                            seed=123,
                                            image_size=(self.img_height,self.img_width),
                                            batch_size=self.batch_size)
        

        plt.figure(figsize=(20, 20))
        result = ' | True'
        imageCount = len(list(self.data_dir.glob("*/*.jpg") ))
        #number_of_images = len(np.concatenate([i for x, i in value_data], axis=0))
        for images, labels in value_data.take(1):
            for i in range(imageCount):
                ax = plt.subplot(5, 5, i + 1)
                img = images[i].numpy().astype("uint8")
                img = tf.expand_dims(img, axis=0)
                
                predictions = self.model.predict(img)
                predicted_class = np.argmax(predictions)
                if value_data.class_names[predicted_class] == value_data.class_names[labels[i]]:
                    result = ' | True'
                plt.savefig('test.png')
                print(type(images[i]))
                plt.imshow(images[i].numpy().astype("uint8"))
                plt.title(value_data.class_names[predicted_class]+result  )
                plt.axis("off")
                
                
g_model = genes_model()            
g_model.run_model()
mri = mri_model()
mri.run_model()
mri.predict('F:/test/')

import logging
import threading
import time

app = Flask(__name__)
@app.route("/genes/test/<g1>/<g2>/<g3>/<g4>/<mu>", methods=['POST', 'GET'])
def genes_test(g1, g2, g3, g4, mu):
    res = g_model.test_gene_from_front(float(g1), float(g2), float(g3), float(g4), float(mu))
    return {"response": res}

@app.route("/mri/test/<path>", methods=['POST', 'GET'])
def mri_test(path):
    path = path.replace(',', '/')
    print(path)
    predict('F:/test/')
    print("DNE")
    return {"response": "res"}
app.run(debug=False)
#
def thread_function(name):
    
    logging.info("Thread %s: starting", name)
    #time.sleep(2)
    predict('F:/test/')
    logging.info("Thread %s: finishing", name)
x = threading.Thread(target=thread_function, args=(1,))
x.start()
from PIL import Image

def predict( path):
    data_dir = pathlib.Path(path)
    value_data = image_dataset_from_directory(data_dir,
                                        validation_split=0.2,
                                        subset="validation",
                                        seed=123,
                                        image_size=(224,224),
                                        batch_size=32)
    

    #plt.figure(figsize=(20, 20))
    result = ' | True'
    imageCount = len(list(data_dir.glob("*/*.jpg") ))
    #number_of_images = len(np.concatenate([i for x, i in value_data], axis=0))
    for images, labels in value_data.take(1):
        for i in range(imageCount):
            ax = plt.subplot(5, 5, i + 1)
            img = images[i].numpy().astype("uint8")
            img = tf.expand_dims(img, axis=0)
            
            predictions = mri.model.predict(img)
            predicted_class = np.argmax(predictions)
            if value_data.class_names[predicted_class] == value_data.class_names[labels[i]]:
                result = ' | True'
            print(type(images[i]))
            im = Image.fromarray(images[i].numpy().astype("uint8"))
            im.save("test.png")
            #plt.imshow(images[i].numpy().astype("uint8"))
            #plt.title(value_data.class_names[predicted_class]+result  )
            #plt.axis("off")
    print("YESSSSSSSSSSSS")
predict('F:/test/')


import firebase_admin
  
# Importing Image module from PIL package 





