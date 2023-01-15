import os
from flask import Flask,render_template,request
from werkzeug.utils import secure_filename

app = Flask(__name__)
UPLOAD_FOLDER = 'upload_folder/'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/')
def root_page():
    return 'it''s root'

@app.route('/upload')
#@app.route('/')
def upload():
    return render_template('upload.html')


@app.route('/upload_file',methods=['POST'])
def upload_file():
    if request.method == 'POST':
        files = request.files.getlist('file')
        for file in files:
            file.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(file.filename)))
        return 'file uploaded successfully'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
