//sets express equal to the single function that the express module exports
const express = require("express");
//express() is a function which we invoke with the variable app
const app = express();


const path = require("path");
const PORT = process.env.PORT || 3001;


// Define middleware here
// we can invoke app.use(<specific_middleware_layer_here>) for every middleware layer we want to use
// and it will add these layers to our middleware stack
// each middleware layer is esstentially adding a functiom that specifically handles something to your flow through middleware

// bind application-level middleware to an instance of the app object by using the app.use() 
// these are built in middleware functions
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// Serve up static assets (usually on heroku)
if (process.env.NODE_ENV === "production") {
  app.use(express.static("client/build"));
}

// Define API routes here
require("./routes")(app);

// Send every other request to the React app
// Define any API routes before this runs
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "./client/build/index.html"));
});

app.listen(PORT, () => {
  console.log(`🌎 ==> API server now on port ${PORT}!`);
});

