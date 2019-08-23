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

    getUserRunningDistLogs: function ({user_id, group_challenge_id}, callback) {
        let query = {
            table: 'running_distance_logs',
            where: [{user_id: user_id}, {group_challenge_id: group_challenge_id}],
            debug: true
        };
        orm.select(query, callback);
    },

    getRunningDistLogs: function (group_challenge_id, callback) {
        
        let queryString = `SELECT 
            group_challenges.id as group_challenge_id,
            users.username, 
            SUM(running_distance) AS running_distance, 
            user_id
        FROM 
            group_challenges
        INNER JOIN
            running_distance_logs
        ON
            group_challenges.id = running_distance_logs.group_challenge_id
        INNER JOIN 
            users 
        ON 
            users.id = running_distance_logs.user_id
        WHERE 
            group_challenges.id = ?
        GROUP BY username
        ORDER BY  running_distance DESC;`
        let queryCondition = [group_challenge_id];
        orm.query(queryString, queryCondition, callback);
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
        let queryString = `SELECT 
        group_challenges.id as group_challenge_id,
        users.username, 
        running_pace, 
        user_id
    FROM 
        group_challenges
    INNER JOIN
        running_pace_logs
    ON
        group_challenges.id = running_pace_logs.group_challenge_id
    INNER JOIN 
        users 
    ON 
        users.id = running_pace_logs.user_id
    WHERE 
        group_challenges.id = ?;`
    let queryCondition = [group_challenge_id];
    orm.query(queryString, queryCondition, callback);
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
        let queryString = `SELECT 
        group_challenges.id as group_challenge_id,
        users.username, 
        biking_pace, 
        user_id
    FROM 
        group_challenges
    INNER JOIN
        biking_pace_logs
    ON
        group_challenges.id = running_pace_logs.group_challenge_id
    INNER JOIN 
        users 
    ON 
        users.id = biking_pace_logs.user_id
    WHERE 
        group_challenges.id = ?;`
    let queryCondition = [group_challenge_id];
    orm.query(queryString, queryCondition, callback);
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
        let queryString = `SELECT 
            group_challenges.id as group_challenge_id,
            users.username, 
            SUM(biking_distance) AS biking_distance, 
            user_id
        FROM 
            group_challenges
        INNER JOIN
            biking_distance_logs
        ON
            group_challenges.id = biking_distance_logs.group_challenge_id
        INNER JOIN 
            users 
        ON 
            users.id = biking_distance_logs.user_id
        WHERE 
            group_challenges.id = ?
        GROUP BY username
        ORDER BY  biking_distance DESC;`
    let queryCondition = [group_challenge_id];
    orm.query(queryString, queryCondition, callback);
    }


};

module.exports = challenge_log;