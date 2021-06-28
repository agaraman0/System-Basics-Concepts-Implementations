const utils = require('./hashing_utils');

const serverSet1 = [
    'server0',
    'server1',
    'server2',
    'server3',
    'server4',
    'server5',
    'server6',
    'server7',
]

const serverSet2 = [
    'server0',
    'server1',
    'server2',
    'server3',
]

const usernames = [
    'username0',
    'username1',
    'username2',
    'username3',
    'username4',
    'username5',
    'username6',
    'username7',
    'username8',
    'username9',
    'username10',
    'username11',
    'username12',
    'username13',
    'username14',
    'username15',
    'username16',
    'username17',
    'username18',
    'username19',
    'username20',
    'username21',
    'username22',
    'username23',
    'username24',
    'username25',
    'username26',
    'username27',
    'username28',
    'username29',
]

function pickServerSimple(username, servers) {
    const hash = utils.hashString(username)
    // console.log(hash)
    return servers[hash % servers.length]
}

function pickServerRendezvous(username, servers) {
    let maxServer = null;
    let maxScore = null;
    for(const server of servers) {
        const score =  utils.computeScore(username,server);
        if (maxScore === null || score > maxScore) {
            maxScore = score
            maxServer = server
        }
    }
    // console.log(maxServer)
    return maxServer
}

console.log("Simple Hashing Stratergy: ")
countSimple = 0
for(const username of usernames) {
    const server1 = pickServerSimple(username, serverSet1)
    const server2 = pickServerSimple(username, serverSet2)
    const serverSetEqual = server1 == server2
    if(serverSetEqual){countSimple+=1}
    console.log(` ${username}: ${server1} => ${server2} | equal: ${serverSetEqual}`)
}

console.log("Rendezvous Hashing Stratergy: ")
countRanderzvous = 0
for(const username of usernames) {
    const server1 = pickServerRendezvous(username, serverSet1)
    const server2 = pickServerRendezvous(username, serverSet2)
    const serverSetEqual = server1 == server2
    if(serverSetEqual){countRanderzvous+=1}
    console.log(` ${username}: ${server1} => ${server2} | equal: ${serverSetEqual}`)
}

console.log(countSimple,countRanderzvous)