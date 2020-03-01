from flask import Flask, render_template
from flask_socketio import SocketIO
from flask_socketio import send, emit
from flask_cors import CORS
import json



app = Flask(__name__)
app.config['SECRET_KEY'] = 'vnkdjnfjknfl1232#'
socketio = SocketIO(app, cors_allowed_origins="*")
cors = CORS(app)


@app.route('/login')
def login():
    socketio.emit('message', {"a":"A"})
    return 'indexxx'

def messageReceived(methods=['GET', 'POST']):
    print('message was received!!!')

@socketio.on('connect')
def test_connect():
    print('user connected')

@socketio.on('message', namespace='/test')
def handle_message(message):

    my_list = ["Thisuru", "Uber", "PickMe"]

    # print('received message: ' + message)
    # if message == 'Request from flutter':
    #     for list_data in my_list:
    #         print(list_data)
    #         send(list_data)
    # send(json.dumps(my_list).encode())   
    send(my_list)


@socketio.on('my event', namespace='/test')
def handle_my_custom_event(json, methods=['GET', 'POST']):
    print('received my event: ' + str(json))
    send('fashghbnjkm')

if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0')