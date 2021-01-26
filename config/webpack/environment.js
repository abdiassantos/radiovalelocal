const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const webpack = require("webpack")

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    jquery: "jquery",
    "window.jQuery": "jquery",
    "window.$": "jquery",
    Popper: ["popper.js", "default"]
  })
)

environment.loaders.prepend('vue', vue)
environment.config.resolve.alias = { 'vue$': 'vue/dist/vue.esm.js' }; // <- add alias
module.exports = environment
