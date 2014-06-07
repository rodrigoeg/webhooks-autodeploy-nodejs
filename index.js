var nconf, gitlabhook, gitlab, logger, glh;

nconf      = require('nconf');
gitlabhook = require('gitlabhook');

nconf.argv().env();
nconf.defaults({
    'server-port': 8080
});

logger = {
    'info' :  console.log,
    'error': console.log
};

glh = {
    'port'  : nconf.get('server-port'),
    'host'  : '0.0.0.0',
    'logger': logger
};

gitlab = gitlabhook(glh);

gitlab.listen();
