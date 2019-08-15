var user = require("./user_controller");
var authorizer = require("./middleware/authenticate");

module.exports = function(app) {
    app.post("/api/user", function(request, response) {
        user.create(request, response);
    });
    app.post("/api/user/login", function(request, response) {
        user.login(request, response);
    });
    app.delete("/api/user/login", function(request, response) {
        user.logout(request, response);
    });
    app.get("/api/user", authorizer.authenticate, function(request, response) {
        user.getUserBySession(request, response);
    });
    app.get("/api/user/:id", authorizer.authenticate, function(request, response) {
        user.getUserByID(request, response);
    });
};