var user = require("./user");
var authorizer = require("./middleware/authorizer");

module.exports = function(app) {
    app.post("/api/user", function(request, response) {
        console.log('request is');
        console.log(request.body);
        user.create(request, response);
    });
    app.post("/api/user/login", function(request, response) {
        user.login(request, response);
    });
    app.delete("/api/user/login", function(request, response) {
        user.logout(request, response);
    });
    app.get("/api/user", authorizer.authenticate, function(request, response) {
        console.log('user 2');
        user.getMyself(request, response);
    });
    app.get("/api/user/:id", authorizer.authenticate, function(request, response) {
        user.getUserByID(request, response);
    });
};