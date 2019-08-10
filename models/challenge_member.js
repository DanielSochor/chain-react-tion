var orm = require('../config/orm')

var challenge_member = {

    //Expecting newChallengeMember object that includes user_id and group_challenge_id
    createChallengeMember: function (newChallengeMember, callback) {
        let query = {
            table: 'challenge_members',
            data: newChallengeMember,
            debug: true
        };
        orm.insert(query, callback);
    },

    deleteChallengeMember: function ({user_id, group_challenge_id}, callback){
        let query = {
            table: 'challenge_members',
            where: [{user_id: user_id},{group_challenge_id: group_challenge_id}],
            debug: true
        };
        orm.delete(query, callback)
    },
};

module.exports = challenge_member;