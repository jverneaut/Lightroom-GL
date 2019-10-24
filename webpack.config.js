const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const globImporter = require('node-sass-glob-importer');

module.exports = {
  entry: ['./src/index.js'],
  output: {
    path: path.resolve(__dirname, 'public'),
    filename: 'bundle.js',
    publicPath: '/',
  },
  plugins: [
    new HtmlWebpackPlugin({
      inject: true,
      template: './src/index.html',
    }),
  ],
  module: {
    rules: [
      {
        test: /\.svelte$/,
        exclude: '/node_modules/',
        use: {
          loader: 'svelte-loader',
        },
      },
      {
        test: /\.js$/,
        exclude: '/node_modules/',
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.s?css$/,
        use: [
          'style-loader',
          'css-loader',
          {
            loader: 'sass-loader',
            options: {
              sassOptions: {
                importer: globImporter(),
              },
            },
          },
        ],
      },
      {
        test: /\.glsl$/,
        loader: 'webpack-glsl-loader',
      },
    ],
  },
};
