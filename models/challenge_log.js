var orm = require('../config/orm')

var challenge_log = {
    //Expecting newChallengeMember object that includes user_id and group_challenge_id
    createChallengeLog: function (newChallengeLog, callback) {
        let query = {
            table: 'challenge_log',
            data: newChallengeLog,
            debug: true
        };
        orm.insert(query, callback);
    }
};

module.exports = challenge_log;