module.exports = {
    publicPath: './',
    productionSourceMap: true,
    devServer:{
      // 这里填IP地址
      port: 8080,
      open: true, //浏览器自动打开页面
      proxy: {
        "/api": {
          target: "http://127.0.0.1:3100",//只要是以/api开头的链接都会被代理到 这个target属性所代表的位置（我这里是：https://www.666.com）
          ws: false,
          changeOrigin: true,
          cookieDomainRewrite: {
            "*": ""
          },
          cookiePathRewrite: {
            "*": ""
          },
          pathRewrite: {
            "^/api": ""  //这里是将/api替换为空字符串“” ，也就是删除的意思
          }
        }
    }
}
}