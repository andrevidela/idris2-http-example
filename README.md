# Idris Web Development Sample Project

This repo illustrates how to use idris for web development by making a basic HTTP request from a very basic
frontend sending dummy requests to a basic backend.

This project uses [pack](https://github.com/stefan-hoeck/idris2-pack/tree/main) for dependency management

## How to Build the Backend

Go into `/backend` and run `build example-backend.ipkg`. This will compile the project using the `node`
backend and result in an executable in `build/exec` called `example-backend`. You can run the server by
running this executable with `./build/exec/example-backend`.

Here are all the steps together:

```
cd backend
pack build example-backend.ipkg
./build/exec/example-backend
```

It should display nothing and appear stuck. Requests will appear once we send them.

## How to Build the Frontend

Leave the backend running and open a new terminal window. Go into `/frontend` and run `build example-frontend.ipkg`.
This will compile the frontend into a javascript
file that you can insert in your web page. Once compiled, your javascript file should be in `build/exec` and
is called `lib.js`. You can add it as a script with `<script src="build/exec/lib.js></script>`. You can then
run your frontend by opening `index.html` in your favorite browser and see the requests sent and recieved by
the backend in the console where it is running.

Here are all the steps

```
cd frontend
pack build example-frontend.ipkg
# on mac os you can do :
# open index.html
```

After opening your HTML file you should see the two requests in the console where the backend is running:

```
GET
"/"
[("host", "localhost:8080"), ("sec-fetch-site", "cross-site"), ("origin", "null"), ("connection", "keep-alive"), ("sec-fetch-mode", "cors"), ("accept", "*/*"), ("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Safari/605.1.15"), ("accept-language", "en-GB,en;q=0.9"), ("sec-fetch-dest", "empty"), ("accept-encoding", "gzip, deflate")]
POST
"/"
[("host", "localhost:8080"), ("accept", "*/*"), ("sec-fetch-site", "cross-site"), ("accept-encoding", "gzip, deflate"), ("accept-language", "en-GB,en;q=0.9"), ("sec-fetch-mode", "cors"), ("content-type", "text/plain"), ("origin", "null"), ("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Safari/605.1.15"), ("connection", "keep-alive"), ("content-length", "5"), ("sec-fetch-dest", "empty")]
```
