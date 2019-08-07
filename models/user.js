var orm = require('../config/orm')

var user = {
    //Expecting newUser object that includes username, email and password
    createUser: function (newUser, callback) {
        let query = {
            table: 'users',
            data: newUser,
            debug: true
        };
        orm.insert(query, callback);
    }
};

module.exports = user;