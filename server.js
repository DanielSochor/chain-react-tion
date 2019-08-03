//loads environmental variables into process.env global variable injected by node at runtime
require('dotenv').config();

//sets express equal to the single function that the express module exports
const express = require("express");
//express() is a function which we invoke with the constant app
//creates an Express application. The express() function is a top-level function exported by the express module
const app = express();

const path = require("path");
//use whatever is in the environment variable PORT, or 3000 if there's nothing there.
//when hosting your application on another service (like Heroku, Nodejitsu, and AWS), your host may independently configure the process.env.PORT variable for you; after all, your script runs in their environment.
const PORT = process.env.PORT || 3001;

// Define middleware here
// we can invoke app.use(<specific_middleware_layer_here>) for every middleware layer we want to use
// and it will add these layers to our middleware stack
// each middleware layer is esstentially adding a functiom that specifically handles something to your flow through middleware

// bind application-level middleware to an instance of the app object by using the app.use() 
// these are built in middleware functions
// this is built-in middleware function in Express that parses incoming requests with urlencoded payloads
// URL encoding converts characters into a format that can be transmitted over the Internet
// when set to true, the URL-encoded data will parsed with the qs library instead of the querystring library
app.use(express.urlencoded({ extended: true }));
// this is a built-in middleware function in Express. It parses incoming requests with JSON payloads
app.use(express.json());
// Serve up static assets (usually on heroku)
if (process.env.NODE_ENV === "production") {
  app.use(express.static("client/build"));
}
const env = process.env.NODE_ENV || 'development';

//path.join returns a normalized path by merging two paths together
//__dirname gives you the path of the currently running file.
const reactConfig = require(path.join(__dirname, './config/config.static.json'))[env];

app.use(express.static(path.join(__dirname, reactConfig))); // serving react files

var config = require('./config/config');

// Define API routes here
require("./controllers/routes")(app);

// Send every other request to the React app
// Define any API routes before this runs
// app.get("*", (req, res) => {
//   res.sendFile(path.join(__dirname, "./client/build/index.html"));
// });

// app.get('/', function(req, res, next) {
//   res.send('API is working properly');
// });

app.listen(PORT, () => {
  console.log(`🌎 ==> API server now on port ${PORT}!`);
});

