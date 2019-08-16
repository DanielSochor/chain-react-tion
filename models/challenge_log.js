var orm = require('../config/orm')

var challenge_log = {
    //Expecting newChallengeLog object that includes user_id and group_challenge_id
    createRunningDistLog: function (newChallengeLog, callback) {
        let query = {
            table: 'running_distance_logs',
            data: newChallengeLog,
            debug: true
        };
        orm.insert(query, callback);
    },

    getRunningDistLogs: function (group_challenge_id, callback) {
        let query = {
            table: 'running_distance_logs',
            where: [{group_challenge_id:group_challenge_id}],
            debug: true
        };
        orm.select(query, callback);
    },

    createRunningPaceLog: function (newChallengeLog, callback) {
        let query = {
            table: 'running_pace_logs',
            data: newChallengeLog,
            debug: true
        };
        orm.insert(query, callback);
    },

    getRunningPaceLogs: function (group_challenge_id, callback) {
        let query = {
            table: 'running_pace_logs',
            where: [{group_challenge_id:group_challenge_id}],
            debug: true
        };
        orm.select(query, callback);
    },

    createBikingPaceLog: function (newChallengeLog, callback) {
        let query = {
            table: 'biking_pace_logs',
            data: newChallengeLog,
            debug: true
        };
        orm.insert(query, callback);
    },

    getBikingPaceLogs: function (group_challenge_id, callback) {
        let query = {
            table: 'biking_pace_logs',
            where: [{group_challenge_id:group_challenge_id}],
            debug: true
        };
        orm.select(query, callback);
    },

    createBikingDistLog: function (newChallengeLog, callback) {
        let query = {
            table: 'biking_distance_logs',
            data: newChallengeLog,
            debug: true
        };
        orm.insert(query, callback);
    },

    getBikingDistLogs: function (group_challenge_id, callback) {
        let query = {
            table: 'biking_distance_logs',
            where: [{group_challenge_id:group_challenge_id}],
            debug: true
        };
        orm.select(query, callback);
    }


};

module.exports = challenge_log;