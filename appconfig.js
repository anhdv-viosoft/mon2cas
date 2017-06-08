module.exports = {
    mongo: {
        url: 'mongodb://10.10.10.3:27017/validium' // MongoDB URL to connect for syncing the result
    },
    table: {
        name: 'ExecutingLogs',
        query: {
            event_type: { $in: [5,6]}, // RUN TESTCASE TYPE (5:run internal, 6 uploaded from external)
            status: 1, // PASSED status in executinglogs table
            $or: [
                {synced: { $exists: false }},
                {synced: null}
            ]            
        },
        limit: 100
    },
    cassandra: {
        contactPoints: ['10.10.10.7'],
        keyspace: 'validium_testresult',
        socketOptions: {
            connectTimeout: 60000,
            keepAlive: true,
            readTimeout: 60000
        } 
    }
}
