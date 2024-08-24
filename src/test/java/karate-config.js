function fn() {
    var env = karate.env;
    karate.log('karate.env system property', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env;
        myVarName: 'someValue';
    }

    return config;

}