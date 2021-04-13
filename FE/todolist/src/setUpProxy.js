const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function (app) {
    app.use(
        '/notes',
        createProxyMiddleware({
            target: 'http://ec2-52-78-163-242.ap-northeast-2.compute.amazonaws.com:8080',
            changeOrigin: true,
        })
    )
};
