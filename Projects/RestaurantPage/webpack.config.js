const path = require('path');


module.exports = {
  entry: './src/index.js',
  output:{
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },

  watchOptions: {
  poll: true, //webpack will watch any changes and rerun
  ignored: /node_modules/ // ignore this folder
  },

  module: {
      rules: [
        {
          test: /\.css$/i,
          use: ['style-loader','css-loader'],
        },
        {
          test: /\.(jpe?g|png|gif|svg)$/i,
          loader: 'url-loader'
        }
      ],
  },

};
