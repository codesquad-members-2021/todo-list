const { createProxyMiddleware } = require('http-proxy-middleware');

const aws = {
    target: 'http://ec2-52-78-163-242.ap-northeast-2.compute.amazonaws.com:8080',
    changeOrigin: true,
}

module.exports = function (app) {
    app.use(
        '/projects',
        createProxyMiddleware(aws)
    ),
    app.use(
        '/notes',
        createProxyMiddleware(aws)
    ),
    app.use(
        '/cards',
        createProxyMiddleware(aws)
    )
};

// app.use('/', index);
