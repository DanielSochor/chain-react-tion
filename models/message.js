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

    allChallengeMessages: function (group_challenge_id, callback) {
        let queryString = `SELECT
        messages.id,
        messages.message_body, 
        messages.createdAt, 
        messages.user_id,
        users.username
    FROM 
        messages
    INNER JOIN
    
    users
        
    ON
        messages.user_id = users.id
    WHERE 
        messages.group_challenge_id = ? 
    ORDER By createdAt asc;`
    let queryCondition = [group_challenge_id];
    orm.query(queryString, queryCondition, callback);
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