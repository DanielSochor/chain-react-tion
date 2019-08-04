var orm = require('../config/orm')

var message = {
    //Expecting newMessage object that includes a body, challenge_id and user_id
    createMessage: function (newMessage, callback) {
        let query = {
            table: 'messages',
            data: newMessage,
            debug: true
        };
        orm.insert(query, callback);
    },

    allChallengeMessages: function (challenge_id, callback) {
        let query = {
            table: 'messages',
            where: [{challenge_id: challenge_id}],
            debug: true

        };
        orm.select(query, callback);
    },

    deleteMessage: function (message_id, callback){
        let query = {
            table: 'messages',
            where: [{id: message_id}],
            debug: true
        };
        console.log("Deleted Message: " + message_id)
        orm.delete(query, callback)
    }
};

module.exports = message;