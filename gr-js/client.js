/**
 *
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

const { HelloRequest, HelloReply } = require('../proto/hello_pb.js');
const { GreeterClient } = require('../proto/hello_grpc_web_pb.js');

// var client = new GreeterClient('http://' + window.location.hostname + ':50051',
var client = new GreeterClient('http://' + window.location.hostname + ':9981',
    null, null);

// simple unary call
var request = new HelloRequest();
request.setName('World');

client.sayHello(request, {}, (err, response) => {
    if (err) {
        console.log(`Unexpected error for sayHello: code = ${err.code}` +
            `, message = "${err.message}"`);
    } else {
        console.log(response.getMessage());
    }
});
