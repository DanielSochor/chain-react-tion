let orm = require('../config/orm');

let users = {
    insertNew: function(user, callback){
        user.email = user.email.toLowerCase();
        let query = {
            table: 'users',
            data: user
        };
        orm.insert(query, callback);
    },
    selectByEmail: function(email, callback){
        let query = {
            table: 'users',
            where: [{email: email.toLowerCase()}]
        };
        orm.select(query, callback);
    },
    selectByUsername: function(username, callback){
        let query = {
            table: 'users',
            where: [{username: username}]
        };
        orm.select(query, callback);
    },
    updateSession: function(email, uuid, callback){
        let query = {
            table: 'users',
            data: {session_token: uuid},
            where: [{email: email.toLowerCase()}]
        };
        orm.update(query, callback);
    },
    removeSession: function(session, callback){
        let query = {
            table: 'users',
            data: {session: null},
            where: [{session_token: session}]
        };
        orm.update(query, callback);
    },
    getMyself: function(session, callback){
        let query = {
            table: 'users',
            columns: ['email', 'user_id', 'created'],
            //columns: ['email', 'user_id', 'created', 'modified'],
            where: [{session_token: session}]
        };
        orm.select(query, callback);
    },
    getUserByID: function(id, callback){
        let query = {
            table: 'users',
            columns: ['email', 'user_id', 'created'],
            //columns: ['email', 'user_id', 'created', 'modified'],
            where: [{user_id: id}]
        };
        orm.select(query, callback);
    }
};

module.exports = users;