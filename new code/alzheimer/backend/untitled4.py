

import tkinter as tk
from tkinter import filedialog
from flask import Flask, request, jsonify

import base64
from PIL import Image
from io import BytesIO

app = Flask(__name__)
from PIL import Image

@app.route('/image', methods=['POST'])
def receive_image():
    # get the image data from the request
    image_data = request.form.get("image")
    # assuming 'image_string' is the string of bytes sent from the front end
    decoded_data = base64.b64decode(image_data)

    # create an Image object from the decoded bytes
    img = Image.open(BytesIO(decoded_data))

    # save the image to a file
    img.save('my_image.jpg')
    # do something with the image data
    # ...

    # return a response
    return jsonify({'message': 'Image received successfully'})

if __name__ == '__main__':
    app.run()
